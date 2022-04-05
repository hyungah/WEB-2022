<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 1</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String K = request.getParameter("korean");
	String E = request.getParameter("english");
	String M = request.getParameter("math");
	int A = Integer.parseInt(K);
	int B = Integer.parseInt(E);
	int C = Integer.parseInt(M);
	float Average = (float)(A+B+C)/3;
	%>
	국어 점수 : <%=A %>	<br>
	영어 점수 : <%=B %>	<br>
	수학 점수 : <%=C %>	<br>
	
	총점 : <%=A+B+C %><br>
	평균 : <%=String.format("%.2f", Average) %>
</body>
</html>