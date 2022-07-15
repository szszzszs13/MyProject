//选中行效果
(function($) {
	var SelectRow = function() {
		return {
			init : function() {
				var id = this[0].id;
				$(document).on('click','#' + id + ' td',function(e){
					$('#' + id).find('.row-select').removeClass('row-select');
					$(this).parent().addClass('row-select');
				});
			}
		}
	}();
	$.fn.extend({
		selectRow: SelectRow.init
	});
})(jQuery);