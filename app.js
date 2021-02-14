const path = require('path')
const express = require('express')
const bodyParser = require('body-parser')
const session = require('express-session');
const userModel = require('./models/user.models').users;
require('dotenv').config();

const app = express();

app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.json());

const port = process.env.PORT

const Shop = require('./routes/shopRoute');
const User = require('./routes/userRoute');
const Cart = require('./routes/cartRoute');

// setting session
app.use(session({
    secret: 'mySecretKey',
    resave: true,
    saveUninitialized: false
}));

app.use((req, res, next) => {
    if (!req.session.user) {
        return next();
    }
    userModel.findByPk(req.session.user._id)
        .then(user => {
            req.user = user;
            next();
        })
        .catch(err => console.log(err));
});

app.use(Shop);
app.use(User);
app.use(Cart);

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})