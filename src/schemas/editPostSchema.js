import joi from "joi";

export const editPostSchema = joi.object({
  link: joi.string().uri().required(),
  text: joi.string().required().allow(""),
});