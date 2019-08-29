const express = require('express')
const path = require('path')
const LiquorCommentService = require('./liquor-comments-service')

const commentsRouter = express.Router()
const jsonBodyParser = express.json()

/* verbs for general comments */
liquorCommentsRouter
  .route('/')
    // add a comment, requires { liquor_id }
    .post(jsonBodyParser, (req, res, next) => {
      const { liquor_id, text, user_id } = req.body
      const newComment = { liquor_id, text, user_id }

      for (const [key, value] of Object.entries(newComment))
        if (value == null)
          return res.status(400).json({
            error: { message: `Missing '${key}' in request body` }
          })

      LiquorCommentService.insertComment(
        req.app.get('db'),
        newComment
      )
        .then(comment => {
          res
            .status(201)
            .location(path.join(req.originalUrl, comment.id))
            .json(comment)
        })
        .catch(next)
    })

/* verbs for soecufuc comment */
commentsRouter
  .route('/:comment_id')
    .all((req, res, next) => {
      LiquorCommentService.hasComment(
        req.app.get('db'),
        req.params.comment_id
      )
        .then(hasComment => {
          if (!hasComment)
            return res.status(404).json({ error: { message: `Comment doesn't exist` } })
          next()
        })
        .catch(next)
    })

    .get((req, res, next) => {
      LiquorCommentService.getById(
        req.app.get('db'),
        req.params.comment_id
      )
        .then(comment => {
          res.json(comment)
        })
        .catch(next)
    })

    // update comment information, without comments
    .patch(jsonBodyParser, (req, res, next) => {
      const { text } = req.body
      if (text == null)
        return res.status(400).json({
          error: { message: `Request body must contain'text'` }
        })

      const newFields = {}
      if (text) newFields.text = text

      LiquorCommentService.updateComment(
        req.app.get('db'),
        req.params.comment_id,
        newFields
      )
        .then(() => {
          res.status(204).end()
        })
        .catch(next)
    })

    // remove an comment, comments should cascade
    .delete((req, res, next) => {
      LiquorCommentService.deleteComment(
        req.app.get('db'),
        req.params.comment_id
      )
        .then(() => {
          res.status(204).end()
        })
        .catch(next)
    })

module.exports = liquorCommentsRouter