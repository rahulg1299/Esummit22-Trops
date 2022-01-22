"use strict";

const fs = require("fs");
const path = require("path");
const Sequelize = require("sequelize");
const basename = path.basename(__filename);
const env = process.env.NODE_ENV || "development";
const config = require(__dirname + "/../config/config.json")[env];
const db = {};

let sequelize;
if (config.use_env_variable) {
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
  sequelize = new Sequelize(
    config.database,
    config.username,
    config.password,
    config
  );
}

// fs.readdirSync(__dirname)
//   .filter((file) => {
//     return (
//       file.indexOf(".") !== 0 && file !== basename && file.slice(-3) === ".js"
//     );
//   })
//   .forEach((file) => {
//     const model = require(path.join(__dirname, file))(
//       sequelize,
//       Sequelize.DataTypes
//     );
//     db[model.name] = model;
//   });

Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

// // ASSOCIATIONS - FOREIGN KEYS
// // Groups
// // db.Group.hasMany(db.Group_Member_Mapping, { foreignKey: "groupId" });
// db.Group.hasMany(db.Notice, { foreignKey: "groupId" });
// db.Group.hasMany(db.Event, { foreignKey: "groupId" });
// db.Group.hasMany(db.Group_Link, { foreignKey: 'groupId'});
// db.Group.hasMany(db.Blog, { foreignKey: "groupId" });
// db.Group.hasMany(db.Member, {foreignKey: "groupId"});
// db.Group.hasMany(db.Gallery, { foreignKey: "groupId" });

db.Equipment.hasMany(db.EquipmentPhotos, { foreignKey: "equipmentId" });
db.Equipment.belongsTo(db.EquipmentType, { foreignKey: "equipmentTypeId" })
db.Equipment.belongsTo(db.Sport, { foreignKey: 'sportId' })

db.EquipmentPhotos.belongsTo(db.Equipment, { foreignKey: "equipmentId" })


db.EquipmentType.hasMany(db.Equipment, { foreignKey: "equipmentTypeId" })



db.Sport.hasMany(db.Equipment, { foreignKey: 'sportId' })
db.Sport.hasMany(db.Coach, { foreignKey: 'sportId' })
db.Sport.hasMany(db.InstituteSportMapping, {foreignKey : 'sportId'})
db.Sport.hasMany(db.LocationSportMapping, {foreignKey : 'sportId'})

db.Coach.belongsTo(db.Sport, {foreignKey : 'sportId'})

db.User.hasMany(db.LocationSlot, {foreignKey : 'userId'})


db.Institute.hasMany(db.InstitutePhoto, {foreignKey: 'instituteId'})
db.Institute.hasMany(db.InstituteSportMapping , {foreignKey: 'instituteId'})
db.Institute.hasMany(db.InstituteFeedback, {foreignKey : 'instituteId'})


db.InstituteSportMapping.belongsTo(db.Institute , {foreignKey: 'instituteId'})
db.InstituteSportMapping.belongsTo(db.Sport, {foreignKey: 'sportId'})

db.InstitutePhoto.belongsTo(db.Institute, {foreignKey: 'instituteId'})


db.InstituteFeedback.belongsTo(db.Institute, {foreignKey : 'instituteId'})

db.Location.hasMany(db.LocationPhoto, {foreignKey: 'locationId'})
db.Location.hasMany(db.LocationSlot, {foreignKey : 'locationId'})
db.Location.hasMany(db.LocationSportMapping , {foreignKey : 'locationId'})

db.LocationPhoto.belongsTo(db.Location , {foreignKey : 'locationId'})

db.LocationSlot.belongsTo(db.Location, {foreignKey : 'locationId'})
db.LocationSlot.belongsTo(db.User, {foreignKey : 'userId'})


db.LocationSportMapping.belongsTo(db.Location, {foreignKey : 'locationId'})
db.LocationSportMapping.belongsTo(db.Sport, {foreignKey : 'sportId'})

// //Group_Link
// db.Group_Link.belongsTo(db.Group, { foreignKey: 'groupId'});

// // Members
// db.Member.belongsTo(db.Group, { foreignKey: "groupId" });

// //Notices
// db.Notice.belongsTo(db.Group, { foreignKey: "groupId" });

// //Events
// db.Event.belongsTo(db.Group, { foreignKey: "groupId" });

// //Blogs
// db.Blog.belongsTo(db.Group, { foreignKey: "groupId" });

// //Gallery
// db.Gallery.belongsTo(db.Group, { foreignKey: "groupId" });
// db.Gallery.hasMany(db.GalleryContent, { foreignKey: "galleryId" });

// //GalleryContent
// db.GalleryContent.belongsTo(db.Gallery, { foreignKey: "galleryId" });

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;
