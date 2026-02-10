<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="login.User" %>
<%@ page import="login.UserDao" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("username");
String pass=request.getParameter("password");
User u=new User();
u.setUsername(name);
u.setPassword(pass);
int status=UserDao.save(u);
if(status>0){
	out.print("Registered Succefully");
}else{
	out.print("Unable to Register");
}

%>
</body>
</html>