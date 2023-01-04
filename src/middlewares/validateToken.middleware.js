import { checkTokenReturnUser } from "../repositories/auth.repositories.js"


export async function validateToken(req, res, next){

    const token = req.headers.authorization.split(' ')[1]

    const userId = await checkTokenReturnUser(token)
    
    if(!userId.rows[0]){
        return res.sendStatus(401)
    }
    res.locals.userId = userId.rows[0].id

    next()
}