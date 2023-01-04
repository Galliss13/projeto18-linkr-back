import { db } from "../database/db.js";


export function getExistUser(email){

    const existUser = db.query(`SELECT * FROM users WHERE email = $1`, [email]);
    return existUser
}

export function getExistSession(userId){
    
    const existSession = db.query(`SELECT * FROM sessions WHERE "userId" = $1`, [userId])
    return existSession
}

export function updateTokenInSession(newToken, userId){

    return db.query(`UPDATE sessions SET token = $1 WHERE "userId" = $2`, [newToken, userId])
}

export function insertTokenInSession(newToken, userId){

    return db.query(`INSERT INTO sessions(token, "userId") VALUES ($1,$2)`, [newToken, userId])
}

export function insertNewUserInUsers(body, passwordHash){

    return db.query(`INSERT INTO users(name, email, password, "imageUrl") VALUES ($1,$2,$3,$4)`,
    [body.name, body.email, passwordHash, body.imageUrl])
}