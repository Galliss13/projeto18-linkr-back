import { db } from "../database/db.js";
import { createPostSchema } from "../schemas/createPostSchema.js";
import dayjs from "dayjs";

export async function validateCreatePost(req, res, next) {
  const post = req.body;
  const { error } = createPostSchema.validate(post, {
    abortEarly: false,
  });
  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }
  const hashtags = post.text.match(/#[a-z0-9_]+/g);
  const createdAt = dayjs().format("YYYY-MM-DD");

  req.post = {...post, createdAt};
  req.hashtags = hashtags;
}
