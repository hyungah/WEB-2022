<%
/*
	파일명 :
	프로그램 설명 : zzang
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");

	//클라이언트에서 전달된 데이터
	String tT = request.getParameter("tT");
	String cont = request.getParameter("content");
	
	//1. jdbc 드라이브 로드
	Class.forName("org.mariadb.jdbc.Driver");		

	//2. 커넥션 객체 얻기
	String url ="jdbc:mariadb://localhost:3333/teamdb";
	String user="indef";
	String password="1111";
	Connection con = DriverManager.getConnection(url, user, password);
	
	//3. SQL문 
	String sql = "insert into board(titleBoard, conBoard) values(?, ?)";
	
	//4. SQL 실행
	//Statement stmt = con.createStatement();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, tT);
	pstmt.setString(2, cont);
	
	pstmt.executeUpdate();
	//int i = stmt.executeUpdate(sql);
	
	//5.객체 해지
	pstmt.close();
	con.close();
	
	response.sendRedirect("board3.jsp");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>