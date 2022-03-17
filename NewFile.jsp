<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.time.*"
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>나의 첫 JSP</title>
</head>
<body>
	<h2>안녕하세요 *^^*</h2>
	
	<%
		out.println("현재날짜: "  + LocalDate.now());	
	%>
	<br> 
	현재 시각: <%=LocalTime.now() %>
	
	
		
</body>
</html>