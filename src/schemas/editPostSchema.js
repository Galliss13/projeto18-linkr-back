import joi from "joi";

export const editPostSchema = joi.object({
  text: joi.string().required().allow("")
});