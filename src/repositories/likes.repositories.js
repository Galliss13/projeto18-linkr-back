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

export async function deleteLike(likeObject) {
  return db.query(
    `
    DELETE FROM likes
    WHERE "userId"=$1 AND "postId"=$2
    `,
    [likeObject.userId, likeObject.postId]
  );
}

export async function likeExists(likeObject) {
  const likeExists = db.query(
    `SELECT * FROM likes WHERE "userId"=$1 AND "postId"=$2
  `,
    [likeObject.userId, likeObject.postId]
  );

  if ((await likeExists).rows.length === 0) return false;
  return true;
}

export async function getLikesFromPost(postId) {
  const likes = await db.query(
    `
  SELECT COUNT(likes.id) FROM likes WHERE "postId" = $1
  `,
    [postId]
  );
  if (likes.rows.length === 0) return 0;
  return likes.rows[0].count;
}
