import dayjs from "dayjs";

import {
  checkIfHashtagExistsReturningId,
  insertHashtagReturningId,
  insertHashtagUse,
  deleteHashtagUsesByPostId
} from "../repositories/hashtag.repositories.js";

import {
  deletePostById,
  updatePost,
  insertPostAndReturnId,
} from "../repositories/posts.repositories.js";

export async function createPostController(req, res) {
  const {link, text, createdAt} = req.validatedPost
  const userId = 1; //req.userId; // nao existe ainda, viria de um outro middleware de validacao do token que retorna o userId vinculado
  const post = {
    link,
    text,
    createdAt,
    userId,
  };
  const hashtags = req.hashtags;
  let postId;
  try {
    const insertPost = await insertPostAndReturnId(post);
    postId = insertPost.rows[0].id
  } catch (error) {
    return res.status(400).send(error);
  }
  if (hashtags.length === 0) return res.sendStatus(201);
  hashtags.forEach(async hashtag => {
    await verifyHashtagExistenceAndAdd(hashtag, postId)
  });
  return res.sendStatus(201);
}

export async function deletePost (req, res) {
  const {postId} = req.params
  try {
    await deletePostById(postId)
    return res.sendStatus(204)
  } catch (error) {
    console.log(error)
    return res.sendStatus(500)
  }
}

export async function editPost (req, res) {
  const {link, text} = req.body
  const {postId} = req.params
  try {
    await deleteHashtagUsesByPostId(postId)
    await updatePost(link, text, postId)

    let hashtags = text.match(/#[A-Za-zà-úÀ-Ú0-9_]+/g);
    if(!hashtags) hashtags = [];
    if (hashtags.length === 0) return res.sendStatus(200);
    hashtags.forEach(async hashtag => {
      await verifyHashtagExistenceAndAdd(hashtag, postId)
    });
    res.sendStatus(200)
  } catch (error) {
    console.log(error);
    return res.sendStatus(500)
  }
}


async function verifyHashtagExistenceAndAdd(hashtag, postId) {
  const hashtagExists = await checkIfHashtagExistsReturningId(hashtag);
  let hashtagId;
  const usedAt = dayjs().format("YYYY-MM-DD hh:mm:ss");
  console.log(`${hashtag} ${usedAt}`)
  hashtagExists
    ? (hashtagId = hashtagExists)
    : (hashtagId = await insertHashtagReturningId(hashtag, usedAt));
  const hashtagObj = {
    hashtagId,
    postId,
    usedAt,
  };
  await insertHashtagUse(hashtagObj);
}

