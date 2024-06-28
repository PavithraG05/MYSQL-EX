const {Sequelize, DataTypes} = require('sequelize')

const sequelize = new Sequelize('mydb1','root','root1405',{
    host:"localhost",
    dialect:"mysql"
})

const Post = require('./model/post')

async function deletePost(){
    await sequelize.sync({
        logging:console.log,
        force:true
    })
    const post = await Post.findByPk(1)
    console.log(`Displaying post ${JSON.stringify(post, null, 2)}`)
    await post.destroy()
    console.log(`deleted post successfully`)
    await sequelize.close()
}

deletePost()