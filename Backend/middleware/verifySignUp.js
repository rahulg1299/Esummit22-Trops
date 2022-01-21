const db = require("../models");
const User = db.User;

checkDuplicateUser = (req, res, next) => {
  
    // Email
    User.findOne({
      where: {
        email: req.body.email
      }
    }).then(user => {
      if (user) {
        res.status(400).send({
          message: "Failed! Email is already in use!"
        });
        return;
      }

      User.findOne({
          where: {
              contact: req.body.contact
          }
      }).then(user => {
        if (user) {
            res.status(400).send({
                message: "Failed! Email is already in use!"
        });
        return;
        }
      })

      next();
    });
};

const verifySignUp = {
    checkDuplicateUser: checkDuplicateUser,
};

module.exports = verifySignUp;