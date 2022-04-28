<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String email = request.getParameter("email");
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/hwijaelee");
		Connection cn = ds.getConnection();
		
		String sql = "insert into signIn(email, uname, pwd) values(?, ? ,?)";
		
		PreparedStatement pstmt = cn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, uname);
		pstmt.setString(3, pwd);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		cn.close();
	%>
</body>
</html>