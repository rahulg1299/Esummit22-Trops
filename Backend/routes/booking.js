const express = require('express');
const router = express.Router();
const db = require('../models');
const { Op } = require("sequelize");
const  {authJwt}  = require("../middleware");
const  {verifySignUp}  = require("../middleware");
const controller = require("../controller/auth.controller");

//get specific location slots
router.get('/:location_id',(req,res) =>{
    
    //need to add - show only upcoming slots

    db.LocationSlot.findAll({where : {locationId: req.params.location_id , status: "AVAILABLE"}})
    .then(slots => res.send(slots))
    .catch(err => console.log(err))

})


//book slot
router.put('/:slot_id', [authJwt.verifyToken] ,(req,res) =>{

    db.LocationSlot.update({
        status: "BOOKED",
        userId: req.userId,
        },
        {
            where:{
                id: req.params.slot_id
            }
        }
    )
    .then(slot => res.send(slot))
    .catch(err => console.log(err));

})

//delete slot
router.delete('/:slot_id', [authJwt.verifyToken] ,(req,res) =>{

    db.LocationSlot.destroy(
        {
            where:{
                id: req.params.slot_id
            }
        }
    )
    .then(slot => res.send(slot))
    .catch(err => console.log(err));

})


module.exports = router;
