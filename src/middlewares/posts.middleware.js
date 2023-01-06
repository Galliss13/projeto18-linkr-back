import { db } from "../database/db.js";
import dayjs from "dayjs";

import { createPostSchema } from "../schemas/createPostSchema.js";
import { 
  deleteHashtagUsesByPostId
} from "../repositories/hashtag.repositories.js";


export async function validateCreatePost(req, res, next) {
  const post = req.body;
  const { error } = createPostSchema.validate(post, {
    abortEarly: false,
  });
  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }
  const hashtags = post.text.match(/#[A-Za-zà-úÀ-Ú0-9_]+/g);
  const createdAt = dayjs().format("YYYY-MM-DD hh:mm:ss");
  hashtags ? (req.hashtags = hashtags) : (req.hashtags = []);
  req.validatedPost = { link: post.link, text: post.text, createdAt };
  next();
}

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

export async function deleteHashtags(req, res, next) {
  const {postId} = req.params
  try {
    await deleteHashtagUsesByPostId(postId)
    next()
  } catch (error) {
    console.log(error);
    res.sendStatus(500)
  }
}