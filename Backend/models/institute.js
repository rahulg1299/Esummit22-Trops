module.exports = (sequelize, DataTypes) =>{
    const Insitute = sequelize.define("Insitute", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
        name: {
            // allowNull: false,
            type: DataTypes.STRING(500),
        },
        contact:{
            // allowNull: false,
            type: DataTypes.STRING(500),
        },
        address: {
            // allowNull: false,
            type: DataTypes.STRING,
        },
        description:{
            type: DataTypes.TEXT('LONG'),
        },
        // feedback:{

        // }
    })
    return Insitute;
}