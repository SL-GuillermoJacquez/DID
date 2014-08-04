%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)


<div class="dynamicPageContainer">
	<div id="dynamicPageMaincontent" class="dynamicPageMaincontent">
		<div class="dynamicPageItems dynamicPageItems_nineItem">
		  
		  %if items[0] != None:
			%if items[0]["TypeID"] == 3:
			  <div class="dp_itemLarge nineItem_1" data-listingid="{{items[0]["ID"]}}">
				%include("templates/item", item=items[0], size="large")
			  </div>   			  
			%else:
			  <div class="dp_itemLarge.nineItem_1 listing" data-listingid="{{items[0]["ID"]}}">
				%include("templates/item", item=items[0], size="large")
			  </div>    
			%end
				
			%for x in range(2, 10):				
				%include("templates/item", item=items[x-1], size="small", index=x)				
			%end
			
			<div class="clear"></div>	
			<div class="ad_header ad_header1"></div>			
		</div>
		<div class="clear"></div>
		<div class="sl_dynamic_footer PrimaryFooter action-footer-text"></div>
	</div>
</div>