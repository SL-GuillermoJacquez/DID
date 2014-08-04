%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)

	%if size == "small":
		%include("templates/small", item=item, index=index)
	%elif size == "medium":
		%include("templates/medium", item=item)
	%else:
		%if item["TypeID"] == 3:
		  %include("templates/specialevent", item=item)
		%else:
		  %include("templates/large", item=item)
	%end