/** 分页用*/
function change_page(page, rows) {
	$('#current_page').val(page);
	$('#dispay_rows').val(rows);
	openLoading('');
	document.adminUserForm.submit();
}
function change_rows(page, rows) {
	document.getElementById('current_page').value = 1;
	document.getElementById('dispay_rows').value = rows;
	openLoading('');
	document.adminUserForm.submit();
}
/***END**/

//搜索用户
function searchUser() {
	var keyword = $('#keyword').val();
	$('#search_keyword').val(keyword);
	openLoading('');
	document.adminUserForm.submit();
}
//form提交排序
function toOrder() {
	openLoading('');
	document.adminUserForm.submit();
}
//打开用户编辑或增加pop
function openUserPop(is) {
	clearUserInput();
	var param = {
			width : 600,
			height : 320,
			modal : true
		};
		//用户增加
		if(is.flag == 1) {
			param.title = user_add;
			var buttons = [{
				text : common_button_save,
				click : function() {
					validUser(insertUser);
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
			openPop('user_dialog',param);
		}
		//用户编辑
		else {
			var user_id = $(is.target).parent().attr('id');
			openLoading();
			$.ajax({
				type : 'post',
				url : contextPath + '/adminUser/getUserDetail',
				data : {user_id:user_id},
				dataType : 'json',
				success : function(data) {
					closeLoading();
					fillUserInput(data);
					param.title = user_edit;
					var buttons = [{
						text : common_button_save,
						click : function() {
							validUser(updateUser);
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
					openPop('user_dialog',param);
				}
			})

		}
}
/**
 * 插入用户
 * @param {} user_json
 */
function insertUser(user_json) {
	$.ajax({
		type : 'post',
		url : contextPath + '/adminUser/insertUser',
		data : user_json,
		dataType : 'json',
		success : function(data) {
			//closeLoading();
			if(data.result == 'success') {
				document.adminUserForm.submit();
			} else {
				closeLoading();
				jWrong(data.errorMsg,message_error,function(r){});
			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
	$('#user_dialog').dialog('close');
}
/**
 * 更新用户
 * @param {} item
 */
function updateUser(user_json) {
	$.ajax({
		type : 'post',
		url : contextPath + '/adminUser/updateUser',
		data : user_json,
		dataType : 'json',
		success : function(data) {
			//closeLoading();
			if(data.result == 'success') {
				document.adminUserForm.submit();
			} else {
				closeLoading();
				$('#user_dialog').dialog('close');
				jWrong(data.errorMsg,message_error,function(r){});
			}
		},
		error : function(obj,err,status) {
			closeLoading();
		}
	})
}
/**
 * 删除用户
 * @param {} item
 */
function deleteUser(item) {
	jConfirm(delete_confirm,confirm_box_title,function(r){
		if(!r) {
			return;
		}
		var user_id = $(item).parent().parent().attr('id');
		openLoading();
		$.ajax({
			type : 'post',
			url : contextPath + '/adminUser/deleteUser',
			data : {user_id : user_id},
			dataType : 'json',
			success : function(data) {
				closeLoading();
				if(data.result == 'success') {
					document.adminUserForm.submit();
				} else {
					closeLoading();
					jWrong(data.errorMsg,message_error,function(r){});
				}
			},
			error : function(obj,err,status) {
				closeLoading();
			}
		})
	});
}
/**
 * 验证用户数据
 * @param {} fun
 */
function validUser(fun) {
	var user_json = getUserJson();
	openLoading();
	$.ajax({
		type : 'post',
		url : contextPath + '/adminUser/validUser',
		data : user_json,
		dataType : 'json',
		success : function(data) {
			closeLoading();
			if(data.result == 'success') {
				fun(user_json);
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
/** 获取用户数据
 *
 * @return user_json{}
 */
function getUserJson() {
	var user_id = $('#user_id').val();
	var user_nm = $('#user_nm').val();
	var user_phone = $('#user_phone').val();
	var user_owner_flg = $('input[name="user_owner_flg"]:checked').val();
	var is_valid = $('input[name="is_valid"]:checked').val();

	var user_json = {
		user_id : user_id,
		user_nm : user_nm,
		user_phone : user_phone,
		user_owner_flg : user_owner_flg,
		is_valid : is_valid,
		update_program : '700'
	};

	return user_json;
}
/**
 * 填入用户数据
 * @param {} data
 */
function fillUserInput(data) {
	$('#user_id').val(data.user_id);
	$('#user_nm').val(data.user_nm);
	$('#user_phone').val(data.user_phone);
	$('input[name="user_owner_flg"]').each(function(index){
		if(this.value == data.user_owner_flg) {
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
 * 清除用户输入框
 */
function clearUserInput() {
	$('#user_id').val('');
	$('#user_nm').val('');
	$('#user_phone').val('');
	$('input[name="user_owner_flg"]').each(function(index){
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

$(function(){
	//选中行效果
	$('#user_table').selectRow();
	//新增用户
	$('#tonewuser').click(function(e){
		openUserPop({
			flag : 1
		});
	});
	//双击用户所在行编辑用户
	$(document).on('dblclick','#user_table td',function(e){
		openUserPop({
			flag : 2,
			target : $(this)
		});
	});
	//点击编辑按钮
	$(document).on('click','.edit-dialog',function(e){
		openUserPop({
			flag : 2,
			target : $(this).parent()
		});
// 			e.stopPropagation();
	});

	$(document).on('click','.del-user',function(e){
		deleteUser(this);
	});
});