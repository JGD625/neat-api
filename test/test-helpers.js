const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

function makeUsersArray() {
  return [
    {
      id: 1,
      user_name: 'test-user-1',
      full_name: 'Test user 1',
      nickname: 'TU1',
      password: 'password',
      date_created: '2029-01-22T16:28:32.615Z',
    },
    {
      id: 2,
      user_name: 'test-user-2',
      full_name: 'Test user 2',
      nickname: 'TU2',
      password: 'password',
      date_created: '2029-01-22T16:28:32.615Z',
    },
    {
      id: 3,
      user_name: 'test-user-3',
      full_name: 'Test user 3',
      nickname: 'TU3',
      password: 'password',
      date_created: '2029-01-22T16:28:32.615Z',
    },
    {
      id: 4,
      user_name: 'test-user-4',
      full_name: 'Test user 4',
      nickname: 'TU4',
      password: 'password',
      date_created: '2029-01-22T16:28:32.615Z',
    },
  ]
}

function makeLiquorsArray(users) {
  return [
    {
      id: 1,
      liquor_name: 'First test thing!',
      user_id: users[0].id,
      date_created: '2029-01-22T16:28:32.615Z',
      content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus consequuntur deserunt commodi, nobis qui inventore corrupti iusto aliquid debitis unde non.Adipisci, pariatur.Molestiae, libero esse hic adipisci autem neque ?',
    },
    {
      id: 2,
      liquor_name: 'Second test thing!',
      user_id: users[1].id,
      date_created: '2029-01-22T16:28:32.615Z',
      content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus consequuntur deserunt commodi, nobis qui inventore corrupti iusto aliquid debitis unde non.Adipisci, pariatur.Molestiae, libero esse hic adipisci autem neque ?',
    },
    {
      id: 3,
      liquor_name: 'Third test thing!',
      user_id: users[2].id,
      date_created: '2029-01-22T16:28:32.615Z',
      content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus consequuntur deserunt commodi, nobis qui inventore corrupti iusto aliquid debitis unde non.Adipisci, pariatur.Molestiae, libero esse hic adipisci autem neque ?',
    },
    {
      id: 4,
      liquor_name: 'Fourth test thing!',
      user_id: users[3].id,
      date_created: '2029-01-22T16:28:32.615Z',
      content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus consequuntur deserunt commodi, nobis qui inventore corrupti iusto aliquid debitis unde non.Adipisci, pariatur.Molestiae, libero esse hic adipisci autem neque ?',
    },
  ]
}

function makeReviewsArray(users, liquors) {
  return [
    {
      id: 1,
      rating: 2,
      text: 'First test review!',
      liquor_id: liquors[0].id,
      user_id: users[0].id,
      date_created: '2029-01-22T16:28:32.615Z',
    },
    {
      id: 2,
      rating: 3,
      text: 'Second test review!',
      liquor_id: liquors[0].id,
      user_id: users[1].id,
      date_created: '2029-01-22T16:28:32.615Z',
    },
    {
      id: 3,
      rating: 1,
      text: 'Third test review!',
      liquor_id: liquors[0].id,
      user_id: users[2].id,
      date_created: '2029-01-22T16:28:32.615Z',
    },
    {
      id: 4,
      rating: 5,
      text: 'Fourth test review!',
      liquor_id: liquors[0].id,
      user_id: users[3].id,
      date_created: '2029-01-22T16:28:32.615Z',
    },
    {
      id: 5,
      rating: 1,
      text: 'Fifth test review!',
      liquor_id: liquors[liquors.length - 1].id,
      user_id: users[0].id,
      date_created: '2029-01-22T16:28:32.615Z',
    },
    {
      id: 6,
      rating: 2,
      text: 'Sixth test review!',
      liquor_id: liquors[liquors.length - 1].id,
      user_id: users[2].id,
      date_created: '2029-01-22T16:28:32.615Z',
    },
    {
      id: 7,
      rating: 5,
      text: 'Seventh test review!',
      liquor_id: liquors[3].id,
      user_id: users[0].id,
      date_created: '2029-01-22T16:28:32.615Z',
    },
  ];
}

function makeExpectedLiquor(users, liquor, reviews=[]) {
  const user = users
    .find(user => user.id === liquor.user_id)

  const liquorReviews = reviews
    .filter(review => review.liquor_id === liquor.id)

  const number_of_reviews = liquorReviews.length
  const average_review_rating = calculateAverageReviewRating(liquorReviews)

  return {
    id: liquor.id,
    liquor_name: liquor.liquor_name,
    content: liquor.content,
    date_created: liquor.date_created,
    number_of_reviews,
    average_review_rating,
    user: {
      id: user.id,
      user_name: user.user_name,
      full_name: user.full_name,
      nickname: user.nickname,
      date_created: user.date_created,
    },
  }
}

function calculateAverageReviewRating(reviews) {
  if(!reviews.length) return 0

  const sum = reviews
    .map(review => review.rating)
    .reduce((a, b) => a + b)

  return Math.round(sum / reviews.length)
}

function makeExpectedLiquorReviews(users, liquorId, reviews) {
  const expectedReviews = reviews
    .filter(review => review.liquor_id === liquorId)

  return expectedReviews.map(review => {
    const reviewUser = users.find(user => user.id === review.user_id)
    return {
      id: review.id,
      text: review.text,
      rating: review.rating,
      date_created: review.date_created,
      user: {
        id: reviewUser.id,
        user_name: reviewUser.user_name,
        full_name: reviewUser.full_name,
        nickname: reviewUser.nickname,
        date_created: reviewUser.date_created,
      }
    }
  })
}

function makeMaliciousLiquor(user) {
  const maliciousLiquor = {
    id: 911,
    date_created: new Date().toISOString(),
    liquor_name: 'Naughty naughty very naughty <script>alert("xss");</script>',
    user_id: user.id,
    content: `Bad image <img src="https://url.to.file.which/does-not.exist" onerror="alert(document.cookie);">. But not <strong>all</strong> bad.`,
  }
  const expectedLiquor = {
    ...makeExpectedLiquor([user], maliciousLiquor),
    liquor_name: 'Naughty naughty very naughty &lt;script&gt;alert(\"xss\");&lt;/script&gt;',
    content: `Bad image <img src="https://url.to.file.which/does-not.exist">. But not <strong>all</strong> bad.`,
  }
  return {
    maliciousLiquor,
    expectedLiquor,
  }
}

function makeLiquorsFixtures() {
  const testUsers = makeUsersArray()
  const testLiquors = makeLiquorsArray(testUsers)
  const testReviews = makeReviewsArray(testUsers, testLiquors)
  return { testUsers, testLiquors, testReviews }
}

function cleanTables(db) {
  return db.raw(
    `TRUNCATE
      neat_liquors,
      neat_users,
      neat_reviews
      RESTART IDENTITY CASCADE`
  )
}

function seedUsers(db, users) {
  const preppedUsers = users.map(user => ({
    ...user,
    password: bcrypt.hashSync(user.password, 1)
  }))
  return db.into('neat_users').insert(preppedUsers)
    .then(() =>
      // update the auto sequence to stay in sync
      db.raw(
        `SELECT setval('neat_users_id_seq', ?)`,
        [users[users.length - 1].id],
      )
    )
}


function seedLiquorsTables(db, users, liquors, reviews=[]) {
  
  return db.transaction(async trx => {
    await seedUsers(trx, users)
    await trx.into('neat_liquors').insert(things)
    // update the auto sequence to match the forced id values
    await trx.raw(
      `SELECT setval('neat_liquors_id_seq', ?)`,
      [liquors[liquors.length - 1].id],
    )
    // only insert comments if there are some, also update the sequence counter
    if (reviews.length) {
      await trx.into('neat_reviews').insert(reviews)
      await trx.raw(
        `SELECT setval('neat_reviews_id_seq', ?)`,
        [reviews[reviews.length - 1].id],
      )
    }
  })
}



function seedMaliciousLiquor(db, user, liquor) {
  return db
    .into('neat_users')
    .insert([user])
    .then(() =>
      db
        .into('neat_liquors')
        .insert([liquor])
    )
}

function makeAuthHeader(user, secret = process.env.JWT_SECRET) {
  const token = jwt.sign({ user_id: user.id }, secret, {
    subject: user.user_name,
         algorithm: 'HS256',
       })
       return `Bearer ${token}`
   }

module.exports = {
  makeUsersArray,
  makeLiquorsArray,
  makeExpectedLiquor,
  makeExpectedLiquorReviews,
  makeMaliciousLiquor,
  makeReviewsArray,

  makeLiquorsFixtures,
  cleanTables,
  seedLiquorsTables,
  seedMaliciousLiquor,
  makeAuthHeader,
  seedUsers,
}
