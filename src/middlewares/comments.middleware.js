import { commentPostSchema } from "../schemas/commentSchema.js";

export async function validateCommentPost(req, res, next) {
    const commentPost = req.body;
    const { error } = commentPostSchema.validate(commentPost, {
      abortEarly: false,
    });
    if (error) {
      const errors = error.details.map((detail) => detail.message);
      return res.status(422).send(errors);
    }
    next()
  }