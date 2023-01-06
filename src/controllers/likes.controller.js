import {
  deleteLike,
  likeExists,
  postLike,
} from "../repositories/likes.repositories.js";

export async function postLikeController(req, res) {
  const likeObject = req.likeObject;

  try {
    if ((await likeExists(likeObject)) === true)
      return res.status(400).send("o usuario já curtiu esse post");
    await postLike(likeObject);
    return res.sendStatus(201);
  } catch (error) {
    return res.status(400).send(error);
  }
}

export async function deleteLikeController(req, res) {
  const likeObject = req.likeObject;

  try {
    if ((await likeExists(likeObject)) === false)
      return res.status(400).send("o usuario não curtiu esse post");
    await deleteLike(likeObject);
    return res.sendStatus(202);
  } catch (error) {
    return res.status(400).send(error);
  }
}
