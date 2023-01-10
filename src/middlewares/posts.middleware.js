import { db } from "../database/db.js";
import dayjs from "dayjs";

import { createPostSchema } from "../schemas/createPostSchema.js";
import { 
  deleteHashtagUsesByPostId
} from "../repositories/hashtag.repositories.js";
import { editPostSchema } from "../schemas/editPostSchema.js";


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

export async function validateEditPost(req, res, next) {
  const editedPost = req.body;
  const { error } = editPostSchema.validate(editedPost, {
    abortEarly: false,
  });
  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }
  next()
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

export async function userExists(req, res, next){
  const { id } = req.params
  try {
    const userExists = await db.query("SELECT * FROM users WHERE id=$1;", [id]);
    if (!userExists.rows[0]) {
      return res.sendStatus(404);
    }
    next()
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
  }
}
