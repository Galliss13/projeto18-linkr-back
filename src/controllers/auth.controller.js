
import bcrypt from 'bcrypt';
import { singUpSchema } from "../schemas/singUp.schema.js";
import {getExistUser, insertNewUserInUsers } from "../repositories/auth.repositories.js";


export async function singInRegister(req, res) {

    const {user,token} = res.locals

    try {

        res.status(200).send({ token, user })

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}


export async function singUpRegister(req, res) {

    const body = req.body

    const validationSchema = singUpSchema.validate(body, { abortEarly: false })

    if (validationSchema.error) {
        const errors = validationSchema.error.details.map(e => e.message)
        return res.status(400).send(errors)
    }

    const existEmail = await getExistUser(body.email)

    if (existEmail.rows[0]) {
        return res.status(400).send('Email já cadastrado!')
    }

    const passwordHash = bcrypt.hashSync(body.password, 10)

    try {
        await insertNewUserInUsers(body, passwordHash)

        res.sendStatus(200)

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}