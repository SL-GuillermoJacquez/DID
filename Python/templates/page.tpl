%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)
<!DOCTYPE html>
<html>
<head>
	<style>


bodysss{
	zoom: 0.5
	/*-webkit-transform: scale(0.5); */
}

	/*  DYNAMIC PAGE STYLES  */
.dynamicPageContainer {
	width: 921px;
	height: 1081px;
	padding: 0;
	background: #fff;
    font-size: 12px;
	font-family: Arial;
}
.dynamicPageItems {
	height: 1013px;
	background-position: bottom left;
	background-repeat: no-repeat;
}
.dynamicPageItems.dynamicPageItems_nineItem {
	background-image: url("{{web_root}}/listingimages/staticimages/homedepot/sbotd_background.jpg");
}
.dynamicPageItems.dynamicPageItems_sixItem {
	background-image: url("{{web_root}}/listingimages/staticimages/homedepot/plywood_921x718.png");
	background-size: 145%;
}
.dynamicPageContainer ul {
	background-color: #ffffff;
}

.dp_itemLarge {
	overflow: hidden;
	position: relative;
	width: 100%;
	height: 387px;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
	background: #fff;
}
.gradientOverlay {
	width: 100%;
	height: 387px;
	position: absolute;
	top: 0;
	left: 0;
	background: #fff;
	background: #ffffff; /* Old browsers */
	background: -moz-linear-gradient(-45deg,  #ffffff 44%, #dddddd 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, right bottom, color-stop(44%,#ffffff), color-stop(100%,#dddddd)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(-45deg,  #ffffff 44%,#dddddd 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(-45deg,  #ffffff 44%,#dddddd 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(-45deg,  #ffffff 44%,#dddddd 100%); /* IE10+ */
	background: linear-gradient(135deg,  #ffffff 44%,#dddddd 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#dddddd',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
	-webkit-box-shadow:inset 1px -7px 15px 0 rgba(0,0,0,.25);
	box-shadow:inset 1px -7px 15px 0 rgba(0,0,0,.25);
	opacity: .2;
}
.dp_itemMedium {
	float: left;
	overflow: hidden;
	position: relative;
	width: 31.16%;
	margin: 60px 15px 0;
	background: #fff url("{{web_root}}/listingimages/staticimages/homedepot/20140102_OBV_interior.jpg") 0 0 no-repeat;
	background-size: 100% 100%;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.dp_itemMedium + .dp_itemMedium {
	margin-left: 0;
}
.dp_itemMedium:nth-child(3n+3) + .dp_itemMedium:nth-child(3n+4) {
	margin-left: 15px;
}
.dp_itemMedium:nth-child(n+4) {
	margin-bottom: 30px;
	margin-top: 35px;
}
.dp_itemMedium:nth-child(2n+2) {
	height: 356px;
	margin-top: 85px;
}

.dp_itemSmall {
	float: left;
	overflow: hidden;
	position: relative;
	width: 22.28%;
	margin: 60px 20px 0;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.dp_itemSmall + .dp_itemSmall {
	margin-left: 0;
}
.dp_itemSmall:nth-child(4n+5) + .dp_itemSmall:nth-child(4n+6) {
	margin-left: 20px;
}
.dp_itemSmall:nth-child(n+6) {
	margin-bottom: 40px;
	margin-top: 20px;
}

.dp_itemImage {
	height: 100%;
	position: relative;
	background: #fff;
}
.dp_itemLargeImage {
	float: left;
	width: 300px;
	margin: 35px 15px 35px 35px;
}
.dp_itemMediumImage {
	background: none;
	height: auto;
}
.dp_itemMedium:nth-child(2n+2) .dp_itemMediumImage {
	position: absolute;
	top: 128px;
}
.dp_itemMedium:nth-child(2) .dp_itemMediumImage {
	left: 15%;
}
.dp_itemMedium:nth-child(6) .dp_itemMediumImage {
	right: 8px;
}
.dp_itemMediumImage a {
	margin: 0 auto;
	width: 90%;
	display: block;
	padding: 30px 0 10px;
}
.dp_itemMedium:nth-child(2n+2) .dp_itemMediumImage a {
	width: auto;
	margin: 0 15px;
}
.dp_itemSmallImage a {
	display: block;
	padding: 10px 0;
	width: 158px;
	margin: 0 auto;
}
.dp_itemImage img {
	width: 100%;
	border: none;
}
.dp_itemMedium:nth-child(2n+2) .dp_itemMediumImage img {
	width: 183px;
}
/*  DATA FIELDS  */
.dp_itemInfo {
	padding: 10px 12px 8px 28px;
	background: #fff;
}
.dp_itemLarge .dp_itemInfo {
	position: absolute;
	bottom: 40px;
	left: 350px;
	padding-right: 35px;
}
.dp_itemSmall .dp_itemInfo {
	text-align: right;
}
.dp_itemMedium:nth-child(2n+2) .dp_itemInfo {
	position: absolute;
	top: 0;
	height: 81px;
}
.dp_itemMedium .dp_itemInfo {
	padding-top: 30px;
	padding-left: 12px;
	background: none;
}


.dp_price {
	color: #fff;
	font-weight: bold;
	margin-bottom: 3px;
	display: inline;
	position: absolute;
	top: 55%;
	background: rgba(234, 130, 34, .75);
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
	padding: 6px 6px 3px 20px;
	text-align: right;
}
.dp_itemLarge .dp_price {
	font-size: 100px;
	line-height: .8;
	position: relative;
	display: inline-block;
	margin-left: -43px;
	padding-left: 43px;
}
.dp_itemMedium .dp_price,
.dp_itemSmall .dp_price {
	font-size: 30px;
	line-height: .9;
}
.dp_itemMedium:nth-child(2n+2) .dp_price {
	top: 80%;
}
.dynamicPageContainer sup {
	font-size: 0.6em;
	vertical-align:top;
}
.dp_pricequalifier {
	color: #000;
	text-transform: uppercase;
	display: inline;
}
.dp_itemMedium .dp_pricequalifier {
	font-size: 11px;
}
.dp_addldealinfo {
	color: #F96302;
	font-weight: bold;
	font-size: 10px;
	margin-bottom: 3px;
	line-height: .9;
	text-transform: uppercase;
}
.dp_addldealinfo sup {
	font-size: 0.7em;
	line-height: 1;
}
.dp_brandname {
	font-size: 14px;
	color: #666;
}

.dp_title {
	font-weight: bold;
	line-height: 1;
	color: #000;
	text-transform: uppercase;
	margin: 0;
	overflow: hidden;
}
.dp_itemLarge .dp_title {
	font-size: 24px;
	margin-top: 10px;
}
.dp_itemMedium .dp_title {
	font-size: 15px;
	height: 61px;
	line-height: 1.1;
	margin: 3px 0 10px;
}
.dp_itemSmall .dp_title {
	font-size: 12px;
	height: 37px;
}
.dp_validdates {
	font-size: 10px;
	color: #333;
    margin: 3px 0;
	line-height: .9;
}
.dp_itemLarge .dp_validdates {
	font-size: 14px;
}
/*
.dp_ratingsReviews {
	background: url(static/ratings.png) top right no-repeat;
	width: 97%;
	height: 19px;
	margin-bottom: 8px;
}
.dp_itemMedium .dp_ratingsReviews {
	background: url(static/ratings.png) top center no-repeat;
}*/
.dp_description {
	font-size: 16px;
	height: 76px;
	margin: 16px 0;
}
/*  END DATA FIELDS  */

.clear {
	clear: both;
	height: 0;
}
/*  END DYNAMIC PAGE STYLES  */


/*  HEADER  */
.ad_header {
	height: 68px;
	margin: 0 0 3px;
	background-position: 0 0;
	background-repeat: no-repeat;
	background-size: 100%;
}
.ad_header1 {
	background-image: url('{{web_root}}/static/banner.jpg'); /* may not be needed */
}

.ad_header2 {
	background-image: url('{{web_root}}/static/banner_social.jpg'); /* may not be needed */
}
/*  END HEADER  */


/*  FOOTER  */
.sl_dynamic_footer {
	padding: 5px 0 2px 25px;
	color: #fff;
	font-weight: bold;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 11px;
}

.dp_specialEvent .gradientOverlay {
	display: none;
}
/*  END FOOTER  */

	</style>


</head>
<body>


	%if data["Name"] == "DID template 1":
		%include("templates/template1", items=data["Items"])
	%else:
		%include("templates/template2", items=data["Items"])
	%end	
	

</body>
</html>


