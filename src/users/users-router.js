const express = require('express')
const path = require('path')
const UserService = require('./user-service')

const usersRouter = express.Router()
const jsonBodyParser = express.json()


usersRouter
  .route('/')
  .get((req, res, next) => {
    UserService.getAll(req.app.get('db'))
      .then(users => {
        res.json(users)
      })
      .catch(next)
  })

  .post(jsonBodyParser, (req, res, next) => {
    const { first_name, last_name, email, screen_name, favorite_liquor, picture_url, about_user } = req.body
    const newUser = { first_name, last_name, email, screen_name, favorite_liquor, picture_url, about_user }

    const requiredFields = ['email', 'screen_name']
    for (const field of requiredFields)
      if (newUser[field] == null)
        return res.status(400).json({
          error: { message: `Missing '${field}' in request body` }
        })

    UserService.hasUserWithEmail(
      req.app.get('db'),
      newUser.email
    )
      .then(hasUserWithEmail => {
        if (hasUserWithEmail)
          return res.status(400).json({
            error: { message: `Email already taken` }
          })

        return UserService.insertUser(
          req.app.get('db'),
          newUser
        )
          .then(user => {
            res
              .status(201)
              .location(path.join(req.originalUrl, user.id))
              .json(user)
          })
      })
      .catch(next)
  })

usersRouter
  .route('/:user_id')
    .all((req, res, next) => {
      UserService.hasUser(
        req.app.get('db'),
        req.params.user_id
      )
        .then(hasUser => {
          if (!hasUser)
            return res.status(404).json({
              error: { message: `User doesn't exist` }
            })
          next()
          return null
        })
        .catch(next)
    })
    .get((req, res, next) => {
      UserService.getById(
        req.app.get('db'),
        req.params.user_id
      )
        .then(user => {
          res.json(user)
        })
        .catch(next)
    })
    // update user information, without users
    .patch(jsonBodyParser, (req, res, next) => {
      const { first_name, last_name, email, screen_name, favorite_liquor, picture_url, about_user } = req.body
      if (
        first_name == null
        && last_name == null
        && email == null
        && screen_name == null
        && favorite_liquor == null
        && picture_url == null
        && about_user == null
      )
        return res.status(400).json({
          error: {
            message: `Request body must contain either 'first_name', 'last_name', 'email', 'favorite_liquor', 'picture_url', 'about_user', or 'screen_name'`
          }
        })

      const newFields = {
        date_modified: 'now()'
      }
      if (first_name) newFields.first_name = first_name
      if (last_name) newFields.last_name = last_name
      if (email) newFields.email = email
      if (screen_name) newFields.screen_name = screen_name
      if (favorite_liquor) newFields.favorite_liquor = favorite_liquor
      if (picture_url) newFields.picture_url = picture_url
      if (about_user) newFields.about_user = about_user

      UserService.hasUserWithEmail(
        req.app.get('db'),
        newFields.email
      )
        .then(hasUserWithEmail => {
          if (hasUserWithEmail)
            return res.status(400).json({
              error: { message: `Email already taken` }
            })

          return UserService.updateUser(
            req.app.get('db'),
            req.params.user_id,
            newFields
          )
            .then(() => {
              res.status(204).end()
            })
        })
        .catch(next)
    })
    // remove an user, users should cascade
    .delete((req, res, next) => {
      UserService.deleteUser(
        req.app.get('db'),
        req.params.user_id
      )
        .then(() => {
          res.status(204).end()
        })
        .catch(next)
    })

module.exports = usersRouter