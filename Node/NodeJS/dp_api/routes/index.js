
/*
 * GET home page.
 */

exports.data = function(req, res){

	var phantomProxy = require('phantom-proxy');

	phantomProxy.create({}, function (proxy) {
		var page = proxy.page;
		
		proxy.page.set('viewportSize', { width:1000, height:1000 }, function (result) {
			console.log(result.toString().cyan);
			//worldCallback.call(self);		  
								
			
			page.open('http://localhost:3000/static/test.html', function () {
				page.waitForSelector('body', function () {
					console.log('body tag present');									
										
					var result = page.evaluate(function() {
								
						var divContainer = document.getElementById('wrapper0');
						
						if (divContainer)
						{			
							var result = new Array;
							var top, left, parent;
							var coords = "";
							
							var elems = document.getElementsByTagName('div');
							for (var i in elems) {
								if((' ' + elems[i].className + ' ').indexOf(' ' + "listing" + ' ') > -1) {
								
									var element = elems[i];
								
									top = element.offsetTop;
									left = element.offsetLeft;
									parent = element.offsetParent;
						
									while (parent != null)
									{
										top = parseInt(top) + parseInt(parent.offsetTop); 
										left = parseInt(left) + parseInt(parent.offsetLeft);
										parent = parent.offsetParent;
									}
														
									coords += top + ";" + left + ";" + element.offsetWidth + ";" + element.offsetHeight + ",";
								}
							}
							
							return '{"height": "' + coords + '"}';
							//return '{"top": "' + top + '", "left": "' + left +  '", "height": "' + divContainer.offsetHeight + '"}'
													
						} else {
							console.log('Element not found');
						}
					}, function(result){ 
						result = JSON.parse(result);						
						
						if (result) {
							res.render('index', { coords: result });
						}		
						else{
							res.render('index', { coords: {height:-1} });
						}						
						
						
					});
				});
			});
		});		
	});
};



exports.image = function(req, res){

	var phantomProxy = require('phantom-proxy');

	phantomProxy.create({}, function (proxy) {
		var page = proxy.page;
		
		proxy.page.set('viewportSize', { width:1000, height:1000 }, function (result) {
			console.log(result.toString().cyan);
			//worldCallback.call(self);		  
									
			
			page.open('http://localhost:3000/static/test.html', function () {
				page.waitForSelector('body', function () {
					console.log('body tag present');									
					
					page.render('./scratch/scratch.png', function (result) {						
						res.redirect('http://' + req.get('host') + '/screenshots/scratch.png');						
						proxy.end(function () {
						  console.log('done');
						});
					});				
					
				});
			});
						
		});		
	});
};