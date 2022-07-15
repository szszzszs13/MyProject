<%@ page language="java" import="java.util.*,com.inspur.ch5.Person" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>el获取数据的案例演示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
      pageContext.setAttribute("user", "zhangsan");
     %>
     <!-- 从四个web域中取信息，page、request、session、application 
      等价于：pageContext.findAttribute("user")
      1、获取普通的属性信息。
     -->
    ${user}
    <hr>
    <%
       out.println(pageContext.findAttribute("user"));
     %>
     <hr>
     <!-- 2、el获取javabean的属性信息 -->
     <%
       Person person = new Person();
       person.setPersonName("中国人");
       pageContext.setAttribute("person1", person);
      %>
      ${person1}<br>
      ${person1.personName }
      <hr>
      <!-- 3、el获取数组信息 -->
      <%
        String names[] = new String[3];
        names[0]="zhangsan1";
        names[1]="zhangsan2";
        names[2]="zhangsan3";
        pageContext.setAttribute("names", names);
       %>
       ${names}<br>
       ${names[0]}&nbsp;&nbsp;${names[1]}&nbsp;&nbsp;${names[2]}
       <hr>
       <!-- 4、el获取collection信息 -->
       <%
         List<String> namesList = new ArrayList<String>();
         namesList.add("lisi1");
          namesList.add("lisi2");
          request.setAttribute("namesList", namesList);
        %>
        ${namesList}<br>
        ${namesList[0]}&nbsp;${namesList[1]}
        <!-- 5、el获取map信息 -->
        <hr>
        <%
         Map<String,String> scoreMap = new HashMap<String,String>();
         scoreMap.put("english", "80");
         scoreMap.put("math", "90");
         session.setAttribute("scoreMap", scoreMap);
         %>
         ${scoreMap}<br>
         ${scoreMap.english}&nbsp;${scoreMap.math}<br>
         ${scoreMap["english"]}&nbsp;${scoreMap["math"]}
         
         <hr>
         <!-- 在list中存放Person类型的对象，然后利用el表达式获取对象信息 -->
         <%
           Person p1 = new Person();
           p1.setPersonName("wangwu");
            Person p2 = new Person();
           p2.setPersonName("maliu");
           List<Person> personList = new ArrayList<Person>();
           personList.add(p1);
           personList.add(p2);
           session.setAttribute("personList", personList);
           //el取动态的值
           int i = 1;
           pageContext.setAttribute("i", i);
          %>
          ${personList[0].personName}<br>
          ${personList[1].personName}<br>
          ${personList[i].personName}
  </body>
</html>
