/**
 * 绘制分页控件
 * paginationBean 保存分页信息的bean
 * String functionName 翻页时要调用的 JS 方法名 (字符串 例如 "routineChangePage")
 * String divName 容纳分页控件的DIV 名称
 *
 * */
function drawPagination (paginationBean,functionName,divName){

	$("#"+divName).empty();
	var ul=$("<ul></ul");
	var li;

	//起始页
	if (paginationBean.is_prev) {
		li = $("<li><a href='javascript:void(0)' onclick='"+functionName+"(1)'>&lt;&lt;</a></li>");
	} else {
		li = $("<li class='disabled'><a href='javascript:void(0)'>&lt;&lt;</a></li>");
	}
	ul.append(li);

	//上一页
	if (paginationBean.is_prev) {
		li = $("<li><a href='javascript:void(0)' "+
			"onclick='"+functionName+"("+(paginationBean.current_page-1)+")'>&lt;</a></li>");
	} else {
		li = $("<li class='disabled'><a href='javascript:void(0)''>&lt;</a></li>");
	}
	ul.append(li);

	//总页数大于5时
	if (paginationBean.total_page > 5 ) {

		if (paginationBean.is_prev && paginationBean.current_page > 3) {
			li=$("<a href='javascript:void(0)''>…</a>");
			ul.append(li);
		}

		//选择1到9的情况下1到5表示

		if (paginationBean.current_page < 3) {

			for (var i = 1; i <= 5 ; i++) {

				if (i == paginationBean.current_page) {
					li = $("<li class='active'><a href='javascript:void(0)'>"+i+"</a></li>");
				} else {
					li = $("<li><a href='javascript:void(0)' "+
						"onclick='"+functionName+"("+i+")'>"+i+"</a></li>");
				}
				ul.append(li);
			}

		}
		//选择5以上的情况
		if (paginationBean.current_page >= 3) {

			for (var i = paginationBean.start_page; i <= paginationBean.end_page ; i++) {

				if (i == paginationBean.current_page) {
					li = $("<li class='active'><a href='javascript:void(0)'>"+i+"</a></li>");
				} else {
					li = $("<li><a href='javascript:void(0)' "+
						"onclick='"+functionName+"("+i+")'>"+i+"</a></li>");
				}
				ul.append(li);
			}
		}

		if (paginationBean.is_next && paginationBean.current_page <= paginationBean.total_page - 3) {
			li=$("<a href='javascript:void(0)''>…</a>");
			ul.append(li);
		}

	}


	//总页数小于等于5时
	if (paginationBean.total_page <= 5 ) {

		for (var i = 1; i <= paginationBean.total_page ; i++) {

			if (i == paginationBean.current_page) {
				li = $("<li class='active'><a href='javascript:void(0)'>"+i+"</a></li>");
			} else {
				li = $("<li><a href='javascript:void(0)' "+
					"onclick='"+functionName+"("+i+")'>"+i+"</a></li>");
			}
			ul.append(li);
		}
	}

	//下一页

	if (paginationBean.is_next) {
		li = $("<li><a href='javascript:void(0)' "+
			"onclick='"+functionName+"("+(paginationBean.current_page+1)+")'>&gt;</a></li>");
	} else {
		li = $("<li class='disabled'><a href='javascript:void(0)''>&gt;</a></li>");
	}
	ul.append(li);


	//最后一页

	if (paginationBean.is_next) {
		li = $("<li><a href='javascript:void(0)' onclick='"+functionName+"("+paginationBean.total_page+")'>&gt;&gt;</a></li>");
	} else {
		li = $("<li class='disabled'><a href='javascript:void(0)'>&gt;&gt;</a></li>");
	}

	ul.append(li);
	$("#"+divName).append(ul);
	ul=$("<ul></ul>");

	//页码信息
	var current_start;
	var current_end;
	var total_count;

	if (paginationBean.total_count > 0) {
		total_count = paginationBean.total_count;
		current_start = (paginationBean.current_page - 1) * 10 + 1;
		if (paginationBean.current_page * 10 <= total_count) {
			current_end = paginationBean.current_page *10;
		} else {
			current_end = total_count;
		}
		li=$("<li><span>("+current_start+"-"+current_end+"/"+total_count+")</span></li>")
	} else {
		li=$("<li><span>(0-0/0)</span></li>");
	}

	ul.append(li);
	$("#"+divName).append(ul);
}