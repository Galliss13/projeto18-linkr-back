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

export async function deleteRepostById(repostId, userId) {
  const result = await db.query(
    `DELETE FROM reposts WHERE id = $1 AND "userId" = $2 RETURNING id`,
    [repostId, userId]
  );
  if (result.rows.length === 0) return false;
  return true;
}

export async function deleteRepostByPostId(postId) {
  const result = await db.query(
    `DELETE FROM reposts WHERE "postId" = $1 RETURNING id`,
    [postId]
  );
  if (result.rows.length === 0) return false;
  return true;
}


