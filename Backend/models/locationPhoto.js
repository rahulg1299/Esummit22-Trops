module.exports = (sequelize, DataTypes) =>{
    const LocationPhoto = sequelize.define("LocationPhoto", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
        img: {
            type: DataTypes.STRING(1000),
        }
    })
    return LocationPhoto;
}