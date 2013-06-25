$(document).ready(function() {
	$('.route').on('mouseenter', function() {
		$(this).find('.direction').show();
	}).on('mouseleave', function() {
		$(this).find('.direction').hide();
	});

	$('.direction').on('mouseenter', function() {
		$(this).find('.stop').show(); 
	}).on('mouseleave', function() {
		$(this).find('.stop').hide();
	});

	$('.stop').on('mouseenter', function() {
		var route = $(this).closest('.route');
		var direction = $(this).closest('.direction');
/*		<jsp:forward page = "http://www.nextbus.com/predictor/stopSelector.jsp?a=sf-muni">
			<jsp:param name = "routeSelector" value = route />
			<jsp:param name = "directionSelector" value = direction />
			<jsp:param name = "stopSelector" value = this />
		</jsp:forward>
*/	});
});