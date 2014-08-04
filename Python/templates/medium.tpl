%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)

<div data-listingid="-2041937690" class="dp_itemMedium nineItem_{{index}} listing">
  <div class="dp_itemImage dp_itemMediumImage">
	 <a href=""><img src="{{web_root}}/listingimages{{item["Image"]}}" class="FormatImage"/></a>
	 <div class="dp_ratingsReviews excludeFromMobile FormatRatings"></div>
	 <div class="clear"></div>
  </div>
  <div class="dp_price DealDescription FormatDeal FormatDealMediumSmall">{{item["DealDescription"]}}</div>
  <div class="dp_itemInfo">
	 <div class="dp_brandname">from Glacier Bay</div>	
	 <h3 class="dp_title"><span class="ellipsis_text Title">{{item["Title"]}}</span></h3>
	 <div class="clear"></div>
  </div>
  <div class="clear"></div>
</div>