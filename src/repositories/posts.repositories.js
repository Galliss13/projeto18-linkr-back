import { db } from "../database/db.js";

export async function getPostById(id) {
  const post = await db.query(
    `
    SELECT * FROM posts 
    WHERE id = $1;
    `,
    [id]
  );
  return post.rows[0] ? post.rows[0] : undefined;
}

export function insertPostAndReturnId(post) {
  return db.query(
    `
    INSERT INTO posts 
    ("userId", link, text, "createdAt") 
    VALUES 
    ($1, $2, $3, $4) 
    RETURNING id`,
    [post.userId, post.link, post.text, post.createdAt]
  );
}

export function  deletePostById(id) {
  return db.query(
    `
    DELETE FROM posts 
    WHERE id=$1 
    `,
    [id]
  );
}

export async function updatePost(text, id) {
  return db.query(
    `
    UPDATE posts 
    SET text = $1
    WHERE id = $2
    `,
    [text, id]
  );
}
export function getPostsList() {
  return db.query(
    `
    SELECT 
      x.*, 
      u.name, 
      u."imageUrl", 
      COALESCE( (SELECT COUNT(likes.id) FROM likes WHERE likes."postId" = x."id"), 0) as likes
    FROM 
    (SELECT p1.id,
        p1."userId",
        p1.link,
        p1.text,
        p1."createdAt",
        false AS "isRepost",
        0 AS "originalPostId",
        0 AS "originalUserId"
        FROM posts p1
      UNION ALL
      SELECT r1.id,
             r1."userId",
             p2.link,
             p2.text,
             r1."repostedAt" as "createdAt",
             true AS "isRepost",
             p2.id AS "originalPostId",
             p2."userId" AS "originalUserId"
             FROM reposts r1
                  INNER JOIN posts p2
                             ON p2.id = r1."postId"
             ) x JOIN users u ON x."userId" = u.id
      ORDER BY x."createdAt" DESC
      LIMIT 20;
    `
  );
}

export function getUserPostsList(id) {
  return db.query(
    `
    SELECT 
      x.*, 
      u.name, 
      u."imageUrl", 
      COALESCE( (SELECT COUNT(likes.id) FROM likes WHERE likes."postId" = x."id"), 0) as likes
    FROM 
    (SELECT p1.id,
        p1."userId",
        p1.link,
        p1.text,
        p1."createdAt",
        false AS "isRepost",
        0 AS "originalPostId",
        0 AS "originalUserId"
        FROM posts p1
      UNION ALL
      SELECT r1.id,
             r1."userId",
             p2.link,
             p2.text,
             r1."repostedAt" as "createdAt",
             true AS "isRepost",
             p2.id AS "originalPostId",
             p2."userId" AS "originalUserId"
             FROM reposts r1
                  INNER JOIN posts p2
                             ON p2.id = r1."postId"
             ) x JOIN users u ON x."userId" = u.id
      WHERE x."userId" = $1
      ORDER BY x."createdAt" DESC;`,
    [id]
  );
}

export function getHashtagPosts(hashtagName) {
  const hashtag = "#" + hashtagName;
  return db.query(
    `
    SELECT 
    p."id", 
	  p."link", 
	  p."text", 
	  p."createdAt", 
	  users."name",
	  users."imageUrl",
    COALESCE( (SELECT COUNT(likes.id) FROM likes WHERE likes."postId" = p."id"), 0) as likes
  FROM hashtags h 
  JOIN "hashtagUse" u ON h.id = u."hashtagId"
  JOIN posts p ON u."postId" = p.id
  JOIN users ON p."userId" = users.id
  WHERE h.hashtag = $1
  GROUP BY p.id, users.name, users."imageUrl"
  ORDER BY p."createdAt" DESC
  `,
    [hashtag]
  );
}
