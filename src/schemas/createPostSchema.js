import joi from 'joi';

export const createPostSchema = joi.object({
    link: joi.string().uri().required(),
    text: joi.string().required()
})