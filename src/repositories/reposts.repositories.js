import { db } from "../database/db.js";

export function postRepost(postId, userId, repostedAt) {
  return db.query(
    `
    INSERT INTO reposts
    ("postId", "repostedAt", "userId")
    VALUES
    ($1, $2, $3)
    `,
    [postId, repostedAt, userId]
  );
}

export async function verifyIfRepostExists(postId, userId) {
  const repostExists = await db.query(
    `SELECT * FROM reposts WHERE "userId"=$1 AND "postId"=$2`,
    [userId, postId]
  );
  if (repostExists.rows.length === 0) return false;
  return repostExists.rows[0];
}
