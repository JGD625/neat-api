const express = require('express')
const path = require('path')
const ArticleService = require('./article-service')

const articlesRouter = express.Router()





/* verbs for generic articles */
articlesRouter
  .route('/')
  .get((req, res, next) => {
    ArticleService.getAll(req.app.get('db'))
      .then(articles => {
        res.json(articles)
      })
      .catch(next)
  })


/* verbs for specific articles */
articlesRouter
  .route('/:article_id/')
  .all(checkArticleExists)

  .get((req, res, next) => {
    ArticleService.getByIdAdv(
      req.app.get('db'),
      req.params.article_id
    )
      .then(articles => {
        res.json(articles)
      })
      .catch(next)
  })

/* verbs for specific article's comments (probably don't need this) */
articlesRouter
  .route('/:article_id/comment/')
  .all(checkArticleExists)

  .get((req, res, next) => {
    ArticleService.getCommentsForArticle(
      req.app.get('db'),
      req.params.article_id
    )
      .then(comments => {
        res.json(comments)
      })
      .catch(next)
  })


async function checkArticleExists(req, res, next) {
  try {
    const hasArticle = await ArticleService.hasArticle(
      req.app.get('db'),
      req.params.article_id
    )

    if (!hasArticle)
      return res.status(404).json({
        error: { message: `Article doesn't exist` }
      })

    next()
  } catch (error) {
    next(error)
  }
}

module.exports = articlesRouter