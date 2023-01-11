import dayjs from "dayjs";
import { getExistUserById } from "../repositories/auth.repositories.js";
import { getPostById } from "../repositories/posts.repositories.js";

export async function validateRepost(req, res, next) {
  const { postId } = req.params;
  const { userId } = res.locals;
    const postExists = await getPostById(postId);
    if (!postExists) return res.status(404).send("invalid post id");

    console.log(postExists.userId)
    if (postExists.userId === userId) return res.sendStatus(400)

    const userExists = await getExistUserById(userId);
    if (!userExists) return res.status(404).send("invalid user id");

    const repostedAt = dayjs().format("YYYY-MM-DD hh:mm:ss");

    req.repostObj = { postId, userId, repostedAt };
    next();
}
