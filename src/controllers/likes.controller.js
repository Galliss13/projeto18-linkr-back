import { postLike } from "../repositories/likes.repositories.js";

export async function postLikeController(req, res) {
  const likeObject = req.likeObject;

  try {
    await postLike(likeObject);
    return res.sendStatus(201);
  } catch (error) {
    return res.status(400).send(error);
  }
}
