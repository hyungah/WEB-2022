<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 3</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String[] Gender = request.getParameterValues("Gender");
	
		out.println("이름: " + name);
	for(int i=0; i < Gender.length; i++) {
		out.println("성별: " + Gender[i]);
	}
	%>
</body>
</html>