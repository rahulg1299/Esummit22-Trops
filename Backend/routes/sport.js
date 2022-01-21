const express = require('express');
const router = express.Router();
const db = require('../models');
const { Op } = require("sequelize");
const  {authJwt}  = require("../middleware");
const  {verifySignUp}  = require("../middleware");
const controller = require("../controller/auth.controller");


router.get('/:sport_id',(req,res) =>{
    
    db.Sport.findOne({where : {id: req.params.sport_id}})
    .then(sport =>{ res.send(sport)})
    .catch(err => console.log(err));
    
})

router.get('/', (req,res) =>{
    db.Sport.findAll({
        // where: {
        //     name: {[Op.not]: 'Cultural Council'}
        // }
    })
    .then(sports => res.send(sports))
    .catch(err => console.log(err));
})


router.delete('/:sport_id', [authJwt.verifyToken], (req, res) =>{
    db.Sport.destroy({
        where:{
            id: req.params.sport_id,
        }
    })
    .then(() => res.send("deleted"))
    .catch(err => console.log(err));
})

router.put('/:sport_id', [authJwt.verifyToken], (req,res) =>{

    db.Sport.update({
        name: req.body.name,
        },
        {
            where:{
                id: req.params.sport_id
            }
        }
    )
    .then(sport => res.send(sport))
    .catch(err => console.log(err));
})

module.exports = router;
