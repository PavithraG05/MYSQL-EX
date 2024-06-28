const {Sequelize, DataTypes} = require('sequelize')

const sequelize = new Sequelize('mydb1','root','root1405',{
    host:"localhost",
    dialect:"mysql"
})

const Post = require('./model/post')


async function limitPost(){
    await sequelize.sync({ 
        logging:console.log,
        force:true
    })
    const post = await Post.findAll({
       limit:2,
       offset:1
    })
    console.log(`Displaying: ${JSON.stringify(post, null, 2)}`)
    await sequelize.close()
}

limitPost()
