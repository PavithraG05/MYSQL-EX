const {Sequelize, DataTypes} = require('sequelize')

const sequelize = new Sequelize('mydb1','root','root1405',{
    host:"localhost",
    dialect:"mysql"
})

const POST = sequelize.define('Post',{
    title:{
        type: DataTypes.STRING,
        allowNull: false
    },
    content:{
        type: DataTypes.TEXT,
        allowNull: false
    }},   
        {
            hooks: {
                beforeCreate: (post, options) => {
                console.log('Before creating a post:', post)
                },
                afterCreate: (post, options) => {
                console.log('After creating a post:', post)
                }
            }
        }
)

// async function syncModel() {
//     await POST.sync()
//     console.log('User model was synchronized successfully.')
//   }

// syncModel()
module.exports = POST