import { db } from "../database/db.js";

export async function postLike(likeObject) {
  return db.query(
    `
    INSERT INTO likes
    ("userId", "postId", "createdAt")
    VALUES ($1, $2, $3)`,
    [likeObject.userId, likeObject.postId, likeObject.createdAt]
  );
}
