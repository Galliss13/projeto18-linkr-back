import { db } from "../database/db.js";

export async function getPosts(req, res) {
  try {
    const posts = await db.query(
      `SELECT 
           u.id, 
           u.name, 
           u.image,
           p.id, 
           p.text, 
           p.link, 
           p."createdAt" 
       FROM posts AS p 
       JOIN users AS u ON p."userId" = u.id 
       ORDER BY p."createdAt" DESC 
       LIMIT 20;`
    );
    res.send(posts.rows).status(200);
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
  }
}
