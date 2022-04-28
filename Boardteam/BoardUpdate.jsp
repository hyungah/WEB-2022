<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
	String titleBoard = request.getParameter("titleBoard");

	//1. jdbc driver 로드
	Class.forName("org.mariadb.jdbc.Driver");
	//2. 커넥션 얻기
	String url = "jdbc:mariadb://localhost:3333/teamdb";
	String user = "indef";
	String password = "1111";
	Connection con = DriverManager.getConnection(url, user, password);
	//3. 연결 설정
	String sql = "select * from board where titleBoard=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, titleBoard);
	ResultSet rs = pstmt.executeQuery();
	String tBoard = "";
	String conBoard = "";
	if(rs.next()) {
		 tBoard = rs.getString("titleBoard");
		 conBoard = rs.getString("conBoard");
	}
	
	rs.close();
	pstmt.close();
	con.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원정보 업데이트</title>
  <meta charset="utf-8">
<body>

<div id="wrap">
        <h2>게시글 작성</h2>
        <form method="post" action="UpdateProBoard.jsp">
           	글 제목 <input type="text" id="textTitle" name ="tT" value="<%=tBoard%>">
            <table>
              <tr>
                    <th>내용</th>
                    <td><input type="text" name="content" value="<%=conBoard%>"></td>
                </tr>
            </table>
            <input class="btn" type="submit" value="수정하기">
            <input class="btn" type="reset" value="다시작성하기">
            <input type="button" value="삭제하기" onclick= "location.href='delete.jsp?titleBoard=<%=tBoard%>'">
            <input class="btn" type="button" value="취소" onclick="javascript:history.back()">
        </form>
    </div>
</body>
</html>