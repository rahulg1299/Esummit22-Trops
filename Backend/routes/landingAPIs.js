const express = require('express');
const router = express.Router();
const db = require('../models');
const { Op } = require("sequelize");
const  {authJwt}  = require("../middleware");
const  {verifySignUp}  = require("../middleware");
const controller = require("../controller/auth.controller");

// equipment landing page
router.get('/equipment',(req,res) =>{
    const data = {}

    Promise.all([
        db.Equipment.findAll({where : {toBuy : true} , limit : 5 }),
        db.Equipment.findAll({where : {toBuy :false} , limit : 5 }),
    ]).then(value => {
        data.toBuyEquipments = value[0]
        data.toRentEquipments = value[1]
        res.send(data);
    }).catch(err => console.log(err));
    
})


module.exports = router;