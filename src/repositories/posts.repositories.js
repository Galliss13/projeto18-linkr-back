import { db } from "../database/db.js";

export async function getPostById(id) {
  const post = await db.query(
    `
    SELECT * FROM posts 
    WHERE id = $1;
    `,
    [id]
  )
  return (post.rows[0] ? post.rows[0] : undefined)
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

export function deletePostById(id) {
  return db.query(
    `
    DELETE FROM posts 
    WHERE id=$1 
    `,
    [id]
  )
}

export async function updatePost(link, text, id) {
  await db.query(
    `
    UPDATE posts 
    SET link = $1
    WHERE id = $2
    `, 
    [link, id]
  )
  await db.query(
    `
    UPDATE posts 
    SET text = $1
    WHERE id = $2
    `,
    [text, id]
  )
  return
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
	    u."imageUrl"
    FROM posts AS p
    JOIN users AS u ON p."userId" = u."id" 
    ORDER BY p."createdAt" DESC
    LIMIT 20;`
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
	  users."imageUrl"
  FROM hashtags h 
  JOIN "hashtagUse" u ON h.id = u."hashtagId"
  JOIN posts p ON u."postId" = p.id
  JOIN users ON p."userId" = users.id
  WHERE h.hashtag = $1
  ORDER BY p."createdAt" DESC
  `,
    [hashtag]
  );
}
