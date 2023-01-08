import { checkTokenReturnUser } from "../repositories/auth.repositories.js";

export async function validateToken(req, res, next) {

  const token = req.headers.authorization?.split(" ")[1];
  console.log(token);
  if (!token) return res.sendStatus(401);

  const userId = await checkTokenReturnUser(token);

  if (!userId) {
    return res.sendStatus(401);
  }
  
  res.locals.userId = userId.id;
  res.locals.token = token

  next();
}
