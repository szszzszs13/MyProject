$(function(){
	//新增客户
	$('#tonewuser').click(function(e){
		openCustomerPop({
			flag : 1
		});
	});
	//双击用户所在行编辑客户
	$(document).on('dblclick','#customer_table td',function(e){
		openCustomerPop({
			flag : 2,
			target : $(this)
		});
	});
	//点击客户编辑按钮
	$(document).on('click','.edit-dialog',function(e){
		openCustomerPop({
			flag : 2,
			target : $(this).parent()
		});
	});
});

/**
 * 清除客户输入框
 */
function clearCustomerInput() {
	$('#customer_id').val('');
	$('#customer_nm').val('');
	$('#start_date').val('');
	$('#end_date').val('');
	$('#customer_address').val('');
	$('#customer_p').val('');
	$('input[name="customer_type"]').each(function(index){
		if(index == 0) {
			this.checked = true;
		}
	});
	$('input[name="is_valid"]').each(function(index){
		if(index == 0) {
			this.checked = true;
		}
	});
}

/**
 * 获取用户数据
 * @return customer_json{}
 */
function getCustomerJson() {
	var customer_id = $('#customer_id').val();
	var customer_nm = $('#customer_nm').val();
	var address = $('#customer_address').val();
	var contact_number = $('#customer_p').val();
	var customer_type = $('input[name="customer_type"]:checked').val();
	var is_valid = $('input[name="is_valid"]:checked').val();
	var start_date = $('#start_date').val();
	var end_date = $('#end_date').val();

	var customer_json = {
		customer_id : customer_id,
		customer_nm : customer_nm,
		start_date : start_date,
		end_date : end_date,
		address : address,
		contact_number : contact_number,
		customer_type : customer_type,
		is_valid : is_valid,
		update_program : '710'
	};

	return customer_json;
}

/**
 * 填入客户数据
 * @param {} data
 */
function fillCustomerInput(data) {
	$('#customer_id').val(data.customer_id);
	$('#customer_nm').val(data.customer_nm);
	$('#start_date').val(data.start_date);
	$('#customer_address').val(data.address);
	$('#customer_p').val(data.contact_number);
	$('input[name="customer_type"]').each(function(index){
		if(this.value == data.customer_type) {
			this.checked = true;
		}
	});
	$('input[name="is_valid"]').each(function(index){
		if(this.value == data.is_valid) {
			this.checked = true;
		}
	});
}

/**
 * 验证客户数据
 * @param {} fun
 */
function validCustomer(fun) {
	var customer_json = getCustomerJson();
	openLoading();
	$.ajax({
		type : 'post',
		url : contextPath + '/adminCustomer/validCustomer',
		data : customer_json,
		dataType : 'json',
		success : function(data) {
			closeLoading();
			if(data.result == 'success') {
				if(data.isEndStart == 'true'){
					openDatePop(fun,customer_json);
				}else{
					fun(customer_json);
				}
			} else {
				closeLoading();
				var errorMsg = '';
				var errorList = data.errorList;
				for (msg in errorList ){
					errorMsg += errorList[msg]+"\n";
				}
				jWrong(errorMsg, message_error,function(r){});

			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
}

/**
 * 打开有效开始日期和有效结束日期的pop
 * @param {} fun,customer_json
 */
function openDatePop(fun,customer_json){
	var param = {
		width : 350,
		height : 200,
		modal : true
	};
	param.title = common_set;
	var buttons = [{
		text : common_button_confirmation,
		click : function() {
			var customer_id = $('#customer_id').val();
			var customer_nm = $('#customer_nm').val();
			var start_date = $("#start_date").val();
			var end_date = $("#end_date").val();
			$.ajax({
				type : 'post',
				url : contextPath + '/adminCustomer/validateDate',
				data : {
					customer_id : customer_id,
					customer_nm : customer_nm,
					start_date : start_date,
					end_date : end_date
				},
				dataType : 'json',
				success : function(data) {
					//closeLoading();
					if(data.result == 'success') {
						customer_json.start_date=start_date;
						customer_json.end_date=end_date;
						fun(customer_json);
						//document.adminCustomerForm.submit();
					} else {
						closeLoading();
						var errorMsg = '';
						var errorList = data.errorList;
						for (msg in errorList ){
							errorMsg += errorList[msg]+"\n";
						}
						jWrong(errorMsg, message_error,function(r){});
					}
				},
				error : function(obj,err,status) {
					closeLoading();
				}
			});
		},
		'class' : 'btn btn-primary btn-middle'
	},
	{
		text : common_button_cancel,
		click : function() {
			$("#end_date").val('');
			$(this).dialog('close');
		},
		'class': 'btn btn-inverse btn-middle btn-aft-middle'
	}];
	param.buttons = buttons;
	openPop('valiateDate_dialog',param);
}

/**
 * 打开客户编辑或增加pop
 * @param {} is
 */
function openCustomerPop(is) {
	clearCustomerInput();
	var param = {
			width : 600,
			height : 380,
			modal : true
		};
		//客户增加
		if(is.flag == 1) {
//			$("#end_date").attr("disabled","false");
//			$("#end_date").css('background-color','#EEEEEE');
			param.title = customer_add;
			var buttons = [{
				text : common_button_save,
				click : function() {
					validCustomer(insertCustomer);
				},
				'class' : 'btn btn-primary btn-middle'
			},
			{
				text : common_button_cancel,
				click : function() {
					$(this).dialog('close');
				},
				'class': 'btn btn-inverse btn-middle btn-aft-middle'
			}];
			param.buttons = buttons;
			openPop('customer_dialog',param);
		}
		//客户编辑
		else {
			var customer_id = $(is.target).parent().attr('id');
			openLoading();
			$.ajax({
				type : 'post',
				url : contextPath + '/adminCustomer/getCustomerDetail',
				data : {customer_id:customer_id},
				dataType : 'json',
				success : function(data) {
					closeLoading();
					fillCustomerInput(data);
					param.title = customer_edit;
					var buttons = [{
						text : common_button_save,
						click : function() {
							validCustomer(updateCustomer);
						},
						'class' : 'btn btn-primary btn-middle'
					},
					{
						text : common_button_cancel,
						click : function() {
							$(this).dialog('close');
						},
						'class': 'btn btn-inverse btn-middle btn-aft-middle'
					}];
					param.buttons = buttons;
					openPop('customer_dialog',param);
				}
			})

		}
}

/**
 * 插入用户
 * @param {} customer_json
 */
function insertCustomer(customer_json) {
	$.ajax({
		type : 'post',
		url : contextPath + '/adminCustomer/insertCustomer',
		data : customer_json,
		dataType : 'json',
		success : function(data) {
			//closeLoading();
			if(data.result == 'success') {
				document.adminCustomerForm.submit();
			} else {
				closeLoading();
				alert('error');
			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
	$('#customer_dialog').dialog('close');
}

/**
 * 更新客户
 * @param {} customer_json
 */
function updateCustomer(customer_json) {
	$.ajax({
		type : 'post',
		url : contextPath + '/adminCustomer/updateCustomer',
		data : customer_json,
		dataType : 'json',
		success : function(data) {
			//closeLoading();
			if(data.result == 'success') {
				document.adminCustomerForm.submit();
			} else {
				closeLoading();
				//$('#customer_dialog').dialog('close');
				jWrong(data.error_msg,message_error,null);
			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
}

/**
 * 删除客户
 * @param {} el
 **/
function deleteCustomer(el){
	jConfirm(delete_confirm,confirm_box_title,function(r){
		if(!r) {
			return;
		}
		var customer_id = $(el).parent().parent().attr('id');
		openLoading();
		$.ajax({
			type : 'post',
			url : contextPath + '/adminCustomer/deleteCustomer',
			data : {customer_id : customer_id},
			dataType : 'json',
			success : function(data) {
				closeLoading();
				if(data.result == 'success') {
					document.adminCustomerForm.submit();
				} else {
					closeLoading();
					jWrong(data.errorMsg,message_error,function(r){});
				}
			},
			error : function(obj,err,status) {
				closeLoading();
			}
		})
	})
}

/**
 * 分页用
 * @param {} page, rows
 * */
function change_page(page, rows) {
	$('#current_page').val(page);
	$('#dispay_rows').val(rows);
	openLoading('');
	document.adminCustomerForm.submit();
}

/**
 * 分页用
 * @param {} page, rows
 * */
function change_rows(page, rows) {
	document.getElementById('current_page').value = 1;
	document.getElementById('dispay_rows').value = rows;
	openLoading('');
	document.adminCustomerForm.submit();
}

/**
 * 搜索用户
 * @param {}
 * */
function searchUser() {
	var keyword = $('#keyword').val();
	$('#search_keyword').val(keyword);
	openLoading('');
	document.adminCustomerForm.submit();
}

/**
 * form提交排序
 * @param {}
 * */
function toOrder() {
	openLoading('');
	document.adminCustomerForm.submit();
}
