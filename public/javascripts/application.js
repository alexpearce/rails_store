$.fn.animateHighlight = function(highlightColor, duration) {
    var highlightBg = highlightColor || "#DDDDFF";
    var animateMs = duration || 1500;
		originalBg = this.parent().css("backgroundColor");
    this.stop().css("background-color", highlightBg).animate({backgroundColor: originalBg}, animateMs);
};

$(function () {
	
	$('.media a.img').fancybox();

	var $quantity_forms = $('.quantity_form');
	
	var $flash_notice = $('#notice, #alert');
	
	if ($flash_notice.length !== 0) $flash_notice.animate({opacity : 1}, 5000).slideUp('fast');
	
	if ($quantity_forms.length !== 0) {
		$.each($quantity_forms, function(idx, val) {
			var $form = $(val).find('form');
	
			$form.bind('ajax:success', function(event, data, status, xhr) {
				quantity_update_success($(this).find('select'), JSON.parse(data));
			}).find('select').change(function(){
				var new_quantity = $(this).val();
				if (new_quantity === '0') {
					$form.attr('method', 'delete');
				}
				$form.trigger('submit');
			});			
		});
	}
		
});

function quantity_update_success(select, json_data) {
	// JSON object: "item_subtotal", "subtotal", "postage", "total"
	var table_row = select.parents('tr');
	
	if (json_data["action"] === "delete")	table_row.remove();
	else table_row.find('.item_subtotal').html(json_data["item_subtotal"]).animateHighlight();
	
	$('#basket_subtotal').html(json_data["subtotal"]).animateHighlight();
	$('#basket_postage').html(json_data["postage"]).animateHighlight();
	$('#basket_total').html(json_data["total"]).animateHighlight();
}