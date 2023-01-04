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
