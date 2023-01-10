

export async function getPostCommentsController(req, res) {
    try {
        const comments = await getPost
    } catch(error) {
        console.log(error);
        res.sendStatus(500)
    }
}