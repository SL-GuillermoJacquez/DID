%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)


<div class="dynamicPageContainer">
	<div id="dynamicPageMaincontent" class="dynamicPageMaincontent">
		<div class="dynamicPageItems dynamicPageItems_sixItem">
		 		
			%for x in range(1, 7):				
				%include("templates/item", item=items[x-1], size="medium", index=x)				
			%end
			
			<div class="clear"></div>	
			<div class="ad_header ad_header2"></div>			
		</div>
		<div class="clear"></div>
		<div class="sl_dynamic_footer PrimaryFooter action-footer-text"></div>
	</div>
</div>