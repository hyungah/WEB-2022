<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
      import = "java.sql.*"    
%>
<%
   request.setCharacterEncoding("utf-8");

   //클라이언트에서 전달된 데이터
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   String name = request.getParameter("name");
   
   //dbcp로 변경
   Context initCtx = new InitialContext();
   Context envCtx = (Context)initCtx.lookup("java:comp/env");
   DataSource ds = (DataSource)envCtx.lookup("jdbc/hyunah");
   Connection con = ds.getConnection();
   
   
   //3. SQL문 
   String sql = "insert into login(id, pwd, name) values(?, ?, ?)";
   
   //4. SQL 실행
   //Statement stmt = con.createStatement();
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1, id);
   pstmt.setString(2, pwd);
   pstmt.setString(3, name);
   
   int i = pstmt.executeUpdate();
   //int i = stmt.executeUpdate(sql);
   
   //5.객체 해지
   pstmt.close();
   con.close();
   
   response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
</head>
<body>
   <%=i %>개의 데이터가 입력되었습니다!
</body>
</html> 