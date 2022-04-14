<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
	String id = request.getParameter("id");

//1. jdbc driver 로드
Class.forName("org.mariadb.jdbc.Driver");      
   
   //2. 커넥션 얻기
String url ="jdbc:mariadb://localhost:3333/hyunahdb";
String user="hyunah";
String password="1111";
Connection con = DriverManager.getConnection(url, user, password);

   //3. 연결 설정
String sql = "select * from login where id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);

ResultSet rs = pstmt.executeQuery();
String name = "";
String pwd = "";
if(rs.next()) {
	name = rs.getString("name");
	pwd = rs.getString("pwd");
}

rs.close();
pstmt.close();
con.close();

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인</title>
  <meta charset="utf-8">
<body>

<div class="container">
  <h2>회원 변경</h2>
  <form action="updatePro.jsp" method="post">
    <div class="form-group">
      <label for="id">id:</label>
      <input type="text" class="form-control" id="id" name="id" value="<%=id %>" disabled >  
    </div>
    <div class="form-group">
      <label for="name">name:</label>
      <input type="text" class="form-control" id="name"  name="name" value="<%=name %>">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd"  name="pwd" value="<%=pwd %>">
    </div>
     

    <button type="submit" class="btn btn-primary">변경 저장</button>
    <button class="btn btn-primary" onclick="location.href='delete.jsp?id=<%=id %>'">사용자 삭제</button>
    <button class="btn btn-primary" onclick="location.href='list.jsp'">사용자 조회</button>
    
  </form>
</div>

</body>
</html>