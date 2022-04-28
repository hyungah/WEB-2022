<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<%
	request.setCharacterEncoding("utf-8");

	//클라이언트에서 전달된 데이터
	String titleBoard = request.getParameter("titleBoard");
	
	//1. jdbc 드라이브 로드
	Class.forName("org.mariadb.jdbc.Driver");		

	//2. 커넥션 객체 얻기
	String url ="jdbc:mariadb://localhost:3333/teamdb";
	String user="indef";
	String password="1111";
	Connection con = DriverManager.getConnection(url, user, password);
	
	//3. SQL문 
	String sql = "DELETE FROM Board WHERE titleBoard=?";	// 삭제 - login 테이블의 id가 변수값인 Tuple을 삭제
	
	//4. SQL 실행
	//Statement stmt = con.createStatement();
	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setString(1, titleBoard);	// sql문의 1번째 ? 값을  id변수로 설정
	
	int i = pstmt.executeUpdate();	// 반환값이 없는 sql문(INSERT,UPDATE AND DELETE(ctrl+spaceBar눌러서 확인가능))은 executeUpdate(); 파라메터 사용
	//int i = stmt.executeUpdate(sql);
	
	//5.객체 해지
	pstmt.close();	
	con.close();
	
	response.sendRedirect("board3.jsp");	// sql을 실행하고 response(응답)객체를 통해 list.jsp 페이지로 리다이렉트(Redirect)
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>