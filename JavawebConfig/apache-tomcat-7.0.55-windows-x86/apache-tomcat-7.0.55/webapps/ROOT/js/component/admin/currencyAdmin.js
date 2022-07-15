/** 分页用*/
function change_page(page, rows) {
	$('#current_page').val(page);
	$('#dispay_rows').val(rows);
	openLoading('');
	document.adminCurrencyForm.submit();
}

function change_rows(page, rows) {
	document.getElementById('current_page').value = 1;
	document.getElementById('dispay_rows').value = rows;
	openLoading('');
	document.adminCurrencyForm.submit();
}

//搜索货币
function searchCurrency() {
	var keyword = $('#keyword').val();
	$('#search_keyword').val(keyword);
	openLoading('');
	document.adminCurrencyForm.submit();
}

//form提交排序
function toOrder() {
	openLoading('');
	document.adminCurrencyForm.submit();
}

//打开货币编辑或增加pop
function openCurrencyPop(is) {
	clearCurrencyInput();
	var param = {
			width : 450,
			height : 250,
			modal : true
		};
		//货币增加
		if(is.flag == 1) {
			param.title = currency_add;
			var buttons = [{
				text : common_button_save,
				click : function() {
					validateInsertCurrency(insertCurrency);
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
			openPop('currency_dialog',param);
		}
		//货币编辑
		else {
			var currency_id = $(is.target).parent().attr('id');
			openLoading();
			$.ajax({
				type : 'post',
				url : contextPath + '/adminCurrency/getCurrencyInfo',
				data : {currency_id:currency_id},
				dataType : 'json',
				success : function(data) {
					closeLoading();
					fillCurrencyInput(data);
					param.title = currency_edit;
					var buttons = [{
						text : common_button_save,
						click : function() {
							validateUpdateCurrency(updateCurrency);
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
					openPop('currency_dialog',param);
				}
			})

		}
}

/**
 * 货币
 * @param {} currency_json
 */
function insertCurrency(currency_json) {
	$.ajax({
		type : 'post',
		url : contextPath + '/adminCurrency/insertCurrency',
		data : currency_json,
		dataType : 'json',
		success : function(data) {
			//closeLoading();
			if(data.result == 'success') {
				document.adminCurrencyForm.submit();
			} else {
				closeLoading();
				jWrong(validator_system_error, error, function(r){});
			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
	$('#currency_dialog').dialog('close');
}

/**
 * 更新货币
 * @param {} item
 */
function updateCurrency(currency_json) {
	$.ajax({
		type : 'post',
		url : contextPath + '/adminCurrency/updateCurrency',
		data : currency_json,
		dataType : 'json',
		success : function(data) {
			//closeLoading();
			if(data.result == 'success') {
				document.adminCurrencyForm.submit();
			} else {
				closeLoading();
				$('#currency_dialog').dialog('close');
				jWrong(validator_system_error, error,null);
			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
}

/**
 * 删除货币
 * @param {} item
 */
function deleteCurrency(item) {
	jConfirm(delete_confirm, confirm_box_title, function(r){
		if (r == false){
			return false;
		}
		var currency_id = $(item).parent().parent().attr('id');
		openLoading();
		$.ajax({
			type : 'post',
			url : contextPath + '/adminCurrency/deleteCurrency',
			data : {currency_id : currency_id},
			dataType : 'json',
			success : function(data) {
				closeLoading();
				if(data.result == 'deleteSuccess') {
					document.adminCurrencyForm.submit();
				} else if (data.result == 'deleteError') {
					closeLoading();
					jWrong(validator_system_error, error, function(r){});
				} else if (data.result == 'deleteCannot') {
					closeLoading();
					jWrong(data.errorMsg, error, function(r){});
				}
			},
			error : function(obj,err,status) {
				closeLoading();
			}
		})
	})
}

/**
 * 更新时验证货币数据
 * @param {} fun
 */
function validateUpdateCurrency(fun) {
	var currency_json = getUpdateCurrencyJson();
	openLoading();
	$.ajax({
		type : 'post',
		url : contextPath + '/adminCurrency/validateCurrency',
		data : currency_json,
		dataType : 'json',
		success : function(data) {
			closeLoading();
			if(data.result == 'success') {
				fun(currency_json);
			} else {
				closeLoading();

				var errorMsg = '';
				var errorList = data.errorList;
				for (msg in errorList ){
					errorMsg += errorList[msg]+"\n";
				}

				jWrong(errorMsg, error,function(r){});
			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
}

/**
 * 新增时验证货币数据
 * @param {} fun
 */
function validateInsertCurrency(fun) {
	var currency_json = getInsertCurrencyJson();
	openLoading();
	$.ajax({
		type : 'post',
		url : contextPath + '/adminCurrency/validateCurrency',
		data : currency_json,
		dataType : 'json',
		success : function(data) {
			closeLoading();
			if(data.result == 'success') {
				fun(currency_json);
			} else {
				closeLoading();
				var errorMsg = '';
				var errorList = data.errorList;
				for (msg in errorList ){
					errorMsg += errorList[msg]+"\n";
				}

				jWrong(errorMsg, error,function(r){});
			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
}

/** 更新时获取货币数据
 *
 * @return currency_json{}
 */
function getUpdateCurrencyJson() {
	var currency_id = $('#currency_id').val();
	var currency_nm = $('#currency_nm').val();
	var is_valid = $('input[name="is_valid"]:checked').val();

	var currency_json = {
		currency_id : currency_id,
		currency_nm : currency_nm,
		is_valid : is_valid,
		operational_mode :'update'
	};

	return currency_json;
}

/** 新增时获取货币数据
*
* @return currency_json{}
*/
function getInsertCurrencyJson() {
	var currency_id = $('#currency_id').val();
	var currency_nm = $('#currency_nm').val();
	var is_valid = $('input[name="is_valid"]:checked').val();

	var currency_json = {
		currency_id : currency_id,
		currency_nm : currency_nm,
		is_valid : is_valid,
		operational_mode :'insert'
	};

	return currency_json;
}

/**
 * 填入货币数据
 * @param {} data
 */
function fillCurrencyInput(data) {
	$('#currency_id').val(data.currency_id);
	$('#currency_nm').val(data.currency_nm);
	$('input[name="is_valid"]').each(function(index){
		if(this.value == data.is_valid) {
			this.checked = true;
		}
	});
}
/**
 * 清除货币输入框
 */
function clearCurrencyInput() {
	$('#currency_id').val('');
	$('#currency_nm').val('');
	$('input[name="is_valid"]').each(function(index){
		if(index == 0) {
			this.checked = true;
		}
	});
}

$(function(){
	//选中行效果
	$('#currency_table').selectRow();
	//新增货币
	$('#tonecurrency').click(function(e){
		openCurrencyPop({
			flag : 1
		});
	});
	//双击用户所在行编辑货币
	$(document).on('dblclick','#currency_table td',function(e){
		openCurrencyPop({
			flag : 2,
			target : $(this)
		});
	});
	//点击编辑按钮
	$(document).on('click','.edit-dialog',function(e){
		openCurrencyPop({
			flag : 2,
			target : $(this).parent()
		});
// 			e.stopPropagation();
	});

	$(document).on('click','.del-currency',function(e){
		deleteCurrency(this);
	});

	//回车点击事件，进行关键字搜索
	$('#keyword').keydown(function(e){
		var curKey = e.which;
		if(curKey == 13){
			searchCurrency();
		}
	});

});