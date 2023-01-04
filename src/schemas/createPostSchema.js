import joi from 'joi';

export const createPostSchema = joi.object({
    userId: joi.integer().required(),
    link: joi.string().uri().required(),
    text: joi.string().required()
})