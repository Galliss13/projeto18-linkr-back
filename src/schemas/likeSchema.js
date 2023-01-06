import joi from "joi";

export const likeSchema = joi.object({
  userId: joi.number().required(),
  postId: joi.number().required(),
});
