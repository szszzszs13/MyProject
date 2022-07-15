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


		//点击保存
		function saveCurrency(){
		  document.forms[0].action="currency/CurrencyMasterConfirm.jsp";
		  document.forms[0].submit();
		}

	</script>
	</head>
	<body>

		<!-- form表单 -->
		<form action="" method="post">		
			<div class="main">
				<div class="banner">
					<span>新增货币</span>
				</div>
						
<div  id="customer_dialog" >
	<table class="table-edit table-bordered table-striped" style="width:100%;border-collapse:collapse;">
		<tbody>
			<tr>
				<td class="right_align"><div class="  ">货币编号&nbsp;:&nbsp;</div></td>
				<td> <input style="ime-mode: disabled" class="span3 jq-placeholder must" type="text"  name="currencyCd"  size="10" /> </td>
			</tr>
			<tr>
				<td class="right_align"><div class="">货币名称&nbsp;:&nbsp;</div></td>
				<td><input  type='text' size="10"  class="span3 jq-placeholder must" name="currencyName" ></td>
			</tr>
			
			<tr>
				<td class="right_align"><div class="">状态：</div></td>
				<td >
				<div >
						<input type="radio" name="is_valid" value="T" checked style="width:40px"></input>有效
						<input type="radio" name="is_valid" value="F" style="width:40px"></input>无效
						</div>
				</td>
			</tr>
		
		</tbody>
	</table>
	<div align="center" style="width:70%"> <a class="btn btn-primary btn-middle" id="save" onclick="saveCurrency()">保存</a><a class="btn btn-inverse btn-middle btn-aft-middle" id="clear_input">取消</a></div>
</div>

					
		</form>
	</body>
</html>