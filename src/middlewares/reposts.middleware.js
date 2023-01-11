import dayjs from "dayjs";
import { getExistUserById } from "../repositories/auth.repositories.js";
import { getPostById } from "../repositories/posts.repositories.js";
import { verifyIfRepostExists } from "../repositories/reposts.repositories.js";

export async function validateRepost(req, res, next) {
  const { postId } = req.params;
  const { userId } = res.locals;
  const postExists = await getPostById(postId);
  if (!postExists) return res.status(404).send("invalid post id");
  if (postExists.userId === userId)
    return res.status(409).send("user cant repost its own post");

  const userExists = await getExistUserById(userId);
  if (!userExists) return res.status(404).send("invalid user id");

  const repostExists = await verifyIfRepostExists(postId, userId);

  if (repostExists) return res.status(409).send("user already reposted this");

  const repostedAt = dayjs().format("YYYY-MM-DD hh:mm:ss");

  req.repostObj = { postId, userId, repostedAt };
  next();
}
