import joi from "joi";

export const commentPostSchema = joi.object({
  text: joi.string().required().allow("")
});