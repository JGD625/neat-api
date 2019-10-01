const knex = require('knex')
const app = require('../src/app')
const helpers = require('./test-helpers')

describe.only('Liquors Endpoints', function() {
  let db

  const {
    testUsers,
    testLiquors,
    testReviews,
  } = helpers.makeLiquorsFixtures()

  function makeAuthHeader(user) {
       const token = Buffer.from(`${user.user_name}:${user.password}`).toString('base64')
       return `Basic ${token}`
     }

  before('make knex instance', () => {
    db = knex({
      client: 'pg',
      connection: process.env.TEST_DB_URL,
    })
    app.set('db', db)
  })

  after('disconnect from db', () => db.destroy())

  before('cleanup', () => helpers.cleanTables(db))

  afterEach('cleanup', () => helpers.cleanTables(db))

describe.only(`Protected endpoints`, () => {
    beforeEach('insert liquors', () =>
      helpers.seedLiquorsTables(
        db,
        testUsers,
        testLiquors,
        testReviews,
      )
    )
    const protectedEndpoints = [
         {
           name: 'GET /api/liquors/:liquor_id',
           path: '/api/liquors/1'
          },
          {
            name: 'GET /api/liquors/:liquor_id/reviews',
            path: '/api/liquors/1/reviews'
          },
        ]
        
  protectedEndpoints.forEach(endpoint => {
      describe(endpoint.name, () => {
          it(`responds 401 'Missing bearer token' when no bearer token`, () => {
        return supertest(app)
          .get(endpoint.path)
          .expect(401, { error: `Missing bearer token` })
        })
      it(`responds 401 'Unauthorized request' when invalid JWT secret`, () => {
          const validUser = testUsers[0]
          const invalidSecret = 'bad-secret'
            return supertest(app)
              .get(endpoint.path)
              .set('Authorization', helpers.makeAuthHeader(validUser, invalidSecret))
              .expect(401, { error: `Unauthorized request` })
               })
      it(`responds 401 'Unauthorized request' when invalid sub in payload`, () => {
          const invalidUser = { user_name: 'user-not-existy', id: 1 }
            return endpoint.method(endpoint.path)
                .set('Authorization', helpers.makeAuthHeader(invalidUser))
                .expect(401, { error: `Unauthorized request` })
            })
       })
     })

  describe(`GET /api/liquors`, () => {
    context(`Given no liquors`, () => {
      it(`responds with 200 and an empty list`, () => {
        return supertest(app)
          .get('/api/liquors')
          .expect(200, [])
      })
    })

    context('Given there are liquors in the database', () => {
      beforeEach('insert liquors', () =>
        helpers.seedLiquorsTables(
          db,
          testUsers,
          testLiquors,
          testReviews,
        )
      )

      it('responds with 200 and all of the liquors', () => {
        const expectedLiquors = testLiquors.map(liquor =>
          helpers.makeExpectedLiquor(
            testUsers,
            liquor,
            testReviews,
          )
        )
        return supertest(app)
          .get('/api/liquors')
          .expect(200, expectedLiquors)
      })
    })

    context(`Given an XSS attack liquor`, () => {
      const testUser = helpers.makeUsersArray()[1]
      const {
        maliciousLiquor,
        expectedLiquor,
      } = helpers.makeMaliciousLiquor(testUser)

      beforeEach('insert malicious thing', () => {
        return helpers.seedMaliciousThing(
          db,
          testUser,
          maliciousLiquor,
        )
      })

      it('removes XSS attack content', () => {
        return supertest(app)
          .get(`/api/liquors`)
          .expect(200)
          .expect(res => {
            expect(res.body[0].title).to.eql(expectedLiquor.title)
            expect(res.body[0].content).to.eql(expectedLiquor.content)
          })
      })
    })
  })

  describe(`GET /api/liquors/:liquor_id`, () => {
    context(`Given no liquors`, () => {
      beforeEach(() =>
      helpers.seedUsers(db, testUsers)
     )
      it(`responds with 404`, () => {
        const liquorId = 123456
        return supertest(app)
          .get(`/api/liquors/${liquorId}`)
          .set('Authorization', makeAuthHeader(testUsers[0]))
          .expect(404, { error: `Liquor doesn't exist` })
      })
    })

    context('Given there are liquors in the database', () => {
      beforeEach('insert liquors', () =>
        helpers.seedLiquorsTables(
          db,
          testUsers,
          testLiquors,
          testReviews,
        )
      )

      it('responds with 200 and the specified liquor', () => {
        const liquorId = 2
        const expectedLiquor = helpers.makeExpectedLiquor(
          testUsers,
          testLiquors[liquorId - 1],
          testReviews,
        )

        return supertest(app)
          .get(`/api/liquors/${liquorId}`)
          .set('Authorization', makeAuthHeader(testUsers[0]))
          .expect(200, expectedLiquor)
      })
    })

    context(`Given an XSS attack liquor`, () => {
      const testUser = helpers.makeUsersArray()[1]
      const {
        maliciousLiquor,
        expectedLiquor,
      } = helpers.makeMaliciousThing(testUser)

      beforeEach('insert malicious liquor', () => {
        return helpers.seedMaliciousLiquor(
          db,
          testUser,
          maliciousLiquor,
        )
      })

      it('removes XSS attack content', () => {
        return supertest(app)
          .get(`/api/liquors/${maliciousLiquor.id}`)
          .set('Authorization', makeAuthHeader(testUsers[0]))
          .expect(200)
          .expect(res => {
            expect(res.body.title).to.eql(expectedLiquor.title)
            expect(res.body.content).to.eql(expectedLiquor.content)
          })
      })
    })
  })

  describe(`GET /api/liquors/:liquor_id/reviews`, () => {
    context(`Given no liquors`, () => {
      beforeEach(() =>
      helpers.seedUsers(db, testUsers)
     )
      it(`responds with 404`, () => {
        const liquorId = 123456
        return supertest(app)
          .get(`/api/liquors/${liquorId}/reviews`)
          .set('Authorization', makeAuthHeader(testUsers[0]))
          .expect(404, { error: `Liquor doesn't exist` })
      })
    })

    context('Given there are reviews for liquor in the database', () => {
      beforeEach('insert liquors', () =>
        helpers.seedLiquorsTables(
          db,
          testUsers,
          testLiquors,
          testReviews,
        )
      )

      it('responds with 200 and the specified reviews', () => {
        const liquorId = 1
        const expectedReviews = helpers.makeExpectedLiquorReviews(
          testUsers, liquorId, testReviews
        )

        return supertest(app)
          .get(`/api/liquors/${liquorId}/reviews`)
          .set('Authorization', makeAuthHeader(testUsers[0]))
          .expect(200, expectedReviews)
      })
    })
  })
})
})
