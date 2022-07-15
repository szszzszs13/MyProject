
/** 分页用*/
function change_page(page, rows) {
	$('#current_page').val(page);
	$('#dispay_rows').val(rows);
	openLoading('');
	document.adminAgencyForm.submit();
}

function change_rows(page, rows) {
	document.getElementById('current_page').value = 1;
	document.getElementById('dispay_rows').value = rows;
	openLoading('');
	document.adminAgencyForm.submit();
}

//搜索代理商
function searchAgency() {
	var keyword = $('#keyword').val();
	$('#search_keyword').val(keyword);
	openLoading('');
	document.adminAgencyForm.submit();
}

//form提交排序
function toOrder() {
	openLoading('');
	document.adminAgencyForm.submit();
}

//打开代理商编辑或增加pop
function openAgencyPop(is) {
	clearAgencyInput();
	var param = {
			width : 450,
			height : 275,
			modal : true
		};
		//代理商增加
		if(is.flag == 1) {
			param.title = agency_add;
			var buttons = [{
				text : common_button_save,
				click : function() {
					validateInsertAgency(insertAgency);
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
			openPop('agency_dialog',param);
		}
		//代理商编辑
		else {
			var agency_id = $(is.target).parent().attr('id');
			openLoading();
			$.ajax({
				type : 'post',
				url : contextPath + '/adminAgency/getAgencyInfo',
				data : {agency_id:agency_id},
				dataType : 'json',
				success : function(data) {
					closeLoading();
					fillAgencyInput(data);
					param.title = agency_edit;
					var buttons = [{
						text : common_button_save,
						click : function() {
							validateUpdateAgency(updateAgency);
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
					openPop('agency_dialog',param);
				}
			})

		}
}

/**
 * 代理商
 * @param {} agency_json
 */
function insertAgency(agency_json) {
	$.ajax({
		type : 'post',
		url : contextPath + '/adminAgency/insertAgency',
		data : agency_json,
		dataType : 'json',
		success : function(data) {
			//closeLoading();
			if(data.result == 'success') {
				document.adminAgencyForm.submit();
			} else {
				closeLoading();
				//alert('error');
				jWrong(validator_system_error, error, function(r){});
			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
	$('#agency_dialog').dialog('close');
}

/**
 * 更新代理商
 * @param {} item
 */
function updateAgency(agency_json) {
	$.ajax({
		type : 'post',
		url : contextPath + '/adminAgency/updateAgency',
		data : agency_json,
		dataType : 'json',
		success : function(data) {
			//closeLoading();
			if(data.result == 'success') {
				document.adminAgencyForm.submit();
			} else {
				closeLoading();
				$('#agency_dialog').dialog('close');
				jWrong(validator_system_error, error,null);
			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
}

/**
 * 删除代理商
 * @param {} item
 */
function deleteAgency(item) {
	jConfirm(delete_confirm, confirm_box_title, function(r){
		if (r == false){
			return false;
		}
		var agency_id = $(item).parent().parent().attr('id');
		openLoading();
		$.ajax({
			type : 'post',
			url : contextPath + '/adminAgency/deleteAgency',
			data : {agency_id : agency_id},
			dataType : 'json',
			success : function(data) {
				closeLoading();
				if(data.result == 'deleteSuccess') {
					document.adminAgencyForm.submit();
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
 * 更新时验证代理商数据
 * @param {} fun
 */
function validateUpdateAgency(fun) {
	var agency_json = getUpdateAgencyJson();
	openLoading();
	$.ajax({
		type : 'post',
		url : contextPath + '/adminAgency/validateAgency',
		data : agency_json,
		dataType : 'json',
		success : function(data) {
			closeLoading();
			if(data.result == 'success') {
				fun(agency_json);
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
 * 新增时验证代理商数据
 * @param {} fun
 */
function validateInsertAgency(fun) {
	var agency_json = getInsertAgencyJson();
	openLoading();
	$.ajax({
		type : 'post',
		url : contextPath + '/adminAgency/validateAgency',
		data : agency_json,
		dataType : 'json',
		success : function(data) {
			closeLoading();
			if(data.result == 'success') {
				fun(agency_json);
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

/** 更新时获取代理商数据
 *
 * @return agency_json{}
 */
function getUpdateAgencyJson() {
	var agency_id = $('#agency_id').val();
	var agency_nm = $('#agency_nm').val();
	var agency_user_id = $('#agency_user_id').val();
	var is_valid = $('input[name="is_valid"]:checked').val();

	var agency_json = {
		agency_id : agency_id,
		agency_nm : agency_nm,
		agency_user_id : agency_user_id,
		is_valid : is_valid,
		operational_mode :'update'
	};

	return agency_json;
}

/** 新增时获取代理商数据
*
* @return agency_json{}
*/
function getInsertAgencyJson() {
	var agency_id = $('#agency_id').val();
	var agency_nm = $('#agency_nm').val();
	var agency_user_id = $('#agency_user_id').val();
	var is_valid = $('input[name="is_valid"]:checked').val();

	var agency_json = {
		agency_id : agency_id,
		agency_nm : agency_nm,
		agency_user_id : agency_user_id,
		is_valid : is_valid,
		operational_mode :'insert'
	};

	return agency_json;
}

/**
 * 填入代理商数据
 * @param {} data
 */
function fillAgencyInput(data) {
	$('#agency_id').val(data.agency_id);
	$('#agency_nm').val(data.agency_nm);
	$('#agency_user_id').val(data.agency_user_id);
	$('#agency_user_name').html(data.agency_user_nm);

	$('input[name="is_valid"]').each(function(index){
		if(this.value == data.is_valid) {
			this.checked = true;
		}
	});
}
/**
 * 清除代理商输入框
 */
function clearAgencyInput() {
	$('#agency_id').val('');
	$('#agency_nm').val('');
	$('#agency_user_id').val('');
	$('#agency_user_name').html('');

	$('input[name="is_valid"]').each(function(index){
		if(index == 0) {
			this.checked = true;
		}
	});
}

function openUserPop() {
	popupUser.openUserPop('agency_user_id', 'agency_user_name');
}


$(function(){
	//选中行效果
	$('#agency_table').selectRow();
	//新增代理商
	$('#tonewagency').click(function(e){
		openAgencyPop({
			flag : 1
		});
	});
	//双击用户所在行编辑代理商
	$(document).on('dblclick','#agency_table td',function(e){
		openAgencyPop({
			flag : 2,
			target : $(this)
		});
	});
	//点击编辑按钮
	$(document).on('click','.edit-dialog',function(e){
		openAgencyPop({
			flag : 2,
			target : $(this).parent()
		});
// 			e.stopPropagation();
	});

	$(document).on('click','.del-agency',function(e){
		deleteAgency(this);
	});

	$(document).on('click','#user_search',function(e){
		openUserPop();
	});

	//回车点击事件，进行关键字搜索
	$('#keyword').keydown(function(e){
		var curKey = e.which;
		if(curKey == 13){
			searchAgency();
		}
	});
});