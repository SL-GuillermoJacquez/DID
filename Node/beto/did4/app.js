
/**
 * Module dependencies.
 */

var express = require('express');
var routes = require('./routes');
var phantom = require('./routes/phantom');
var http = require('http');
var path = require('path');
var mongo = require('mongodb');
var monk = require('monk');
var request = require('request');
var db = monk('localhost:27017/did4');
var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(express.cookieParser('your secret here'));
app.use(express.session());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));
app.use('/screenshots/', express.static(path.join(__dirname, 'scratch')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

app.get('/', routes.index);
app.get('/getcontentpage', routes.getcontentpage);
app.get('/getpages', routes.getpages);

app.get('/data', phantom.data);
app.get('/image', phantom.image);


http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

