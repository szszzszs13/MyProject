<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="sym.common.bean.PageInforBean,sym.admin.bean.AdminCurrencyBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="ie6 ie"><![endif]-->
<!--[if IE 7]><html class="ie7 ie"><![endif]-->
<!--[if IE 8]><html class="ie8 ie"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="ja" class="">
	<!--<![endif]-->
	<head>
		<meta charset="UTF-8">
		<!--script frontend-->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/lib/jquery/jquery.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/lib/jquery_plugin/bs/js/bootstrap.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/lib/jquery_plugin/ui/jquery-ui.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common/popup.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/lib/jquery_alert/jquery.alerts.js"></script>
		<link id="icon" href="${pageContext.request.contextPath}/images/s.ico"
			rel="icon">
		<!--script 〓system-->

		<!--styles common-->
		<link
			href="${pageContext.request.contextPath}/js/lib/jquery_plugin/bs/css/bootstrap.min.css"
			rel="stylesheet" type="text/css">
		<link
			href="${pageContext.request.contextPath}/css/common/bootstrap_setup.css"
			rel="stylesheet" type="text/css">
		<link
			href="${pageContext.request.contextPath}/js/lib/jquery_plugin/ui/jquery-ui.css"
			rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/common/popup.css"
			rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/common/common.css"
			rel="stylesheet" type="text/css">
		<link
			href="${pageContext.request.contextPath}/css/component/admin/master.css"
			rel="stylesheet" type="text/css">
		<link
			href="${pageContext.request.contextPath}/js/lib/jquery_alert/jquery.alerts.css"
			rel="stylesheet" type="text/css">
		<script type="text/javascript">
		var submitS='确定';
		var cancelC='取消';
		function inputLabel () {
			$('#currency_cd').val('CNY');
			$('#currency_name').val('人民币');
		}
		function clearLabel() {
			$('#currency_cd').val('');
			$('#currency_name').val('');
		}

		var flag = true;

		$(function(){

			$(document).on('click','.sort',function(e){
				if($(this).find('span')[0] == null) {
						flag = false;
				}
				$('#search_result').find('.caret').remove();
				var sor = $('<span class="'+ (flag? 'caret up':'caret') +'"></span>')
				$(this).append(sor);
				flag = !flag;
			});

			$(document).on('dblclick','#search_result td',function(e){
				var param = {
						width : 600,
						height : 250,
						title : "货币编辑",
						modal : true,
						buttons : [{
							text : '保存',
							click : function() {
								$(this).dialog('close');
							},
							'class' : 'btn btn-primary btn-middle'
						},
						{
							text : '取消',
							click : function() {
								$(this).dialog('close');
							},
							'class': 'btn btn-inverse btn-middle btn-aft-middle'
						}
						]
					};
					inputLabel();
					openPop('customer_dialog',param);
			})
			$(document).on('click','.link-hand-dialog',function(e){
				var param = {
					width : 600,
					height : 250,
					title : "货币编辑",
					modal : true,
					buttons : [{
						text : '保存',
						click : function() {
							$(this).dialog('close');
						},
						'class' : 'btn btn-primary btn-middle'
					},
					{
						text : '取消',
						click : function() {
							$(this).dialog('close');
						},
						'class': 'btn btn-inverse btn-middle btn-aft-middle'
					}
					]
				};
				inputLabel();
				openPop('customer_dialog',param);
			});
			$('#tonewuser').on('click',function(e){
				var param = {
						width : 600,
						height : 250,
						title : "新增货币",
						modal : true,
						buttons : [{
							text : '保存',
							click : function() {
								addCurrency()
								$(this).dialog('close');
							},
							'class' : 'btn btn-primary btn-middle'
						},
						{
							text : '取消',
							click : function() {
								$(this).dialog('close');
							},
							'class': 'btn btn-inverse btn-middle btn-aft-middle'
						}
						]
					};
					clearLabel();
					openPop('customer_dialog',param);
			});

			//点击选中行
			$(document).on('click','#currency_table td',function(e){
				$('.row-select').removeClass('row-select');
				$(this).parent().addClass('row-select');
			})

			/**
			 * 状态“全选”选中时，其余项设定选中
			 *
			 * @private
			 */
			$(document).on("click", "#is_valid_all", function() {
				var check = this.checked;
				$("input[name = 'is_valid']").each(function() {
					this.checked = check;
					if (check){
						$(this).parent().parent().addClass('table-row-selected')
					}else{
						$(this).parent().parent().removeClass('table-row-selected');
					}
				});
			});

			/**
			 * 状态“全选”外其余项选中全部选中时，设定“全选”为选中状态
			 *
			 * @private
			 */
			$(document).on("click", "input[name = 'is_valid']", function() {
				if (this.checked){
					$(this).parent().parent().addClass('table-row-selected');
				}else{
					$(this).parent().parent().removeClass('table-row-selected');
				}
				var $subBox = $("input[name = 'is_valid']");
				var length = $("input[name = 'is_valid']:checked").length;
				$("#is_valid_all")[0].checked = ($subBox.length == length) ? true : false;
			});
		});
		function deleteContract(el){
			jConfirm('确认删除吗？', '确认对话框', function(r) {
				if (r == true) {
					$(el).parent().parent().remove();
				}
			});
		}
		function addCurrency() {
			var tr = [
				'<tr>',
				'<td>CNY</td>',
				'<td>人民币</td>',
				'<td class="center_td"><i class="icon icon-effective"></i>有效</td>',
				'<td class="center_td"><a class="icon icon-edit link-hand-dialog" data-toggle="modal" data-target="#currency_edit_modal">编辑</a></td>',
				'</tr>'];
			var tr_obj = $(tr.join());
			tr_obj.appendTo($('#search_result tbody'));
		}
		
		/** 
		  *显示首页功能
		  *@author guojl   
		 */
		function showFirstPage()
		{
			document.forms[0].action="/OMS/adminCurrencyPageListAction?method=firstPage";
			document.forms[0].submit();
		}
		
		/**
		  * 根据页码和显示行数进行换页
		  *@author guojl
		  */
		function query(pageNo,display_rows)
		{
		    if(pageNo<1){
		    	alert("已经是第一页!");
		    	return false;
		    }
		    if(pageNo > '${pageInforBean.totalPage}'){
		    	alert("已经是最后一页!");
		    	return false;
		    }
		   
			document.forms[0].action="/OMS/adminCurrencyPageListAction?method=showPage&pageNo="+pageNo+"&showCount="+display_rows;
			document.forms[0].submit();
		
		}
	</script>
	</head>
	<body>
		<!--▼▼▼header▼▼▼-->
		<header>
		<div class="navbar navbar-inverse">
			<div class="navbar-inner">
				<div class="container">
					<button data-target=".nav-collapse" data-toggle="collapse"
						class="btn btn-navbar" type="button">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!--logo-->
					<ul class="nav nav-pills logo">
						<li>
							<a class="logo" href="../../menu/mainMenuG.html"
								style="padding: 0px;"> <img alt=""
									src="${pageContext.request.contextPath}/images/logo.png"><span
								style="padding-left: 10px; padding-top: 10px; padding-bottom: 5px; color: #EEEEEE; font-size: 23px; font-weight: bold; vertical-align: middle;">订单管理系统</span>
							</a>
						</li>
					</ul>
					<!--navi-->
					<div class="nav-collapse collapse">
						<ul class="nav pull-right user">
							<li class="dropdown">
								<a data-toggle="dropdown" class="dropdown-toggle" href="#">
									<i class="icon-user icon-white unit"></i>${adminUserBean.user_nm
									}<b class="caret"></b> </a>
								<ul class="dropdown-menu" style="z-index: 1000000;">
									<li>
										<a href="../../common/resetPassword.html">修改密码</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="../../login.jsp">退出系统</a>
									</li>
								</ul>
							</li>
							<li class="" style="border-left-width: 0px;">
								<a class="" style="border-left-width: 0px;"
									data-toggle="dropdown" href="#"> <span
									class="label label-info"
									style="background: #4f81bd; padding: 3px 4px; width: 30px; height: 14px; text-align: center; border-radius: 10px; font-size: 13px;">管理</span>
								</a>
							</li>
						</ul>
						<ul class="nav pull-right navi">
							<li class="">
								<a href="../../menu/mainMenuG.jsp">返回主菜单</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		</header>
		<!--▼▼▼search▼▼▼-->
		<div class="container-fluid search disabled">
			<div class="row-fluid">
			</div>
		</div>
		<!--▼▼▼contents(field type)▼▼▼-->
		<div class="main">
			<div class="banner">
				<span>货币管理</span>
			</div>
			<div class="content">
				<!-- search-table -->
				<form method="post">
					<div class="search-table" id="search_table">
						<span
							style="background-color: #FFFFFF; font-size: 14px; left: 10px; position: relative; top: 9px;">&nbsp;查询条件&nbsp;</span>
						<div
							style="padding: 10px; border-width: 1px 0; border-style: solid; border-color: #0088CC;">
							<table class="table-edit" style="width: 90%; margin: 0 auto;">
								<tr>
									<td style="width: 100px" class="right_align">
										货币名称&nbsp;:
									</td>
									<td style="width: 260px">
										<input class="input-xlarge" type="text" name="currency_nm"
											style="width: 160px; text-align: left;" value="${pageInforBean.hm.currency_nm}">
									</td>
									<td style="width: 100px" class="right_align">
										状态&nbsp;:
									</td>
									<td>
										<label class="checkbox inline">
											<input id="is_valid_all" type="checkbox" id="is_valid_all"
												name="is_valid_all" value="ALL" ${pageInforBean.hm.is_valid eq '%'?'checked':''}>
											<span class="input-label">全部</span>
										</label>
										<label class="checkbox inline">
											<input id="is_valid_t" type="checkbox" id="is_valid_t"
												name="is_valid" value="T" ${(pageInforBean.hm.is_valid eq '%')||(pageInforBean.hm.is_valid eq 'T') ?'checked':''}>
											<span class="input-label">有效</span>
										</label>
										<label class="checkbox inline">
											<input id="is_valid_f" type="checkbox" id="is_valid_f"
												name="is_valid" value="F" ${pageInforBean.hm.is_valid eq '%'||(pageInforBean.hm.is_valid eq 'F')?'checked':''}>
											<span class="input-label">无效</span>
										</label>
									</td>
								</tr>
							</table>
							<div class="search-foot-btn">
								<a class="btn btn-warning btn-small" id="clear_input">重置</a>
								<a class="btn btn-success btn-small-aft" id="search"
									href="javascript:showFirstPage()">查询</a>
							</div>
						</div>
					</div>
				</form>
				<!-- search-table -->
				<div class="search-result">
					<div id="" class="top-btn-bar">
						<a id="tonewuser" class="icon icon-add" href="javascript:void(0);"
							title="" style="margin-right: 10px">新增货币</a>
					</div>
					<div id="search_result" class="search-result-content">
						<table class="table table-striped table-bordered"
							style="background-color: #E4F4CB;" id="currency_table">
							<thead>
								<tr>
									<th style="width: 15%; height: 21px;">
										<a class="sort">货币编号<span class="caret"></span>
										</a>
									</th>
									<th width="65%">
										<a class="sort">货币名称</a>
									</th>
									<th width="10%">
										<a class="sort">状态</a>
									</th>
									<th width="10%"></th>
								</tr>
							</thead>
							<tbody id="list">
								<%
									
									PageInforBean listBean = (PageInforBean)session.getAttribute("pageInforBean");
								    List currList = new ArrayList();
								    int totalPage = 0; //总页数
									if (listBean != null) {
										currList = listBean.getList(); //获取当前页面显示列表集合
										totalPage = listBean.getTotalPage(); //获取总页数
									}
									for (int i = 0; i < currList.size(); i++) {
										AdminCurrencyBean curr = (AdminCurrencyBean) currList.get(i);
								%>

								<tr>
									<td><%=curr.getCurrency_cd()%></td>
									<td><%=curr.getCurrency_nm()%></td>
									<td class="center_td">
										<i class="icon icon-effective"></i><%="T".equals(curr.getIs_valid()) ? "有效" : "无效"%></td>
									<td class="center_td">
										<a class="icon icon-edit  link-hand-dialog"
											data-toggle="modal" data-target="#currency_edit_modal">编辑</a>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>

				<div id="pagination" style="align: center; margin-top: -10px;">
					<div id='project_pagination' class="pagination pagination-centered">
						<div class="pagination">
							<ul>
								<li>
									<a href="javascript:void(0)" onclick="query(${pageInforBean.currentPage-1},${pageInforBean.showCount })">«</a>
								</li>
								<%
									for (int i = 1; i <= totalPage; i++) {
								%>
								<li class='<%=(i==listBean.getCurrentPage()?"active":"")%>'>
									<a href="javascript:query(<%=i%>,${pageInforBean.showCount } )"><%=i%></a>
								</li>
								<%
									}
								%>
								<li><a href="javascript:void(0)" onclick="query(${pageInforBean.currentPage+1 },${pageInforBean.showCount })">»</a></li>
							</ul>
							<ul>
								<%-- <li><span>(${(listBean.currentPage-1)*10+1} - ${listBean.currentPage*10}/<%=totalNum %>)</span></li> --%>
								
									<li>
										<span>(${pageInforBean.fromCount}-${pageInforBean.fromCount+pageInforBean.showCount-1}/${pageInforBean.totalNumber})</span>
									</li>
					

								<li>
									<span>显示条数&nbsp;:&nbsp;</span>
								</li>
							</ul>
							<ul>
								<li class="<%=(10==listBean.getShowCount()?"active":"")%>">
									<a href="javascript:query(1,10)">10</a>
								</li>
								<li class="<%=(30==listBean.getShowCount()?"active":"")%>">
									<a href="javascript:query(1,30)">30</a>
								</li>
								<li class="<%=(50==listBean.getShowCount()?"active":"")%>">
									<a href="javascript:query(1,50)">50</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="bottom_block">
				<a class="btn btn-info btn-middle" style=""
					href="../../menu/mainMenuG.jsp">返回主菜单</a>
			</div>
		</div>

		<!--新規 -->
		<div id="customer_dialog" style="display: none">
			<table class="table-edit table-bordered table-striped"
				style="width: 100%; border-collapse: collapse;">
				<tbody>
					<tr>
						<td class="right_align">
							<div class="  ">
								货币编号&nbsp;:&nbsp;
							</div>
						</td>
						<td>
							<input style="ime-mode: disabled" class="span3 jq-placeholder"
								type="text" id="currency_cd" size="10" value="1111" disabled />
						</td>
					</tr>
					<tr>
						<td class="right_align">
							<div class="">
								货币名称&nbsp;:&nbsp;
							</div>
						</td>
						<td>
							<input style="" type='text' size="10"
								class="span3 jq-placeholder must" id="currency_name">
						</td>
					</tr>
					<tr>
						<td class="right_align">
							<div class="">
								状态：
							</div>
						</td>
						<td>
							<label class="radio inline">
								<input type="radio" name="sex" value="1" checked></input>
								有效
							</label>
							<label class="radio inline">
								<input type="radio" name="sex" value="2"></input>
								无效
							</label>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

	</body>
</html>

