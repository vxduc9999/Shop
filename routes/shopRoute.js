const path = require('path');
const express = require('express');

const router = express.Router();
const Shop = require('../controllers/shop.controllers');

router.get('/', Shop.getHomePage);

router.get('/add', Shop.getAddToDB);

router.post('/add', Shop.addToDB);

router.put('/update/:id', Shop.updateById);

router.delete('/delete/:id', Shop.deleteById)

module.exports = router;