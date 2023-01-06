import dayjs from "dayjs";
import {
  checkIfHashtagExistsReturningId,
  insertHashtagReturningId,
  insertHashtagUse,
} from "../repositories/hashtag.repositories.js";
import {
  getHashtagPosts,
  getPostsList,
  insertPostAndReturnId,
} from "../repositories/posts.repositories.js";

export async function createPostController(req, res, next) {
  const userId = res.locals.userId;
  const post = {
    link: req.validatedPost.link,
    text: req.validatedPost.text,
    createdAt: req.validatedPost.createdAt,
    userId,
  };
  const hashtags = req.hashtags;
  let postId;
  try {
    const insertPost = await insertPostAndReturnId(post);
    postId = insertPost.rows[0].id;
  } catch (error) {
    return res.status(400).send(error);
  }
  if (hashtags.length === 0) return res.sendStatus(201);
  const insertedHashtags = [];
  for (const hashtag of hashtags) {
    try {
      if (insertedHashtags.includes(hashtag)) continue;
      const hashtagExists = await checkIfHashtagExistsReturningId(hashtag);
      let hashtagId;
      const usedAt = dayjs().format("YYYY-MM-DD hh:mm:ss");
      hashtagExists
        ? (hashtagId = hashtagExists)
        : (hashtagId = await insertHashtagReturningId(hashtag, usedAt));
      const hashtagObj = {
        hashtagId,
        postId,
        usedAt,
      };
      await insertHashtagUse(hashtagObj);
      insertedHashtags.push(hashtag);
    } catch (error) {
      return res.status(400).send(error);
    }
  }
  return res.sendStatus(201);
}

export async function getPosts(req, res) {
  try {
    const posts = await getPostsList();
    console.log(posts);
    res.send(posts.rows).status(200);
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
  }
}

export async function getPostsFromHashtag(req, res) {
  const hashtagName = req.params.hashtagName

  try {
    const hashtags = await getHashtagPosts(hashtagName);
    res.send(hashtags.rows).status(200);
  } catch (error) {
    return res.status(400).send(error);
  }
}