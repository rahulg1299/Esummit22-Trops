const express = require('express');
const router = express.Router();
const db = require('../models');
const { Op } = require("sequelize");
const  {authJwt}  = require("../middleware");
const  {verifySignUp}  = require("../middleware");
const controller = require("../controller/auth.controller");


router.get('/:user_id',(req,res) =>{
    
    db.User.findOne({where : {id: req.params.user_id}})
    .then(user =>{ res.send(user)})
    .catch(err => console.log(err));
    
})

router.get('/', (req,res) =>{
    db.User.findAll({
        // where: {
        //     name: {[Op.not]: 'Cultural Council'}
        // }
    })
    .then(users => res.send(users))
    .catch(err => console.log(err));
})

router.post('/' ,[ verifySignUp.checkDuplicateUser ], controller.signup )


router.delete('/:user_id', [authJwt.verifyToken], (req, res) =>{
    db.User.destroy({
        where:{
            id: req.params.user_id,
        }
    })
    .then(() => res.send("deleted"))
    .catch(err => console.log(err));
})

router.put('/:user_id', [authJwt.verifyToken], (req,res) =>{
  //console.log(req.body);
  //console.log(req.params.group_id);
    db.User.update({
        name: req.body.name,
        email: req.body.email,
        },
        {
            where:{
                id: req.params.user_id
            }
        }
    )
    .then(user => res.send(user))
    .catch(err => console.log(err));
})

module.exports = router;
