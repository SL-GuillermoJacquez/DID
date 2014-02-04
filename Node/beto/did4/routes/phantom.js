exports.data = function(req, res){

	var phantomProxy = require('phantom-proxy');

	phantomProxy.create({}, function (proxy) {
		var page = proxy.page;
		
		proxy.page.set('viewportSize', { width:800, height:600 }, function (result) {
			console.log(result.toString().cyan);
			//worldCallback.call(self);		  
			
			var pagenumber = req.query.pagenumber;
			var url = "http://" + req.get('host') + "/getcontentpage?campaignid=33b830157262d019&siteid=1469&contentgroupid=500317&storeid=2540751&returnreviewflag=Y&languageid=1&pagenumber=" + pagenumber
						
			page.open(url, function () {
				page.waitForSelector('body', function () {
					console.log('body tag present');									
										
					var result = page.evaluate(function() {
								
						var divContainer = document.getElementById('dynamicPageMaincontent');
						
						if (divContainer)
						{			
						
							return "bbbbbbb";
						
							var result = new Array;
							var top, left, parent;
							var coords = "";
							
							var elems = document.getElementsByTagName('div');
							for (var i in elems) {
								if((' ' + elems[i].className + ' ').indexOf(' ' + "	dp_itemSmall" + ' ') > -1) {
								
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
						console.log("RESULTS:::" + result);
						result = JSON.parse(result);						
						
						if (result) {
							res.render('phantom', { coords: result });
						}		
						else{
							res.render('phantom', { coords: {height:-1} });
						}						
						
						
					});
				});
			});
		});		
	});
};



exports.image = function(req, res){

	//console.log('wft?')

	var phantomProxy = require('phantom-proxy');

	phantomProxy.create({}, function (proxy) {
		var page = proxy.page;

		proxy.page.set('viewportSize', { width:800, height:600 }, function (result) {
			console.log(result.toString().cyan);
			//worldCallback.call(self);		  
			
			var pagenumber = req.query.pagenumber;
			var url = "http://" + req.get('host') + "/getcontentpage?campaignid=33b830157262d019&siteid=1469&contentgroupid=500317&storeid=2540751&returnreviewflag=Y&languageid=1&pagenumber=" + pagenumber
			
			page.open(url, function () {
				page.waitForSelector('body', function () {
					console.log('body tag presented!!!!!!!');									
					
					page.render('./scratch/scratch_' + pagenumber + '.jpg', function (result) {							
						//proxy.end(function () {
						//  console.log('done');
						//});
						
						res.redirect('http://' + req.get('host') + '/screenshots/scratch_' + pagenumber + '.jpg');		
						//res.send('f')
					});					
				});
			});
						
		});		
	});
};