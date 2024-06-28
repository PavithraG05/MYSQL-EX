const {Sequelize, DataTypes} = require('sequelize')

const sequelize = new Sequelize('mydb1','root','root1405',{
    host:"localhost",
    dialect:"mysql"
})

const Post = require('./model/post')

Post.addHook('beforeUpdate',(post,options) => {
    console.log(`before updating loggin a message ${post}`)
})

async function updatePost(){
    await sequelize.sync({
        logging:console.log,
        force:true
    })
    const post = await Post.findByPk(2)
    console.log(`Displaying post ${JSON.stringify(post, null, 2)}`)
    post. content = "this is the updated content 1"
    await post.save()
    console.log(`Updated post ${JSON.stringify(post, null, 2)}`)
    await sequelize.close()
}

updatePost()