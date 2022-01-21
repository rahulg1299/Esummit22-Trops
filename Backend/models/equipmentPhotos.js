module.exports = (sequelize, DataTypes) =>{
    const EquipmentPhotos = sequelize.define("EquipmentPhotos", {
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
    })
    return EquipmentPhotos;
}