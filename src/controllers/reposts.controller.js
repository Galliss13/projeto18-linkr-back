import { postRepost } from "../repositories/reposts.repositories.js";

export async function repostController(req, res) {
  const { postId, userId, repostedAt } = req.repostObj;

  try {
    await postRepost(postId, userId, repostedAt);
    return res.sendStatus(201);
  } catch (error) {
    return res.status(400).send(error);
  }
}
