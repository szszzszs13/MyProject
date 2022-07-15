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
	</head>
	<body>

		<%
		AdminCurrency currency=new AdminCurrency();
		currency.setCurrency_cd(request.getParameter("currencyCd"));
		currency.setCurrency_nm(new String(request.getParameter("currencyName").getBytes("ISO-8859-1"),"UTF-8"));
		currency.setIs_valid(request.getParameter("is_valid"));
		int count=adminCurrencyDao.insertCurrency(currency);
		response.sendRedirect(request.getContextPath()+"/currency/CurrencyMaster.jsp");
		%>
	</body>
</html>