const LiquorCommentService = {
  getById(db, comment_id) {
    return db
      .from('liquor_comments')
      .where({
        id: comment_id
      })
      .first()
  },

  hasComment(db, id) {
    return db('liquor_comments')
      .select('id')
      .where({ id })
      .first()
      .then(comment => !!comment)
  },

  insertComment(db, newComment) {
    return db
      .insert(newComment)
      .into('liquor_comments')
      .returning('*')
      .then(([comment]) => comment)
  },

  updateComment(db, id, newCommentFields) {
    return db('liquor_comments')
      .where({ id })
      .update(newCommentFields)
  },

  deleteComment(db, id) {
    return db('liquor_comments')
      .where({ id })
      .delete()
  },
}

module.exports = LiquorCommentService