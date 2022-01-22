module.exports = (sequelize, DataTypes) =>{
    const EquipmentType = sequelize.define("EquipmentType", {
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
        coverImg: {
            type: DataTypes.TEXT('long')
        }
    })
    return EquipmentType;
}