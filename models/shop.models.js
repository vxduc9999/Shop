const Sequelize = require('sequelize');
const db = require('../config/db');

// users
const users = db.define('users', {
    name: {
        type: Sequelize.STRING
    }
}, {
    timestamps: false
});


// products
const products = db.define('products', {
    product_id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    product_name: {
        type: Sequelize.STRING
    },
    product_slug: {
        type: Sequelize.STRING
    },
    product_quantity: {
        type: Sequelize.BIGINT
    },
    product_category_id: {
        type: Sequelize.INTEGER
    },
    product_price: {
        type: Sequelize.BIGINT
    },
    product_sale: {
        type: Sequelize.BIGINT
    },
    product_description: {
        type: Sequelize.STRING
    },
    product_thumbnail: {
        type: Sequelize.STRING
    },
    createdAt: {
        type: Sequelize.DATE,
        field: 'created_at'
    },
    updatedAt: {
        type: Sequelize.DATE,
        field: 'updated_at'
    }
}, {
    timestamps: false,
    freezeTableName: true
});

// whislist
const wishlists = db.define('wishlists', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    product_id: {
        type: Sequelize.INTEGER
    },
    user_id: {
        type: Sequelize.INTEGER
    },
}, {
    timestamps: false
});


// order_detail
const order_detail = db.define('order_detail', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    product_id: {
        type: Sequelize.INTEGER
    },
    order_id: {
        type: Sequelize.INTEGER
    },
    user_id: {
        type: Sequelize.INTEGER
    },
    price: {
        type: Sequelize.BIGINT
    },
    quantity: {
        type: Sequelize.BIGINT
    },
    total: {
        type: Sequelize.BIGINT
    },
    createdAt: {
        type: Sequelize.DATE,
        field: 'created_at'
    },
    updatedAt: {
        type: Sequelize.DATE,
        field: 'updated_at'
    }
}, {
    timestamps: false
});

module.exports = {
    users,
    products,
    wishlists
};