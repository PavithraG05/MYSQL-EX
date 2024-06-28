const { Sequelize } = require('sequelize')
const sequelize = new Sequelize('mydb3', 'root', 'root1405', {
  host: 'localhost',
  dialect: 'mysql'
})

const User = require('./model/user')
const Post = require('./model/post')

async function syncAndTest() {
  try {
    await sequelize.sync({ force: true }) // This will drop and recreate the tables
    console.log('Models synchronized successfully.')

    const user = await User.create({ name: 'John Doe', email: 'john.d6e@example.com' })
    console.log('User created:', user.toJSON())

    const post = await Post.create({ title: 'First Post', content: 'This is my first post!', UserId: user.id })
    console.log('Post created:', post.toJSON())

    // // const posts = await User.findById(user.id, {include: Post })
    // // console.log('User with posts:', JSON.stringify(posts, null, 2))
    const posts = await User.findOne({ where: { id: user.id }, include: Post })
    console.log('User with posts:', JSON.stringify(posts, null, 2))

  } catch (error) {
    console.error('Error syncing or testing models:', error)
  } finally {
    await sequelize.close()
  }
}

syncAndTest()