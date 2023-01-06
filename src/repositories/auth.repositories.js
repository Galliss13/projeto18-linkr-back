import { db } from "../database/db.js";

export function getExistUser(email) {
  const existUser = db.query(`SELECT * FROM users WHERE email = $1`, [email]);
  return existUser;
}

export function getExistUserById(userId){

  const user = db.query(`SELECT * FROM users WHERE id = $1`, [userId])

  return user
}

export function getExistSession(userId) {
  const existSession = db.query(`SELECT * FROM sessions WHERE "userId" = $1`, [
    userId,
  ]);
  return existSession;
}

export function updateTokenInSession(newToken, userId) {
  return db.query(`UPDATE sessions SET token = $1 WHERE "userId" = $2`, [
    newToken,
    userId,
  ]);
}

export function insertTokenInSession(newToken, userId) {
  return db.query(`INSERT INTO sessions(token, "userId") VALUES ($1,$2)`, [
    newToken,
    userId,
  ]);
}

export function insertNewUserInUsers(body, passwordHash) {
  return db.query(
    `INSERT INTO users(name, email, password, "imageUrl") VALUES ($1,$2,$3,$4)`,
    [body.name, body.email, passwordHash, body.imageUrl]
  );
}

export async function checkTokenReturnUser(token) {
  const userId = await db.query(
    `SELECT u.id FROM sessions s JOIN users u ON s."userId" = u.id WHERE s.token = $1`,
    [token]
  );
  if (!userId.rows[0]) return false;
  return userId.rows[0];
}
