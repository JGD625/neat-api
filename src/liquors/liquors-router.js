const express = require('express')
const LiquorsService = require('./liquors-service')
const { requireAuth } = require('../middleware/jwt-auth')

const liquorsRouter = express.Router()

liquorsRouter
  .route('/')
  .get((req, res, next) => {
    LiquorsService.getAllLiquors(req.app.get('db'))
      .then(liquors => {
        res.json(LiquorsService.serializeLiquors(liquors))
      })
      .catch(next)
  })

liquorsRouter
  .route('/:liquor_id')
  .all(requireAuth)
  .all(checkLiquorExists)
  .get((req, res) => {
    res.json(LiquorsService.serializeLiquor(res.liquor))
  })

liquorsRouter.route('/:liquor_id/reviews/')
  .all(requireAuth)
  .all(checkLiquorExists)
  .get((req, res, next) => {
    LiquorsService.getReviewsForLiquor(
      req.app.get('db'),
      req.params.liquor_id
    )
      .then(reviews => {
        res.json(LiquorsService.serializeLiquorReviews(reviews))
      })
      .catch(next)
  })

async function checkLiquorExists(req, res, next) {
  try {
    const liquor = await LiquorsService.getById(
      req.app.get('db'),
      req.params.liquor_id
    )

    if (!liquor)
      return res.status(404).json({
        error: `Liquor doesn't exist`
      })

    res.liquor = liquor
    next()
  } catch (error) {
    next(error)
  }
}

module.exports = liquorsRouter
