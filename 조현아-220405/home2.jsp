<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 2</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String comment = request.getParameter("commentValue");
	
	%>
	글 제목 - <%out.println(title); %><br>
	글 내용 - <%out.println(comment); %>
</body>
</html>