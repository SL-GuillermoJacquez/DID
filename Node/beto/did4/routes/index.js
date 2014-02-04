
/*
 * GET home page.
 */


var request = require('request');

exports.index = function(req, res){
  res.render('index', { title: 'Express' });
};

exports.getcontentpage = function(req, res){
	//campaignid=33b830157262d019&siteid=1469&contentgroupid=500070&storeid=2540751&pagenumber=1&returnreviewflag=Y&languageid=1&callback=dpcallback
	var storeid = req.query.storeid;
	var contentgroupid = req.query.contentgroupid;
	var siteid = req.query.siteid;
	var pagenumber =  req.query.pagenumber;
	var returnreviewflag = req.query.returnreviewflag;
	var languageid = req.query.languageid;
	var campaignid = req.query.campaignid;
	var url = "http://vqascweb1.scmvc.crossmediaservices.com/HomeDepot/ContentPage/Get?CampaignID=" + campaignid + "&siteid=" + siteid + "&contentgroupid=" + contentgroupid + "&storeid=" + storeid + "&pagenumber=" + pagenumber + "&ReturnReviewFlag=" + returnreviewflag + "&languageid=" + languageid;

	requests(url,function(data){
        res.render('getcontentpage', data);
  	});

};

function requests(url, callback) {
  request(url, function(err, resp, body) {
  	body = JSON.parse(body);
	  if (!body) {
	    results = "No results found. Try again.";
	  } else {
	    results = body;
	  };
  	callback(results);
  });
};

