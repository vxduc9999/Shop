const products = require('../models/shop.models').products;
const users = require('../models/shop.models').users;
const wishlists = require('../models/shop.models').wishlists;
const sequelize = require('sequelize');
const db = require('../config/db');

// show all data
exports.getHomePage = async (req, res, next) => {
    all = []
    products.findAll(
        // new products
        {
            limit: 10,
            order: [['updated_at', 'DESC']]
        })
        .then(productsNew => {
            // best love products
            products.findAll({
                attributes: {
                    include: [
                        [sequelize.literal(
                            `(
                            SELECT COUNT(*) FROM "wishlists" 
                            WHERE 
                                "wishlists"."product_id" = "products"."product_id"
                        )`),
                            'totalProduct'
                        ]
                    ]
                },
                limit: 10,
                order: [[sequelize.literal('"totalProduct"'), 'DESC']]
            })
                .then(wishlistsProducts => {
                    // best selling products
                    products.findAll({
                        attributes: {
                            include: [
                                [sequelize.literal(
                                    `(
                                    SELECT COUNT(*) FROM "order_details" 
                                    WHERE 
                                        "order_details"."product_id" = "products"."product_id"
                                )`),
                                    'totalProduct'
                                ]
                            ]
                        },
                        limit: 10,
                        order: [[sequelize.literal('"totalProduct"'), 'DESC']]
                    })
                        .then(bestSellingProducts => {
                            //res.status(200).json(bestSellingProducts);
                            const data = {
                                newProducts: productsNew,
                                bestLoveProducts: wishlistsProducts,
                                bestSellingProducts: bestSellingProducts
                            }
                            res.status(200).render('homePage', {
                                data: data
                            })
                        })
                        .catch(err => console.log(err))
                })
                .catch(err => console.log(err))
        })
        .catch(err => console.log(err));

    // products.findAll({ limit: 10 }) // products
    //     .then(products => {
    //         wishlists.findAll({ limit: 10 }) // wishlist
    //             .then(wishlists => {
    //                 const data = {
    //                     products: products,
    //                     wishlists: wishlists
    //                 }
    //                 res.status(200).json(data.wishlists);
    //             })
    //             .catch(err => console.log(err));
    //     })
    //     .catch(err => console.log(err));
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