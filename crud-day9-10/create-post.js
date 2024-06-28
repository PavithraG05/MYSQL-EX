const {Sequelize, DataTypes} = require('sequelize')

const sequelize = new Sequelize('mydb1','root','root1405',{
    host:"localhost",
    dialect:"mysql"
})

const Post = require('./model/post')


async function createPost(){
    await sequelize.sync({ 
        logging:console.log,
        force:true
    })
    const post = await Post.create({
        title: "sixth post",
        content: "This is the content of third post"
    })
    console.log(`Post created ${post.toJSON()}`)
    await sequelize.close()
}

createPost()
