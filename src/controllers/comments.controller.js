import { getPostComments, postComment } from "../repositories/comments.repositories.js";


export async function getPostCommentsController(req, res) {
    const {postId} = req.params
    try {
        const comments = await getPostComments(postId)
        res.status(200).send(comments)
    } catch(error) {
        console.log(error);
        res.sendStatus(500)
    }
}

export async function postCommentController(req, res) {
    const {postId} = req.params
    const {userId} = res.locals
    const {text} = req.body
    try {
        await postComment(userId, postId, text)
        res.sendStatus(201)
    } catch(error) {
        console.log(error);
        res.sendStatus(500)
    }
}