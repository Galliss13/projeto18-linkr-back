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
