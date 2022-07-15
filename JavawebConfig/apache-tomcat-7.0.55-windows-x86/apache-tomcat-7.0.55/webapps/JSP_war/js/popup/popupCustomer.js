/**
 * 客户选择pop；
 * 调用方法（popupCustomer.openCustomerPop('input_id','customer_type_id')）；
 * input_id 是input 会把客户名称输出在这里面
 * customer_type_id 是客户类别的select，可以为空
 *
 * 获取所选客户id 方法
 * popupCustomer.getCutomerId();
 *
 */

var popupCustomer = function() {
	var openDialog = function(input_id,customer_type_id) {
		var param = {
			width : 700,
			height : 550,
			//选择客户
			title : popup_customer_title,
			modal : true,
			buttons : [{
				//选择
				text : common_button_select,
				width: '74px',
				click : function() {
					popupCustomer.chooseCustomer();
				},
				'class' : 'btn btn-primary btn-middle'
			},
			{
				//取消
				text : common_button_cancel,
				click : function() {
					$('#popup_customer_dialog').dialog('close');
				},
				'class': 'btn btn-inverse btn-middle btn-aft-middle'
			}]
		};
		$('#popup_customer_dialog').data('input_id',input_id);
		$('#popup_customer_dialog').data('customer_type',customer_type_id);
		initForm();
		popupCustomer.findCustomer();
		openPop('popup_customer_dialog',param);
	};
	var chooseCustomer = function() {
		var select_row = $('#popup_customer_table').find('tr.row-select');
		if(select_row.length == 0) {
			jAlert(popup_customer_chose,message_warning,function(r){});
		} else {
			var customer_id = select_row[0].id;
			openLoading();
			$.ajax({
				type : 'post',
				url : contextPath + '/adminCustomer/getCustomerDetail',
				data : {customer_id:customer_id},
				dataType : 'json',
				success : function(data) {
					closeLoading();
					var id_input = $('#popup_customer_dialog').data('input_id');

					$('#' + id_input).val(data.customer_nm);
					$('#' + id_input).data('customer_id',data.customer_id);
					$('#popup_customer_dialog').dialog('close');
				},
				error : function(err,obj,status) {
					closeLoading();
					jAlert(validator_system_error,message_warning,function(r){
						$('#popup_customer_dialog').dialog('close');
					});
				}
			});
		}
	};
	var findCustomer = function() {
		openLoading();
		var form_json = getFormJson();
		form_json.is_valid = 'T';
		$.ajax({
			type : 'post',
			url : contextPath + '/adminCustomer/findCustomerAjax',
			data : form_json,
			dataType : 'json',
			success : function(data) {
				$('#popup_customer_table').find('tbody').remove();
				var t_body = $('<tbody></tbody>');
				for(var item in data.customerList) {
					var obj = data.customerList[item];
					var tr = "<tr id='" + obj.customer_id + "'><td>"
						+ obj.customer_id + "</td><td>"
						+ obj.customer_nm + "</td><td>"
						+ obj.contact_number + "</td></tr>";
					$(tr).appendTo(t_body);
				}
				var name
				if(data.customer_type == "" || data.customer_type == null) {
					name = CUSTOMER_TYPE[5];
				} else {
					name = CUSTOMER_TYPE[data.customer_type];
				}
				$('#popup_customer_type_nm').html(name);

				$('#popup_customer_orders').toOrder(function(order_name, order_value){
					$('#popup_customer_order_name').val(order_name);
					$('#popup_customer_order_value').val(order_value);
					popupCustomer.findCustomer();
				}, form_json.order_name , form_json.order_value );
				t_body.appendTo($('#popup_customer_table'));
				setPagination(data.paginationBean);

				closeLoading();
			},
			error:function(err,obj,status) {
				closeLoading();
				jAlert(validator_system_error,message_warning,function(r){
					$('#popup_customer_dialog').dialog('close');
				})
			}
		})
	};
	var getFormJson = function() {
		return {
			search_keyword : $('#popup_customer_search_keyword').val(),
			current_page : $('#popup_customer_current_page').val(),
			order_name : $('#popup_customer_order_name').val(),
			order_value : $('#popup_customer_order_value').val(),
			customer_type : $('#' + $('#popup_customer_dialog').data('customer_type')).val()
		}

	};
	var initForm = function() {
		$('#popup_customer_keyword').val('')

		$('#popup_customer_search_keyword').val('');
		$('#popup_customer_current_page').val('1');
		$('#popup_customer_order_name').val('CUSTOMER_ID');
		$('#popup_customer_order_value').val('DESC');
	};
	var setPagination = function(json_pagBean) {
		drawPagination(json_pagBean,'popup_customer_change_page','popup_customer_pagination');
	};
	var getCustomerChoosed = function() {
		var customer_id = $('#' + $('#popup_customer_dialog').data('input_id')).data('customer_id');
		return customer_id;
	}

	return {
		openCustomerPop : openDialog,
		findCustomer : findCustomer,
		chooseCustomer : chooseCustomer,
		getCutomerId : getCustomerChoosed
	}
}();
var popup_customer_change_page = function(page) {
	$('#popup_customer_current_page').val(page);
	popupCustomer.findCustomer();
};
var popup_customer_search = function() {
	$('#popup_customer_search_keyword').val($('#popup_customer_keyword').val());
	popupCustomer.findCustomer();
}
$(function(){
	$('#popup_customer_table').selectRow();
	$(document).on('dblclick','#popup_customer_table td',function(){
		popupCustomer.chooseCustomer();
	});
	$(document).on('keydown','#popup_customer_keyword',function(e){
		if(e.keyCode == 13) {
			$('#popup_customer_search_keyword').val($('#popup_customer_keyword').val());
			popupCustomer.findCustomer();
		}
	});

})