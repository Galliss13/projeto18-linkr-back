import { db } from "../database/db.js";

export async function checkIfHashtagExistsReturningId(hashtag) {
  const hashtagExists = await db.query(
    `
    SELECT * FROM hashtags WHERE hashtag = $1
    `,
    [hashtag]
  );
  if (hashtagExists.rows.length > 0) {
    return hashtagExists.rows[0].id;
  }
  return false;
}

export async function insertHashtagReturningId(hashtag, createdAt) {
  const insertHashtag = await db.query(
    `
   INSERT INTO hashtags
   (hashtag, "createdAt")
   VALUES ($1, $2)
   RETURNING id
   `,
    [hashtag, createdAt]
  );
  return insertHashtag.rows[0].id;
}

export function insertHashtagUse(hashtagObj) {
  return db.query(
    `
    INSERT INTO "hashtagUse"
    ("hashtagId", "postId", "usedAt") 
    VALUES ($1, $2, $3)
    `,
    [hashtagObj.hashtagId, hashtagObj.postId, hashtagObj.usedAt]
  );
}


export function deleteHashtagUsesByPostId(postId) {
  return db.query(
    `
    DELETE FROM "hashtagUse" 
    WHERE "postId"=$1 
    `,
    [postId]
  );
}

export function getTrendingHashtags() {
  return db.query(`
    SELECT COUNT(u.id) as uses, h.hashtag
    FROM hashtags h 
    JOIN "hashtagUse" u ON h.id = u."hashtagId" 
    JOIN posts p ON u."postId"=p.id
    WHERE u."usedAt" > now() - interval '1 week'
    GROUP BY h.id
    ORDER BY uses DESC
    LIMIT 10;
  `)
}
