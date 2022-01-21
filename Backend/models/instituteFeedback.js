module.exports = (sequelize, DataTypes) =>{
    const InstituteFeedback = sequelize.define("InstituteFeedback", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
        feedback:{
            type: DataTypes.TEXT('LONG'),
        }
    })
    return InstituteFeedback;
}