module.exports = (sequelize, DataTypes) =>{
    const Equipment = sequelize.define("Equipment", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
        name: {
            allowNull: false,
            type: DataTypes.STRING(500),
        },
        // equipmentType: {
        //     allowNull: false,
        //     type: DataTypes.STRING(500),
        // },
        equipmentStatus: {
            type: sequelize.BOOLEAN,
            defaultValue: false
        },
        address: {
            type: DataTypes.TEXT('long'),
        },
        description: {
            type: DataTypes.TEXT('long'),
        },
        cost :{
            allowNull: false,
            type : DataTypes.INTEGER
        }


    })
    return Equipment;
}