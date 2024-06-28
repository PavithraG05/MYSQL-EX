const { Sequelize } = require('sequelize')
const sequelize = new Sequelize('mydb2', 'root', 'root1405', {
  host: 'localhost',
  dialect: 'mysql'
})

const User = require('./model/user')
const Post = require('./model/post')


Post.addHook('beforeCreate',(post,options) => {
    console.log(`before creating logging a message ${post}`)
})

async function syncAndTest() {

    const transaction = await sequelize.transaction()
    try {
        await sequelize.sync()
        console.log('Models synchronized successfully.')

        const user = await User.create({ name: 'John Doe', email: 'john.d7e@example.com' }, { transaction })
        console.log('User created:', user.toJSON())

        const post = await Post.create({ title: 'First Post', content: 'This is my first post!', UserId: user.id }, { transaction })
        console.log('Post created:', post.toJSON())
        await transaction.commit()
        console.log('Transaction committed successfully.')

    } catch (error) {
        await transaction.rollback()
        console.error('Error syncing or testing models:', error)
    } finally {
        await sequelize.close()
    }
}

syncAndTest()