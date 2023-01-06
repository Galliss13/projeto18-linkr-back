import { db } from "../database/db.js";

export async function getPostById(id) {
  console.log(id);
  const post = await db.query(
    `
    SELECT * FROM posts 
    WHERE id = $1;
    `,
    [id]
  )
  return post.rows[0]
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