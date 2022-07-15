<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.List,entity.AdminCurrency"%>
<jsp:useBean id="adminCurrencyDao" class="dao.AdminCurrencyDaoImpl"
	scope="session"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">
			<link href="${pageContext.request.contextPath}/css/common/popup.css"
			rel="stylesheet" type="text/css">
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
		function addCurrency() {
		  document.forms[0].action="";
		  document.forms[0].submit();
		}
		//点击查询
		function searchCurrency(){
		  document.forms[0].action="currency/CurrencyMaster.jsp";
		  document.forms[0].submit();
		}

	</script>
	</head>
	<body>
		<%
			String currencyNm = "";
			if (request.getParameter("currencyName") != null) {
				currencyNm = new String(request.getParameter("currencyName")
						.getBytes("ISO-8859-1"), "UTF-8");
			}

			List<AdminCurrency> list = adminCurrencyDao.getComponentPageList(currencyNm);
		%>

		<!-- form表单 -->
		<form action="" method="post">

			<div class="main">
				<div class="banner">
					<span>货币管理</span>
				</div>
				<div class="content">
					<!-- search-table -->
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
										<input class="input-xlarge" type="text" name="currencyName"
											style="width: 160px; text-align: left;" value='<%=currencyNm %>'>
									</td>
								</tr>
							</table>
							<div class="search-foot-btn">
								<a class="btn btn-warning btn-small" id="clear_input">重置</a>
								<a class="btn btn-success btn-small-aft" id="search"
									onclick="searchCurrency()">查询</a>
							</div>
						</div>
					</div>
			
					<div class="">
						<div id="" class="top-btn-bar">
							<a id="tonewuser" class="icon icon-add"
								href="currency/InsertCurrencyMaster.jsp" title="" style="margin-right: 10px">新增货币</a>
						</div>
						<div class="">
							<table class="table table-striped table-bordered"
								style="background-color: #E4F4CB;" id="currency_table">
								<thead>
									<tr>
										<th style="width: 15%; height: 21px;">
											<a class="sort">货币编号<span class="caret"></span> </a>
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
								<!-- 下面是一览列表数据-->

								<tbody id="list">
									<%
										if (list == null || list.size() == 0) {
									%>
									您检索的数据不存在！
									<%
										} else {

												for (AdminCurrency currency : list) {
									%>
									<tr>
										<td>
											<%=currency.getCurrency_cd()%>
										</td>
										<td>
											<%=currency.getCurrency_nm()%>
										</td>
										<td class="center_td">
											<i class="icon icon-effective"></i>
											<%
												if (currency.getIs_valid().equals("T")) {
											%>
											有效
											<%
												} else {
											%>
											无效
											<%
												}
											%>
										</td>
										<td class="center_td">
											<a class="icon icon-edit  link-hand-dialog"
												data-toggle="modal" data-target="#currency_edit_modal">编辑</a>
										</td>
									</tr>
									<%
										}
											}
									
									%>

								</tbody>
							</table>
						</div>

					</div>
		</form>
	</body>
</html>