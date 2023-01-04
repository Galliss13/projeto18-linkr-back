import { db } from "../database/db.js";

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

export function getPostsList() {
  return db.query(
    `
    SELECT 
	    p."id", 
	    p."link", 
	    p."text", 
	    p."createdAt", 
	    u."name",
	    u."imageUrl"
    FROM posts AS p
    JOIN users AS u ON p."userId" = u."id" 
    ORDER BY p."createdAt" DESC
    LIMIT 20;`
  );
}
