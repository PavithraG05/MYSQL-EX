const {Sequelize, DataTypes} = require('sequelize')

const sequelize = new Sequelize('mydb1','root','root1405',{
    host:"localhost",
    dialect:"mysql"
})

const Post = require('./model/post')


async function filterPost(){
    await sequelize.sync({ 
        logging:console.log,
        force:true
    })
    const post = await Post.findAll({
        where:{
            title:"fifth post"
        }
    })
    console.log(`Displaying: ${JSON.stringify(post, null, 2)}`)
    await sequelize.close()
}

filterPost()
