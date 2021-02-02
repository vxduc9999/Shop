const path = require('path')
const express = require('express')
const bodyParser = require('body-parser')

const app = express();

app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.json());

const port = 3000

const Shop = require('./routes/shopRoute');
const User = require('./routes/userRoute');
app.use(Shop);
app.use(User);

// // // get all
// // app.get('/', async (req, res) => {
// //     try {
// //         const t = await pool.query("select * from users");
// //         console.log(res.json(t.rows));
// //     } catch (err) {
// //         console.error(err.message);
// //     }
// // })

// // // get with id
// // app.get('/:id', async (req, res) => {
// //     try {
// //         const { id } = req.params;
// //         const t = await pool.query("select * from users where id = $1", [id]);
// //         console.log(res.json(t.rows));
// //     } catch (err) {
// //         console.error(err.message);
// //     }
// // })

// // // post
// // app.post('/insert', async (req, res) => {
// //     try {
// //         const { id } = req.params;
// //         const { name } = req.body;
// //         const t = await pool.query("insert into users (name) values($1)", [name]);
// //         console.log(res.json(t.rows));
// //     } catch (err) {
// //         console.error(err.message);
// //     }
// // })

// // // update
// // app.put('/update/:id', async (req, res) => {
// //     try {
// //         const { id } = req.params;
// //         const { name } = req.body;
// //         const t = await pool.query("update users set name = $1 where id = $2", [name, id]);
// //         console.log(res.json(t.rows));
// //     } catch (err) {
// //         console.error(err.message);
// //     }
// // })

// // // delete
// // app.delete('/delete/:id', async (req, res) => {
// //     try {
// //         const { id } = req.params;
// //         const { name } = req.body;
// //         const t = await pool.query("delete from users where id = $1", [id]);
// //         console.log(res.json(t.rows));
// //     } catch (err) {
// //         console.error(err.message);
// //     }
// // })


app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})



