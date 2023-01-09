import {
  deleteLike,
  getLikesFromPost,
  likeExists,
  postLike,
  userLikesPost,
} from "../repositories/likes.repositories.js";
import { getPostById } from "../repositories/posts.repositories.js";

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

export async function getLikesFromPostController(req, res) {
  const postId = req.params.postId;
  try {
    const postExists = await getPostById(postId);
    if (!postExists) return res.status(404).send("invalid post id");
    const likesFromPost = await getLikesFromPost(postId);
    res.send(likesFromPost).status(200);
  } catch (error) {
    return res.status(400).send(error);
  }
}

export async function userLikesPostController(req, res) {
  const postId = req.params.postId;
  const { userId } = res.locals;
  try {
    const likes = await userLikesPost(userId, postId);
    res.send(likes).status(200)
  } catch (error) {
    return res.status(400).send(error);
  }
}
