import { getExistUserById, insertNewUserInUsers } from "../repositories/auth.repositories.js";


export async function singInRegister(req, res) {

    const { user, token } = res.locals

    try {

        res.status(200).send({ token, name: user.name, imageUrl: user.imageUrl, userId: user.id })

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}


export async function singUpRegister(req, res) {

    const { body, passwordHash } = res.locals

    try {

        await insertNewUserInUsers(body, passwordHash)

        res.sendStatus(201)

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}

export async function persistLogin(req, res){

    const {userId, token} = res.locals

    try {
        
        const user = await getExistUserById(userId)

        res.status(200).send({token, userId, name: user.rows[0].name, imageUrl: user.rows[0].imageUrl})

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}