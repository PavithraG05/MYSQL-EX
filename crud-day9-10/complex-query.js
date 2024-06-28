const {Sequelize, DataTypes, Op} = require('sequelize')

const sequelize = new Sequelize('mydb1','root','root1405',{
    host:"localhost",
    dialect:"mysql"
})

const Post = require('./model/post')


async function complexPost(){
    await sequelize.sync({ 
        logging:console.log,
        force:true
    })
    const post = await Post.findAll({
        where:{
            title:{
                [Op.like]:"sixth%"
            }
        },
        order:[
            ['title','ASC']
        ],
       limit:1,
       offset:0
    })
    console.log(`Displaying: ${JSON.stringify(post, null, 2)}`)
    await sequelize.close()
}

complexPost()
