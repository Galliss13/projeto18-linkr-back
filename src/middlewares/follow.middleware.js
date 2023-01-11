import { getUserByBody } from "../repositories/follow.repositories.js"


export async function checkExistUsers(req, res, next){

    const {followedId, followerId} = req.body

    if(!followedId && !followerId){
        const {followedId, followerId} = req.params
    }

    if(followedId === followerId){
        return res.sendStatus(409)
    }

    const existFollowed = await getUserByBody(followedId)

    const existFollower = await getUserByBody(followerId)

    if(!existFollowed.rows[0] || !existFollower.rows[0]){
        return res.sendStatus(404)
    }

    next()
}
