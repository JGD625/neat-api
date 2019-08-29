const express = require('express')
const path = require('path')
const LiquorService = require('./liquor-service')

const liquorsRouter = express.Router()
const jsonBodyParser = express.json()

/* verbs for generic liquors */
liquorsRouter
  .route('/')
  .get((req, res, next) => {
    LiquorService.getAll(req.app.get('db'))
      .then(liquors => {
        res.json(liquors)
      })
      .catch(next)
  })

  // add a new liquor without comments
  .post(jsonBodyParser, (req, res, next) => {
    const { title, content, liquor_id } = req.body
    const newLiquor = { title, content, liquor_id }

    for (const [key, value] of Object.entries(newArticle))
      if (value == null)
        return res.status(400).json({
          error: { message: `Missing '${key}' in request body` }
        })

      LiquorService.insertLiquor(
      req.app.get('db'),
      newLiquor
    )
      .then(liquor => {
        res
          .status(201)
          .location(path.join(req.originalUrl, liquor.id))
          .json(liquor)
      })
  })

/* verbs for specific liquors */
liquorsRouter
  .route('/:liquor_id/')
  .all(checkLiquorExists)

  .get((req, res, next) => {
    LiquorService.getByIdAdv(
      req.app.get('db'),
      req.params.liquor_id
    )
      .then(liquors => {
        res.json(liquors)
      })
      .catch(next)
  })

  // update liquor information, without comments
  .patch(jsonBodyParser, (req, res, next) => {
    const { title, content } = req.body
    if (title == null && content == null)
      return res.status(400).json({
        error: { message: `Request body must content either 'title' or 'content'` }
      })
    const newFields = {}
    if (title) newFields.title = title
    if (content) newFields.content = content
    LiquorService.updateLiquor(
      req.app.get('db'),
      req.params.liquor_id,
      newFields
    )
      .then(() => {
        res.status(204).end()
      })
      .catch(next)
  })

  // remove an article, comments should cascade
  .delete((req, res, next) => {
    LiquorService.deleteLiquor(
      req.app.get('db'),
      req.params.liquor_id
    )
      .then(() => {
        res.status(204).end()
      })
      .catch(next)
  })

/* verbs for specific liquor's comments */
liquorsRouter
  .route('/:liquor_id/comment/')
  .all(checkLiquorExists)

  .get((req, res, next) => {
    LiquorService.getCommentsForLiquor(
      req.app.get('db'),
      req.params.liquor_id
    )
      .then(comments => {
        res.json(comments)
      })
      .catch(next)
  })


async function checkLiquorExists(req, res, next) {
  try {
    const hasLiquor = await LiquorService.hasLiquor(
      req.app.get('db'),
      req.params.liquor_id
    )

    if (!hasLiquor)
      return res.status(404).json({
        error: { message: `Liquor doesn't exist` }
      })

    next()
  } catch (error) {
    next(error)
  }
}

module.exports = liquorsRouter