const ArticleService = {
  getAll(db) {
    return Promise.all([
      db.from('neat_articles').select('*'),
      db.from('article_comments').select('*'),
    ]).then(([ articles, comments ]) => {
      return articles.map(article => {
        article.comments = comments.filter(
          comment => comment.article_id === article.id
        )
        return article
      })
    })
  },

  // advanced version of above, uses single query to optimize
  getAllAdv(db) {
    return db
      .from('neat_articles AS art')
      .select(
        'art.id',
        'art.title',
        'art.date_published',
        'art.content',
        db.raw(
          `COALESCE(
            json_agg(DISTINCT comm) filter(WHERE comm.id IS NOT NULL),
            '[]'
          ) AS comments`
        ),
      )
      .leftJoin('article_comments AS comm',
        'art.id',
        'comm.article_id',
      )
      .groupBy('art.id')
  },

  hasArticle(db, id) {
    return db('neat_articles')
      .select('id')
      .where({ id })
      .first()
      .then(article => !!article)
  },

  getById(db, id) {
    return Promise.all([
      db.from('neat_articles').select('*').where('id', id).first(),
      ArticleService.getCommentsForArticle(db, id),
    ]).then(([article, comments]) => {
      article.comments = comments
      return article
    })
  },

  // uses advanced version of getAll
  getByIdAdv(db, id) {
    return ArticleService.getAllAdv(db)
      .where('art.id', id)
      .first()
  },

  getCommentsForArticle(db, article_id) {
    return db.from('article_comments').where({ article_id })
  },

  insertArticle(db, newArticle) {
    return db
      .insert(newArticle)
      .into('neat_articles')
      .returning('*')
      .then(([article]) => {
        article.comments = []
        return article
      })
  },

  updateArticle(db, id, newArticleFields) {
    return db('neat_articles')
      .where({ id })
      .update(newArticleFields)
  },

  deleteArticle(db, id) {
    return db('neat_articles')
      .where({ id })
      .delete()
  }
}

module.exports = ArticleService