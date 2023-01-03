import { db } from "../database/db.js";

export async function validateToken(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");
  const tokenExists = await db.query("SELECT * FROM sessions WHERE token=$1;", [
    token,
  ]);
  if (!tokenExists.rows[0]) {
    return res.sendStatus(401);
  }
  res.locals.auth = token;
  res.locals.userId = tokenExists.rows[0].userId;
  next();
}
