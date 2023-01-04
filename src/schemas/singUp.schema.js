import joi from 'joi';


export const singUpSchema = joi.object({
    name: joi.string().min(3).required(),
    email: joi.string().email().required(),
    password: joi.string().min(6).required(),
    imageUrl: joi.string().uri().required()
})