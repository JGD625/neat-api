const UserService = {
  getAll(db) {
    return db
      .from('neat_users')
      .select('*')
  },

  getById(db, user_id) {
    return db
      .from('neat_users')
      .where({
        id: user_id
      })
      .first()
  },

  hasUser(db, id) {
    return db('neat_users')
      .select('id')
      .where({ id })
      .first()
      .then(user => !!user)
  },

  insertUser(db, newUser) {
    return db
      .insert(newUser)
      .into('neat_users')
      .returning('*')
      .then(([user]) => user)
  },

  updateUser(db, id, newUserFields) {
    return db('neat_users')
      .where({ id })
      .update(newUserFields)
  },

  deleteUser(db, id) {
    return db('neat_users')
      .where({ id })
      .delete()
  },

  hasUserWithEmail(db, email) {
    return db('neat_users')
      .where({ email })
      .first()
      .then(user => !!user)
  },
}

module.exports = UserService