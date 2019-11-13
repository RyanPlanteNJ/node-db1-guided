const express = require('express');
// keep going... open ./posts/post-router.js and see where its "require" leads.
const PostRouter = require('./posts/post-router.js');

const server = express();

server.use(express.json());

server.use('/api/posts', PostRouter);

server.get('/', (req, res) => {
  res.send('<h3>DB Helpers with knex</h3>');
});

module.exports = server;