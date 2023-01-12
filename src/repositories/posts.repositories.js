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
	    p."id", 
	    p."link", 
	    p."text", 
	    p."createdAt", 
      p."userId",
	    u."name",
	    u."imageUrl",
	  COALESCE ( (SELECT COUNT(comments.id) FROM comments WHERE comments."postId" = p."id"), 0) as comments,
      COALESCE( (SELECT COUNT(likes.id) FROM likes WHERE likes."postId" = p."id"), 0) as likes
    FROM posts AS p
    JOIN users AS u ON u."id" =  p."userId"
    GROUP BY p."id", u.name, u."imageUrl"
    ORDER BY p."createdAt" DESC
    LIMIT 20;`
  );
}

export function getUserPostsList(id) {
  return db.query(
    `
    SELECT 
	    p."id", 
	    p."link", 
	    p."text", 
	    p."createdAt", 
      p."userId",
	    u."name",
	    u."imageUrl"
    FROM posts AS p
    JOIN users AS u ON p."userId" = u."id" WHERE p."userId" = $1
    ORDER BY p."createdAt" DESC;`,
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
