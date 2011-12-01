var coffee = require('coffee-script'),
    app    = require('./app');

app.listen(app.port);
console.log("Server listening on port "+app.port);
