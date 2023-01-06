import dayjs from "dayjs";
import { getExistUserById } from "../repositories/auth.repositories.js";
import { getPostById } from "../repositories/posts.repositories.js";
import { likeSchema } from "../schemas/likeSchema.js";

export async function likesMiddleware(req, res, next) {
  const { userId } = res.locals;
  const postId = req.params.postId;
  const validationObj = {
    userId,
    postId,
  };
  const { error } = likeSchema.validate(validationObj, {
    abortEarly: false,
  });
  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }
  const createdAt = dayjs().format("YYYY-MM-DD hh:mm:ss");

  const postExists = getPostById(postId);
  if (!postExists) return res.status(404).send("invalid post id");

  const userExists = getExistUserById(userId);
  if (!userExists) return res.status(404).send("invalid user id");

  req.likeObject = {
    userId,
    postId,
    createdAt,
  };

  next();
}
