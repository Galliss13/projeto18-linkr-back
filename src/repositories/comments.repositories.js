import { db } from "../database/db.js";

export async function getPostComments(postId) {
    console.log(postId);
    const comments = await db.query(
        `
        SELECT 
        c.id, 
        c."userId", 
        c."postId", 
        c.text, 
        c."createdAt", 
        p.id, 
        p."userId", 
        u.id, 
        u.name,
        u."imageUrl" 
        FROM comments c 
        JOIN posts p 
        ON c."postId" = p.id 
        JOIN users u
        ON u.id = p."userId"
        WHERE p.id = $1
        ORDER BY c."createdAt" DESC
        `,
        [postId]
    )
    return comments.rows
}

export async function postComment(userId, postId, text) {
   return await db.query(
    `
    INSERT INTO comments 
    ("userId", "postId", "text")
    VALUES ($1, $2, $3)
    `,
    [userId, postId, text]
   )
}