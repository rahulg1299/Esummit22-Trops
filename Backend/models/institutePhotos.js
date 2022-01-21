module.exports = (sequelize, DataTypes) =>{
    const InstitutePhoto = sequelize.define("InstitutePhoto", {
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
    return InstitutePhoto;
}