const LiquorService = {
  getAll(db) {
    return Promise.all([
      db.from('neat_liquors').select('*'),
      db.from('liquor_comments').select('*'),
    ]).then(([ liquors, comments ]) => {
      return liquors.map(liquor => {
        liquor.comments = comments.filter(
          comment => comment.liquor_id === liquor.id
        )
        return liquor
      })
    })
  },

  // advanced version of above, uses single query to optimize
  getAllAdv(db) {
    return db
      .from('neat_liquors AS liq')
      .select(
        'liq.id',
        'liq.liquor_name',
        'liq.brand_name',
        'liq.producer',
        'liq.origin',
        'liq.liquor_type',
        'liq.liquor_age',
        'liq.proof',
        'liq.price',
        'liq.rating',
        'liq.content',
        db.raw(
          `COALESCE(
            json_agg(DISTINCT comm) filter(WHERE comm.id IS NOT NULL),
            '[]'
          ) AS comments`
        ),
      )
      .leftJoin('liquor_comments AS comm',
        'liq.id',
        'comm.liquor_id',
      )
      .groupBy('liq.id')
  },

  hasLiquor(db, id) {
    return db('neat_liquors')
      .select('id')
      .where({ id })
      .first()
      .then(liquor => !!liquor)
  },

  getById(db, id) {
    return Promise.all([
      db.from('neat_liquors').select('*').where('id', id).first(),
      LiquorService.getCommentsForLiquor(db, id),
    ]).then(([liquor, comments]) => {
      liquor.comments = comments
      return liquor
    })
  },

  // uses advanced version of getAll
  getByIdAdv(db, id) {
    return LiquorService.getAllAdv(db)
      .where('liq.id', id)
      .first()
  },

  getCommentsForLiquor(db, liquor_id) {
    return db.from('liquor_comments').where({ liquor_id })
  },

  insertLiquor(db, newLiquor) {
    return db
      .insert(newLiquor)
      .into('neat_liquors')
      .returning('*')
      .then(([liquor]) => {
        liquor.comments = []
        return liquor
      })
  },

  updateLiquor(db, id, newLiquorFields) {
    return db('neat_liquors')
      .where({ id })
      .update(newLiquorFields)
  },

  deleteLiquor(db, id) {
    return db('neat_liquors')
      .where({ id })
      .delete()
  }
}

module.exports = LiquorService