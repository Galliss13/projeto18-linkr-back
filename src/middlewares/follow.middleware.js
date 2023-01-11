import { getUserByBody } from "../repositories/follow.repositories.js"


export async function checkExistUsers(req, res, next){

    const {followedId, followerId} = req.body

    /* If it wasn't pass by body try to get by params  */
    if(!followedId && !followerId){
        const {followedId, followerId} = req.params
    }

    if(followedId === followerId){
        return res.sendStatus(409)
    }

    /* Check users */
    const existFollowed = await getUserByBody(followedId)

    const existFollower = await getUserByBody(followerId)

    if(!existFollowed.rows[0] || !existFollower.rows[0]){
        return res.sendStatus(404)
    }

    next()
}
