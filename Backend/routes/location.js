const express = require('express');
const router = express.Router();
const db = require('../models');
const { Op } = require("sequelize");
const  {authJwt}  = require("../middleware");
const  {verifySignUp}  = require("../middleware");
const controller = require("../controller/auth.controller");

//get specific location with photos
router.get('/:location_id',(req,res) =>{
    
    Promise.all([
        db.Location.findOne({where : {id: req.params.location_id}}),
        db.LocationPhoto.findAll({where : {id : req.params.location_id}})
    ]).then(location => {
        let data = {}
        data.locationDetails = location[0];
        data.locationPhotos = location[1];
        res.send(data);
    })
    .catch(err => console.log(err));

})



// get all locations
router.get('/', (req,res) =>{

    const query = { }

    
    if(req.query.address != undefined)
        query.where.address = req.query.address
    
    if(req.query.limit != undefined)
        query.limit = parseInt(req.query.limit);
    
    if(req.query.offset != undefined)
        query.offset = parseInt(req.query.offset);
    Promise.all([
        db.Location.findAll(query)
    ]).then(locations => {
        let data = locations;
        let locationIds = data.map((e) => {
            return e.id;
        })
        console.log(locations);
        console.log(locationIds);
        if(req.query.sportId != undefined){
            Promise.all([
                db.LocationSportMapping.findAll({ where : {id : {[Op.in] : locationIds} , sportId : req.query.sportId} , attributes: ['locationId'] })
            ]).then(val => {
                data = data.filter((locat) => {
                    return val[0].find(locat.id) === true
                })
                res.send(data);
            })
        }
        else{
            res.send(data);
        }
    })
    .catch(err => console.log(err));
})


router.delete('/:location_id', [authJwt.verifyToken], (req, res) =>{
    db.Location.destroy({
        where:{
            id: req.params.location_id,
        }
    })
    .then(() => res.send("deleted"))
    .catch(err => console.log(err));
})

router.put('/:location_id', [authJwt.verifyToken], (req,res) =>{

    db.Location.update({
        // name: req.body.name,
        },
        {
            where:{
                id: req.params.location_id
            }
        }
    )
    .then(location => res.send(location))
    .catch(err => console.log(err));
})

module.exports = router;
