const {Sequelize} = require('sequelize')

const sequelize = new Sequelize('mydb1','root','root1405',{
    host:"localhost",
    dialect:"mysql"
})

const Post = require('./model/post')

async function readPosts(){
    await sequelize.sync({
        logging:console.log,
        force:true
    })
    const post = await Post.findAll()
    console.log(`Displaying all posts ${JSON.stringify(post, null, 2)}`)
    await sequelize.close()
}

readPosts()