import dayjs from "dayjs";
import urlMetadata from "url-metadata";
import {
  checkIfHashtagExistsReturningId,
  insertHashtagReturningId,
  insertHashtagUse
} from "../repositories/hashtag.repositories.js";
import {
  getPostsList,
  insertPostAndReturnId
} from "../repositories/posts.repositories.js";

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
    const postsData = await getPostsList();
    const postsInfo = postsData.rows;
    const posts = await Promise.all(
      postsInfo.map(async (post) => {
        try {
          const { link } = post;
          const metadata = await urlMetadata(link);
          let { title, description, image } = metadata;
          if (!title) {
            title = "";
          }
          if (!description) {
            description = "";
          }
          if (!image) {
            image = "";
          }
          return { ...post, title, description, image };
        } catch (error) {
          console.log(error);
          return { ...post, title: "", description: "", image: "" };
        }
      })
    );
    res.send(posts);
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
  }
}
