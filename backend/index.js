const express = require('express');
const cors = require('cors');
const knex = require('knex');
require('dotenv').config();

const db = knex({
    client: 'pg',
    connection: {
        host: process.env.DATABASE_HOST,
        user: process.env.DATABASE_USERNAME,
        password: process.env.DATABASE_PASSWORD,
        database: process.env.DATABASE,
    },
});

const app = express();

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// CORS implemented so that we don't get errors when trying to access the server from a different server location
app.use(cors());

// GET: Fetch all movies from the database
app.get('/', (req, res) => {
    db.select('*')
        .from('attrition')
        .then((data) => {
            console.log(data);
            res.json(data);
        })
        .catch((err) => {
            console.log(err);
        });
});

// GET: Fetch movie by movieId from the database
app.get('/:empid', (req, res) => {
    const empid = req.params.empid;
    db.select('*')
        .from('attrition')
        .where('empid', '=', empid)
        .then((data) => {
            console.log(data);
            res.json(data);
        })
        .catch((err) => {
            console.log(err);
        });
});

// POST: Create movies and add them to the database
app.post('/addEmployeeAttrition', (req, res) => {
    const { attrition, attrition_reason, deptid, empid, yearssincelastpromotion, yearswithcurrentmanager } = req.body;
    db('attrition')
        .insert({
            attrition: attrition,
            attrition_reason: attrition_reason,
            deptid: deptid,
            empid: empid,
            yearssincelastpromotion: yearssincelastpromotion,
            yearswithcurrentmanager: yearswithcurrentmanager
        })
        .then(() => {
            console.log('Employee attrition Added');
            return res.json({ msg: 'Employee attrition details Added' });
        })
        .catch((err) => {
            console.log(err);
        });
});

// DELETE: Delete movie by movieId from the database
app.delete('/delete-attrition', (req, res) => {
    const empid = req.body;
    const empIdToDelete = Number(empid.empid);
    console.log(empIdToDelete);
    db('attrition')
        .where('empid', '=', empIdToDelete)
        .del()
        .then(() => {
            console.log('Attrtion record Deleted');
            return res.json({ msg: 'Attrition record Deleted' });
        })
        .catch((err) => {
            console.log(err);
        });
});

// PUT: Update movie by movieId from the database
// app.put('/update-attrition', (req, res) => {
//     db('attrition')
//         .where('empid', '=', 1)
//         .update({ movie_name: 'Goldeneye' })
//         .then(() => {
//             console.log('Movie Updated');
//             return res.json({ msg: 'Movie Updated' });
//         })
//         .catch((err) => {
//             console.log(err);
//         });
// });

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server running on port ${port}, http://localhost:${port}`));