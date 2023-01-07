import { getTrendingHashtags } from "../repositories/hashtag.repositories.js";

export async function trendingHashtagsController(req, res) {
  try {
    const hashtags = await getTrendingHashtags();
    res.send(hashtags.rows).status(200);
  } catch (error) {
    return res.status(400).send(error);
  }
}
