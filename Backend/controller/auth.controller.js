const db = require("../models");
const config = require("../config/auth.config");
// const Group = db.Group;
// const Role = db.role;

const Op = db.Sequelize.Op;

var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");


exports.signup = (req, res) => {
  // Save User to Database

    User.create({
        name: req.body.name,
        email: req.body.email,
        password: bcrypt.hashSync(req.body.password, 8),
    })
    .then(user => {
      res.send({ message: "User was registered successfully!" });
    })
    .catch(err => {
      res.status(500).send({ message: err.message });
    });
};

exports.signin = (req, res) => {
  User.findOne({
    where: {
      email: req.body.email
    }
  })
    .then(user => {
      if (!user) {
        return res.status(404).send({ message: "User Not found." });
      }
      var passwordIsValid = bcrypt.compareSync(
        req.body.password,
        group.password
      );
      if (!passwordIsValid) {
        return res.status(401).send({
          accessToken: null,
          message: "Invalid Password!"
        });
      }

      var token = jwt.sign({ id: group.id }, config.secret, {
        expiresIn: 86400 // 24 hours
      });

    //   var authorities = [];
    //   user.getRoles().then(roles => {
    //     for (let i = 0; i < roles.length; i++) {
    //       authorities.push("ROLE_" + roles[i].name.toUpperCase());
    //     }
    //     res.status(200).send({
    //       id: user.id,
    //       username: user.username,
    //       email: user.email,
    //       roles: authorities,
    //       accessToken: token
    //     });
    //   });
      res.status(200).send({
        id: group.id,
        name: group.name,
        email: group.email,
        accessToken: token
      });
    })
    .catch(err => {
      res.status(500).send({ message: err.message });
    });
};


exports.verifyUser = (req, res) =>{
  let token = req.headers["x-access-token"];
  // console.log(token);
  if (!token) {
    return res.status(403).send({
      message: "No token provided!"
    });
  }
  let data = {};
  
  jwt.verify(token, config.secret, (err, decoded) => {
    if (err) {
      data.isAuthenticated = false;
      // data.message 
      return res.status(401).send(data);
    }
    data.isAuthenticated = true;
    data.userId = decoded.id;
    req.userId = decoded.id;
    // User.findByPk(req.userId).then(user => {
    //   if(group.isAdmin){
    //     data.isAdmin = true;
    //   }
    //   else{
    //     data.isAdmin = false;
    //   }
    // })
    
    return res.send(data);
  });
}