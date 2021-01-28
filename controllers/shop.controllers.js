const users = require('../models/shop.models');
const db = require('../config/db');

// show all data
exports.getHomePage = async (req, res, next) => {
    users.findAll()
        .then(users => {
            res.status(200).render('index',
                {
                    title: 'Apple',
                    users
                }
            );
        })
        .catch(err => console.log(err));
}

// get add user
exports.getAddToDB = (req, res, next) => {
    res.status(200).render('addUser');
}

// post add user
exports.addToDB = async (req, res, next) => {
    const title = req.body.title;
    const imageUrl = req.body.imageUrl;
    const description = req.body.description;
    const price = req.body.price;
    users.create({
        name: title
    })
        .then(() => res.status(200).redirect('/add'))
        .catch(err => console.log(err));
}

//update user
exports.updateById = async (req, res, next) => {
    const id = req.params.id;
    const name = req.body.name;
    users.update(
        { name: name },
        { where: { id: id } }
    )
        .then(() => res.status(200).redirect('/'))
        .catch(err => console.log(err));
}

// delete user
exports.deleteById = async (req, res, next) => {
    const id = req.params.id;
    users.destroy(
        { where: { id: id } }
    )
        .then(() => res.status(200).redirect('/'))
        .catch(err => console.log(err));
}