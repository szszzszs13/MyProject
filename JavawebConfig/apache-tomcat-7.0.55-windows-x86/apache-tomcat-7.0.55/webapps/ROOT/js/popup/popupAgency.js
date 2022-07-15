/**
 * 代理商选择pop；
 * 调用方法（popupAgency.openUserPop('input_id','label_id','user_id')）；
 * input_id 是用户选择 输入框的id，用户输入user_id，label_id是label的id，用来显示用户名；
 * user_id 是具体业务员下的
 */
var popupAgency = function() {
	var openDialog = function(input_id,label_id,user_id) {
		var param = {
			width : 700,
			height : 550,
			//选择代理商
			title : popup_agency_title,
			modal : true,
			buttons : [{
				//选择
				text : common_button_select,
				width: '74px',
				click : function() {
					popupAgency.chooseAgency();
				},
				'class' : 'btn btn-primary btn-middle'
			},
			{
				//取消
				text : common_button_cancel,
				click : function() {
					$('#popup_agency_dialog').dialog('close');
				},
				'class': 'btn btn-inverse btn-middle btn-aft-middle'
			}]
		};
		$('#popup_agency_dialog').data('input_id',input_id);
		$('#popup_agency_dialog').data('label_id',label_id);

		var select_id = $('#' + input_id).val();
		$('#popup_agency_dialog').data('select_id',select_id);

		$('#popup_agency_user_id').val(user_id);
		initForm();
		popupAgency.findAgency();
		openPop('popup_agency_dialog',param);
	};
	var chooseAgency = function() {
		var select_row = $('#popup_agency_table').find('tr.row-select');
		if(select_row.length == 0) {
			jAlert(popup_agency_chose,message_warning,function(r){});
		} else {
			var agency_id = select_row[0].id;
			openLoading();
			$.ajax({
				type : 'post',
				url : contextPath + '/adminAgency/getAgencyInfo',
				data : {agency_id:agency_id},
				dataType : 'json',
				success : function(data) {
					closeLoading();
					var id_input = $('#popup_agency_dialog').data('input_id');
					var id_label = $('#popup_agency_dialog').data('label_id');
					$('#' + id_input).val(data.agency_id);
					$('#' + id_label).html(data.agency_nm);
					console.log(id_input + '#' + id_label);
					$('#popup_agency_dialog').dialog('close');
				},
				error : function(err,obj,status) {
					closeLoading();
					jAlert(validator.system.error,message_warning,function(r){
						$('#popup_agency_dialog').dialog('close');
					});
				}
			});
		}
	};
	var findAgency = function() {
		openLoading();
		var form_json = getFormJson();
		$.ajax({
			type : 'post',
			url : contextPath + '/adminAgency/findAgencyAjax',
			data : form_json,
			dataType : 'json',
			success : function(data) {
				$('#popup_agency_table').find('tbody').remove();
				var t_body = $('<tbody></tbody>');

				for(var item in data.agencyList) {
					var select_id = $('#popup_agency_dialog').data('select_id');
					var obj = data.agencyList[item];

					if (select_id == obj.agency_id) {
						var tr = "<tr id='" + obj.agency_id + "' class='row-select'><td>"
						+ (obj.agency_id) + "</td><td>"
						+ obj.agency_nm + "</td></tr>";
						$(tr).appendTo(t_body);
					} else {
						var tr = "<tr id='" + obj.agency_id + "'><td>"
						+ (obj.agency_id) + "</td><td>"
						+ obj.agency_nm + "</td></tr>";
						$(tr).appendTo(t_body);
					}
				}

				$('#popup_agency_user_nm').html(data.agency_user_nm);
				$('#popup_agency_orders').toOrder(function(order_name, order_value){
					$('#popup_agency_order_name').val(order_name);
					$('#popup_agency_order_value').val(order_value);
					findAgency();
				}, form_json.order_name , form_json.order_value );
				t_body.appendTo($('#popup_agency_table'));
				setPagination(data.paginationBean);

				closeLoading();
			},
			error:function(err,obj,status) {
				closeLoading();
				jAlert(validator_system_error,message_warning,function(r){
					$('#popup_agency_dialog').dialog('close');
				})
			}
		})
	};
	var getFormJson = function() {
		return {
			search_keyword : $('#popup_agency_search_keyword').val(),
			current_page : $('#popup_agency_current_page').val(),
			order_name : $('#popup_agency_order_name').val(),
			order_value : $('#popup_agency_order_value').val(),
			agency_user_id : $('#popup_agency_user_id').val()
		}

	};
	var initForm = function() {
		$('#popup_agency_keyword').val('')

		$('#popup_agency_search_keyword').val('');
		$('#popup_agency_current_page').val('1');
		$('#popup_agency_order_name').val('AGENCY_ID');
		$('#popup_agency_order_value').val('DESC');
	};
	var setPagination = function(json_pagBean) {
		drawPagination(json_pagBean,'popup_agency_change_page','popup_agency_pagination');
	};

	return {
		openAgencyPop : openDialog,
		findAgency : findAgency,
		chooseAgency : chooseAgency
	}
}();
var popup_agency_change_page = function(page) {
	$('#popup_agency_current_page').val(page);
	popupAgency.findAgency();
};
var popup_agency_search = function() {
	$('#popup_agency_search_keyword').val($('#popup_agency_keyword').val());
	popupAgency.findAgency();
}
$(function(){
	$('#popup_agency_table').selectRow();
	$(document).on('dblclick','#popup_agency_table td',function(){
		popupAgency.chooseAgency();
	});
	$(document).on('keydown','#popup_agency_keyword',function(e){
		if(e.keyCode == 13) {
			popupAgency.findAgency();
		}
	});

	$(document).on('click','#popup_agency_table td',function(e){
		var select_id = $(this).parent().attr('id');
		$('#popup_agency_dialog').data('select_id',select_id);
	});
})