const xss = require('xss')
const Treeize = require('treeize')

const LiquorsService = {
  getAllLiquors(db) {
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
        'liq.date_created',
        'liq.content',
        ...userFields,
        db.raw(
          `count(DISTINCT rev) AS number_of_reviews`
        ),
        db.raw(
          `AVG(rev.rating) AS average_review_rating`
        ),
      )
      .leftJoin(
        'neat_reviews AS rev',
        'liq.id',
        'rev.liquor_id',
      )
      .leftJoin(
        'neat_users AS usr',
        'liq.user_id',
        'usr.id',
      )
      .groupBy('liq.id', 'usr.id')
  },

  getById(db, id) {
    return LiquorsService.getAllLiquors(db)
      .where('liq.id', id)
      .first()
  },

  getReviewsForLiquor(db, liquor_id) {
    return db
      .from('neat_reviews AS rev')
      .select(
        'rev.id',
        'rev.rating',
        'rev.text',
        'rev.date_created',
        ...userFields,
      )
      .where('rev.liquor_id', liquor_id)
      .leftJoin(
        'neat_users AS usr',
        'rev.user_id',
        'usr.id',
      )
      .groupBy('rev.id', 'usr.id')
  },

  serializeLiquors(liquors) {
    return liquors.map(this.serializeLiquor)
  },

  serializeLiquor(liquor) {
    const liquorTree = new Treeize()

   
    const liquorData = liquorTree.grow([ liquor ]).getData()[0]

    return {
      id: liquorData.id,
      liquor_name: xss(liquorData.liquor_name),
      brand_name: xss(liquorData.brand_name),
      producer: (liquorData.producer),
      origin: (liquorData.origin),
      liquor_type: (liquorData.liquor_type),
      liquor_age: (liquorData.liquor_age),
      proof: (liquorData.proof),
      price: (liquorData.price),
      content: xss(liquorData.content),
      date_created: liquorData.date_created,
      user: liquorData.user || {},
      number_of_reviews: Number(liquorData.number_of_reviews) || 0,
      average_review_rating: Math.round(liquorData.average_review_rating) || 0,
    }
  },

  serializeLiquorReviews(reviews) {
    return reviews.map(this.serializeLiquorReview)
  },

  serializeLiquorReview(review) {
    const reviewTree = new Treeize()


    const reviewData = reviewTree.grow([ review ]).getData()[0]

    return {
      id: reviewData.id,
      rating: reviewData.rating,
      liquor_id: reviewData.liquor_id,
      text: xss(reviewData.text),
      user: reviewData.user || {},
      date_created: reviewData.date_created,
    }
  },
}

const userFields = [
  'usr.id AS user:id',
  'usr.user_name AS user:user_name',
  'usr.full_name AS user:full_name',
  'usr.nickname AS user:nickname',
  'usr.date_created AS user:date_created',
  'usr.date_modified AS user:date_modified',
]

module.exports = LiquorsService
