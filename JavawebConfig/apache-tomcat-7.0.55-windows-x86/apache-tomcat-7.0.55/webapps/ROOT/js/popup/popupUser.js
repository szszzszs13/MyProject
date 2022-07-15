/**
 * 用户选择pop；
 * 调用方法（popupUser.openUserPop('input_id','label_id')）；
 * input_id 是用户选择 输入框的id，用户输入user_id，label_id是label的id，用来显示用户名；
 */
var popupUser = function() {
	var selectUser = {};
	var openDialog = function(input_id,label_id) {
		var param = {
			width : 620,
			height : 550,
			//选择负责人
			title : popup_user_title,
			modal : true,
			buttons : [{
				//选择
				text : common_button_select,
				width: '74px',
				click : function() {
					popupUser.chooseUser();
				},
				'class' : 'btn btn-primary btn-middle'
			},
			{
				//取消
				text : common_button_cancel,
				click : function() {
					$('#popup_user_dialog').dialog('close');
				},
				'class': 'btn btn-inverse btn-middle btn-aft-middle'
			}]
		};
		$('#popup_user_dialog').data('input_id',input_id);
		var select_id = $('#' + input_id).val();
		$('#popup_user_dialog').data('select_id',select_id);
		$('#popup_user_dialog').data('label_id',label_id);
		initForm();
		findUsers();
		openPop('popup_user_dialog',param);
	};
	var chooseUser = function() {
		var select_row = $('#popup_user_table').find('tr.row-select');
		if(select_row.length == 0) {
			jAlert(popup_user_chose,message_warning,function(r){});
		} else {
			var user_id = select_row[0].id;
			openLoading();
			$.ajax({
				type : 'post',
				url : contextPath + '/adminUser/getUserDetail',
				data : {user_id:user_id},
				dataType : 'json',
				success : function(data) {
					closeLoading();
					var id_input = $('#popup_user_dialog').data('input_id');
					var id_label = $('#popup_user_dialog').data('label_id');
					$('#' + id_input).val(data.user_id);
					$('#' + id_label).html(data.user_nm);
					console.log(id_input + '#' + id_label);
					$('#popup_user_dialog').dialog('close');
				},
				error : function(err,obj,status) {
					closeLoading();
					jAlert(validator.system.error,message_warning,function(r){
						$('#popup_user_dialog').dialog('close');
					});
				}
			});
		}
	};
	var findUsers = function() {
		openLoading();
		var form_json = getFormJson();
		form_json.is_valid = 'T';
		$.ajax({
			type : 'post',
			url : contextPath + '/adminUser/findUserAjax',
			data : form_json,
			dataType : 'json',
			success : function(data) {
				$('#popup_user_table').find('tbody').remove();
				var t_body = $('<tbody></tbody>');
				for(var item in data.userList) {
					var select_id = $('#popup_user_dialog').data('select_id');
					var obj = data.userList[item];
					if (select_id == obj.user_id) {
						var tr = "<tr id='" + obj.user_id + "' class='row-select'><td>"
						+ (obj.user_id) + "</td><td>"
						+ obj.user_nm + "</td><td>"
						+ (obj.user_phone?obj.user_phone:'') + "</td></tr>";
						$(tr).appendTo(t_body);
					} else {
						var tr = "<tr id='" + obj.user_id + "'><td>"
						+ (obj.user_id) + "</td><td>"
						+ obj.user_nm + "</td><td>"
						+ (obj.user_phone?obj.user_phone:'') + "</td></tr>";
						$(tr).appendTo(t_body);
					}
				}

				$('#pop_orders').toOrder(function(order_name, order_value){
					$('#popup_order_name').val(order_name);
					$('#popup_order_value').val(order_value);
					findUsers();
				}, form_json.order_name , form_json.order_value );
				t_body.appendTo($('#popup_user_table'));
				setPagination(data.paginationBean);

				closeLoading();
			},
			error:function(err,obj,status) {
				closeLoading();
				jAlert(validator_system_error,message_warning,function(r){
					$('#popup_user_dialog').dialog('close');
				})
			}
		})
	};
	var getFormJson = function() {
		return {
			search_keyword : $('#popup_search_keyword').val(),
			current_page : $('#popup_current_page').val(),
			order_name : $('#popup_order_name').val(),
			order_value : $('#popup_order_value').val(),
			user_owner_flg : 'S'
		}

	};
	var initForm = function() {
		$('#popup_user_keyword').val('')

		$('#popup_search_keyword').val('');
		$('#popup_current_page').val('1');
		$('#popup_order_name').val('USER_ID');
		$('#popup_order_value').val('DESC');
	};
	var setPagination = function(json_pagBean) {
		drawPagination(json_pagBean,'popup_user_change_page','popup_user_pagination');
	};
	var order = function() {
		$('#pop_orders').toOrder(function(order_name, order_value){
			$('#popup_order_name').val(order_name);
			$('#popup_order_value').val(order_value);
			toOrder();
		}, '${adminUserForm.order_name }', '${adminUserForm.order_value }');
	};

	return {
		openUserPop : openDialog,
		findUsers : findUsers,
		chooseUser : chooseUser
	}
}();
var popup_user_change_page = function(page) {
	$('#popup_current_page').val(page);
	popupUser.findUsers();
};
var popup_user_search = function() {
	$('#popup_search_keyword').val($('#popup_user_keyword').val());
	popupUser.findUsers();
}
$(function(){
	$('#popup_user_table').selectRow();
	$(document).on('dblclick','#popup_user_table td',function(){
		popupUser.chooseUser();
	});
	$(document).on('keydown','#popup_user_keyword',function(e){
		if(e.keyCode == 13) {
			popup_user_search();
		}
	});
	$(document).on('click','#popup_user_table td',function(e){
		var select_id = $(this).parent().attr('id');
		$('#popup_user_dialog').data('select_id',select_id);
	});
})