const products = require('../models/shop.models').products;
const users = require('../models/user.models').users;
const wishlists = require('../models/shop.models').wishlists;
const images = require('../models/shop.models').images;
const orders = require('../models/order.models').orders;
const order_details = require('../models/order.models').order_detail;
const sequelize = require('sequelize');
const db = require('../config/db');
const { Op } = require("sequelize");

// show all data
exports.getHomePage = async(req, res, next) => {
    all = []
    products.findAll(
            // new products
            {
                limit: 10,
                order: [
                    ['updated_at', 'DESC']
                ]
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
                                "wishlists"."product_id" = "products"."id"
                        )`),
                                'totalProduct'
                            ]
                        ]
                    },
                    limit: 10,
                    order: [
                        [sequelize.literal('"totalProduct"'), 'DESC']
                    ]
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
                                        "order_details"."product_id" = "products"."id"
                                )`),
                                        'totalProduct'
                                    ]
                                ]
                            },
                            limit: 10,
                            order: [
                                [sequelize.literal('"totalProduct"'), 'DESC']
                            ]
                        })
                        .then(bestSellingProducts => {
                            //res.status(200).json(bestSellingProducts);
                            const data = {
                                newProducts: productsNew,
                                bestLoveProducts: wishlistsProducts,
                                bestSellingProducts: bestSellingProducts
                            }
                            res.status(200).render('homePage', {
                                data: data,
                                isAuthenticated: req.session.isLoggedIn
                            })
                        })
                        .catch(err => console.log(err))
                })
                .catch(err => console.log(err))
        })
        .catch(err => console.log(err));
}

exports.getDetailProduct = (req, res, next) => {
    const user = req.session.user;
    const slug = req.params.slug;
    // chưa có user
    if (user == null) {
        products.findOne({
                where: {
                    product_slug: {
                        [Op.eq]: slug
                    }
                },
                include: [{
                    model: images,
                    limit: 4
                }]
            })
            .then(product => {
                return res.status(200).render('products/productDetail', {
                    product
                });
            })
            .catch(err => console.log(err))
    } else {
        // có user
        products.findOne({
                where: {
                    product_slug: slug
                },
                include: [{
                        model: users,
                        as: 'productLiked',
                        through: { // if not found then return empty array []
                            where: {
                                user_id: user.id
                            }
                        }
                    },
                    {
                        model: images
                    },
                ],
                order: [
                    [{ model: images }, 'id', 'ASC']
                ]
            })
            .then(product => {
                return res.status(200).render('products/productDetail', {
                    product
                });
            })
            .catch(err => console.log(err))
    }
}

exports.postDetailProduct = async(req, res, next) => {
    const product_id = req.body.product_id;
    const price = req.body.price;
    const quantity = req.body.quantity;
    const userSession = req.session.user;
    const order = await
    orders.findOne({
            where: {
                user_id: {
                    [Op.eq]: userSession.id
                },
                status: {
                    [Op.eq]: null
                }
            }
        })
        .then(order => {
            if (!order) { // create new order
                orders.create({ // insert order to db
                        order_number: 1234,
                        user_id: userSession.id,
                        total: price * quantity,
                    })
                    .then(ord => {
                        order_details.create({ // insert to order_detail
                                product_id: product_id,
                                order_id: ord.id,
                                price: price,
                                quantity: quantity,
                                total: quantity * price
                            })
                            .then(result => {
                                res.redirect('/cart')
                            })
                            .catch(err => console.log(err))
                    })
                    .catch(err => console.log(err))

            } else { // update product if exists
                order_details.findOne({
                        where: {
                            order_id: {
                                [Op.eq]: order.id
                            },
                            product_id: {
                                [Op.eq]: product_id
                            }
                        }
                    })
                    .then(dt => {
                        if (!dt) {
                            order_details.create({ // insert to order_detail
                                    product_id: product_id,
                                    order_id: order.id,
                                    price: price,
                                    quantity: quantity,
                                    total: quantity * price
                                })
                                .then(result => {
                                    order.total = parseInt(order.total) + price * quantity;
                                    order.save();
                                    res.redirect('/cart')
                                })
                                .catch(err => console.log(err))
                        } else { // update quantity of product in order_detail
                            dt.quantity = parseInt(dt.quantity) + parseInt(quantity);
                            dt.total = dt.quantity * price;
                            dt.save();

                            order.total = parseInt(order.total) + price * quantity;
                            order.save();
                            res.redirect('/cart')
                        }

                    })
                    .catch(err => console.log(err));
            }
        })
        .catch(err => console.log(err));
}