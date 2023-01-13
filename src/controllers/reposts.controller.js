import {
  deleteRepostById,
  postRepost,
} from "../repositories/reposts.repositories.js";

export async function repostController(req, res) {
  const { postId, userId, repostedAt } = req.repostObj;

  try {
    await postRepost(postId, userId, repostedAt);
    return res.sendStatus(201);
  } catch (error) {
    return res.status(400).send(error);
  }
}

export async function deleteRepost(req, res) {
  const { repostId } = req.params;
  const { userId } = res.locals;
  try {
    const deleted = await deleteRepostById(repostId, userId);
    if (!deleted) return res.sendStatus(404);
    return res.sendStatus(200);
  } catch (error) {
    return res.status(400).send(error);
  }
}
