import dayjs from "dayjs";
import {
  checkIfHashtagExistsReturningId,
  insertHashtagReturningId,
  insertHashtagUse,
} from "../repositories/hashtag.repositories.js";
import { insertPostAndReturnId } from "../repositories/posts.repositories.js";

export async function createPostController(req, res, next) {
  const userId = 1; //req.userId; // nao existe ainda, viria de um outro middleware de validacao do token que retorna o userId vinculado
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
    postId = insertPost.rows[0].id
  } catch (error) {
    return res.status(400).send(error);
  }
  if (hashtags.length === 0) return res.sendStatus(201);
  for (const hashtag of hashtags) {
    try {
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
    } catch (error) {
      return res.status(400).send(error);
    }
  }
  return res.sendStatus(201);
}


export async function getPosts(req, res) {
  try {
    const posts = await db.query(
      `SELECT 
           u.id, 
           u.name, 
           u.image,
           p.id, 
           p.text, 
           p.link, 
           p."createdAt" 
       FROM posts AS p 
       JOIN users AS u ON p."userId" = u.id 
       ORDER BY p."createdAt" DESC 
       LIMIT 20;`
    );
    res.send(posts.rows).status(200);
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
  }
}
