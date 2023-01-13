import { db } from "../database/db.js";


export function getUserByBody(id){

    const promise = db.query(`SELECT * FROM users WHERE id = $1`, [id])
    return promise
}

export function getFollowingUser(followerId, followedId){

    const promise = db.query(`SELECT * FROM follows WHERE "followerId" = $1 AND "followedId" = $2;`, [followerId, followedId])
    return promise
}

export function getUserFollows(userId) {
    const promise = db.query(`SELECT * FROM follows WHERE followerId" = $1`, [userId])
    return promise
}

export function deleteFollow(followerId, followedId){

    const promise = db.query(`DELETE FROM follows WHERE "followerId" = $1 AND "followedId" = $2;`, [followerId, followedId])
    return promise
}

export function createFollow(followerId, followedId){

    const promise = db.query(`INSERT INTO follows("followerId", "followedId") VALUES ($1,$2)`, [followerId, followedId])
    return promise
}