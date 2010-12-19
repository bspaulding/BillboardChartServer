$(document).ready(function() {
	// JQuery Animations - Painfully slow.
	// $('.chart_table_item_details').hide();
	// $('.chart_table_item>.item_short_description').click(function() {
	// 	details_id = $(this).parent().attr("id") + "_details";
	// 	display_status = $('#' + details_id).css('display');
	// 	$('.chart_table_item_details').slideUp();
	// 	if( display_status == "none" )
	// 		$('#' + details_id).slideDown();
	// 	else
	// 		$('#' + details_id).slideUp();
	// });
	
	// CSS3 Animations - Better?
	$('.chart_table_item_details').addClass('inactive');
	$('.chart_table_item>.item_short_description').click(function() {
		details_id = $(this).parent().attr("id") + "_details";
		display_status = $('#' + details_id).css('top');

		$('.chart_table_item_details').addClass('inactive');

		if( display_status == "-50px" )
			$('#' + details_id).removeClass('inactive');
		else
			$('#' + details_id).addClass('inactive');
	});
});