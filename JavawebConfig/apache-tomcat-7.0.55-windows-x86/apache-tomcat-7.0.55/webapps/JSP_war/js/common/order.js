//排序插件
(function($) {
	var OrderPicker = function() {
		var changeOrder = function(columnName, orderObj, id){
			return function () {
				if(orderObj.orderId) {
					$('#' + orderObj.orderId).find('span').attr("class", '');
				}
				if(columnName == orderObj.orderName){
					orderObj.orderValue = getOrderValue(orderObj.orderValue);
				} else {
					orderObj.orderName = columnName;
					orderObj.orderValue = "ASC";
				}
				orderObj.toOrder(columnName, orderObj.orderValue);
				orderObj.orderId = id;
				$('#' + id).find('span').attr("class", (orderObj.orderValue == "DESC" ? "caret" : "caret up"));
			}
		};
		var getOrderValue = function(initValue) {
			if(initValue == "ASC"){
				return "DESC";
			}
			return "ASC";
		};
		return {
			init : function(fun, orderName, orderValue) {
				var orderObj = {};
				orderObj.orderName = orderName;
				orderObj.orderValue = orderValue;
				orderObj.id = this[0].id;
				orderObj.toOrder = fun;
				$("#" + orderObj.id).children().each(function(index, dom) {
					var column_id = dom.id;
					if(dom.id && column_id.length > orderObj.id.length) {
						var header = column_id.substr(0, orderObj.id.length + 1);
						if(header == orderObj.id + "_") {
							var columnName = column_id.substr(orderObj.id.length + 1);
							var $dom = $(dom);
							var invalue = $dom.text();
							$dom.text('');
							var $a = $('<a href="javascript:void(0)" style="color:#0060A4">' + invalue + '</a>');
							$a.appendTo($dom);
							if(orderName == columnName) {
								orderObj.orderId = dom.id;
								var $span = $("<span></span>");
								$span.appendTo($a);
								$span.attr("class", (orderValue == "DESC" ? "caret" : "caret up"));
							} else {
								var $span = $("<span></span>");
								$span.appendTo($a);
							}
							$a.bind("click", changeOrder(columnName, orderObj, dom.id));
						}
					}
				});
			}
		}
	}();
	$.fn.extend({
		toOrder: OrderPicker.init
	});
})(jQuery);