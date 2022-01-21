module.exports = (sequelize, DataTypes) =>{
    const LocationOwner = sequelize.define("LocationOwner", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
        name: {
            // allowNull: false,
            type: DataTypes.STRING,
        },
        address: {
            type: DataTypes.TEXT('long'),
        },
        description: {
            type: DataTypes.STRING(1000),
        },
        contact: {
            type: DataTypes.STRING,
        },
    })

    return LocationOwner;
}