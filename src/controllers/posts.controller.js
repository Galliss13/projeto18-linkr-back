import dayjs from "dayjs";
import urlMetadata from "url-metadata";
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
  getPostsList,
  getHashtagPosts,
  getUserPostsList
} from "../repositories/posts.repositories.js";

export async function createPostController(req, res) {
  const { link, text, createdAt } = req.validatedPost;
  const { userId } = res.locals;
  const post = {
    link,
    text,
    createdAt,
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
  hashtags.forEach(async (hashtag) => {
    await verifyHashtagExistenceAndAdd(hashtag, postId);
  });
  return res.sendStatus(201);
}

export async function deletePost(req, res) {
  const { id } = req.params;
  try {
    await deletePostById(id);
    return res.sendStatus(204);
  } catch (error) {
    console.log(error);
    return res.sendStatus(500);
  }
}

/* --------------------------------------------------------- */

export async function editPost(req, res) {
  const { link, text } = req.body;
  const { postId } = req.params;
  try {
    await deleteHashtagUsesByPostId(postId);
    await updatePost(link, text, postId);

    let hashtags = text.match(/#[A-Za-zà-úÀ-Ú0-9_]+/g);
    if (!hashtags) hashtags = [];
    if (hashtags.length === 0) return res.sendStatus(200);
    hashtags.forEach(async (hashtag) => {
      await verifyHashtagExistenceAndAdd(hashtag, postId);
    });
    res.sendStatus(200);
  } catch (error) {
    console.log(error);
    return res.sendStatus(500);
  }
  return res.sendStatus(201);
}

async function verifyHashtagExistenceAndAdd(hashtag, postId) {
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
}
/* --------------------------------------------------------- */

export async function getPosts(req, res) {
  try {
    const postsData = await getPostsList();
    const postsInfo = postsData.rows;
    if (!postsData.rows[0]) {
      return res.send("There are no posts yet").status(204);
    }
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
    res
      .send(
        "An error ocurred while trying to fetch the posts, please refresh the page"
      )
      .status(500);
  }
}

export async function getUserPosts(req, res) {
  const { id } = req.params;
  try {
    const postsData = await getUserPostsList(id);
    const postsInfo = postsData.rows;
    if (!postsData.rows[0]) {
      return res.send("There are no posts yet").status(204);
    }
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
    res
      .send(
        "An error ocurred while trying to fetch the posts, please refresh the page"
      )
      .status(500);
  }
}

export async function getPostsFromHashtag(req, res) {
  const hashtagName = req.params.hashtagName;

  try {
    const hashtags = await getHashtagPosts(hashtagName);
    res.send(hashtags.rows).status(200);
  } catch (error) {
    return res.status(400).send(error);
  }
}
