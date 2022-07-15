<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户信息界面</title>
	</head>
	<body>
		<form action="requestDemo02" method="post">
			<h1>
				请用戶输入以下信息：
			</h1>
			用户编号：
			<input type="text" name="userid" size="2" maxlength="2">
			<br>
			用&nbsp;&nbsp;户&nbsp;&nbsp;名：
			<input type="text" name="username">
			<br>
			性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
			<input type="radio" name="sex" value="男" checked>
			男
			<input type="radio" name="sex" value="女">
			女
			<br>
			部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门：
			<select name="dept">
				<option value="技术部">
					技术部
				</option>
				<option value="销售部" SELECTED>
					销售部
				</option>
				<option value="财务部">
					财务部
				</option>
			</select>
			<br>
			兴&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;趣：
			<input type="checkbox" name="inst" value="唱歌">
			唱歌
			<input type="checkbox" name="inst" value="游泳">
			游泳
			<input type="checkbox" name="inst" value="跳舞">
			跳舞
			<input type="checkbox" name="inst" value="编程" >
			编程
			<input type="checkbox" name="inst" value="上网">
			上网
			<br>
			<input type="submit" value="提交"><input type="reset" value="重置">
		</form>
	</body>
</html>
