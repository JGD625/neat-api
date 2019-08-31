require('dotenv').config()
const express = require('express')
const morgan = require('morgan')
const cors = require('cors')
const helmet = require('helmet')
const { NODE_ENV } = require('./config')
const articlesRouter = require('./articles/articles-router')
const articleCommentsRouter = require('./article-comments/article-comments-router')
const liquorCommentsRouter = require('./liquor-comments/liquor-comments-router')
const usersRouter = require('./users/users-router')
const liquorsRouter = require('./liquors/liquors-router')



const app = express()

app.use(morgan((NODE_ENV === 'production') ? 'tiny' : 'common'))
app.use(cors())
app.use(helmet())

app.use('/api/articles', articlesRouter)
app.use('/api/article_comments', articleCommentsRouter)
app.use('/api/users', usersRouter)
app.use('/api/liquor_comments', liquorCommentsRouter)
app.use('/api/liquors', liquorsRouter)

app.get('/api/', (req, res) => {
       res.send('Hello, world!')
     })

app.use(function errorHandler(error, req, res, next) {
      let response
      if (NODE_ENV === 'production') {
       response = { error: { message: 'server error' } }
      } else {
        console.error(error)
        response = { message: error.message, error }
      }
      res.status(500).json(response)
    })
    

module.exports = app