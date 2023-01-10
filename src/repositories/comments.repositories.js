import { db } from "../database/db";

export async function getPostComments(postId) {
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
        f."followerId", 
        f."followedId",
        FROM c AS comments 
        JOIN p AS posts 
        JOIN u AS users
        JOIN f AS follows 
        ON c."postId" = post.id 
        WHERE post.id = $1
        `,
        [postId]
    )
    return comments.rows
}