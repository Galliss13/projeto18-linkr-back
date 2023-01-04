import dayjs from "dayjs";
import {
  checkIfHashtagExistsReturningId,
  insertHashtagReturningId,
  insertHashtagUse
} from "../repositories/hashtag.repositories.js";
import { getPostsList, insertPostAndReturnId } from "../repositories/posts.repositories.js";

export async function createPostController(req, res, next) {
  const userId = res.locals.userId;
  const post = {
    link: req.validatedPost.link,
    text: req.validatedPost.text,
    createdAt: req.validatedPost.createdAt,
    userId
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
  for (const hashtag of hashtags) {
    try {
      const hashtagExists = await checkIfHashtagExistsReturningId(hashtag);
      let hashtagId;
      const usedAt = dayjs().format("YYYY-MM-DD hh:mm:ss");
      console.log(`${hashtag} ${usedAt}`);
      hashtagExists
        ? (hashtagId = hashtagExists)
        : (hashtagId = await insertHashtagReturningId(hashtag, usedAt));
      const hashtagObj = {
        hashtagId,
        postId,
        usedAt
      };
      await insertHashtagUse(hashtagObj);
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
