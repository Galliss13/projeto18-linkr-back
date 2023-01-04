import bcrypt from 'bcrypt';
import { getExistSession, getExistUser, insertTokenInSession, updateTokenInSession } from "../repositories/auth.repositories.js"
import { singInSchema } from "../schemas/singIn.schema.js"
import { v4 as uuid } from 'uuid';

export async function validateSingInMiddleware(req, res, next){

    const body = req.body

    const validationSchema = singInSchema.validate(body, { abortEarly: false })

    if (validationSchema.error) {
        const errors = validationSchema.error.details.map(e => e.message)
        return res.status(400).send(errors)
    }

    const existUser = await getExistUser(body.email)

    if (!existUser.rows[0]) {
        return res.sendStatus(404)
    }

    const validatePassword = bcrypt.compareSync(body.password, existUser.rows[0].password)

    if (!validatePassword) {
        return res.sendStatus(404)
    }

    res.locals.user = existUser.rows[0]

    console.log(res.locals)

    next()
}

export async function createOrUpdateSessions(req, res, next){

    // CREATE OR UPDATE A USER SESSION IN SESSIONS
    const {user} = res.locals

    const newToken = uuid()

    const existSession = await getExistSession(user.id)    

    if (existSession.rows[0]) {
        await updateTokenInSession(newToken, user.id)
    } else {
        await insertTokenInSession(newToken,user.id)
    }

    res.locals.token = newToken

    next()
}

export async function validateSingUpMiddleware(req, res, next){


}