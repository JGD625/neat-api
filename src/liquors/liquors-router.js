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