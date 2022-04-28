<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"   
%>
   <%
      //1. jdbc driver 로드
   Class.forName("org.mariadb.jdbc.Driver");      
      
      //2. 커넥션 얻기
   String url ="jdbc:mariadb://localhost:3333/teamdb";
   String user="indef";
   String password="1111";
   Connection con = DriverManager.getConnection(url, user, password);
   
      //3. 연결 설정
   String sql = "select * from board";
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>

  <title>게시판 목록
</title>
<style>
   #write{float: right;}
</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
   <h2 style = "text-align:center">목록</h2>
<div class="container">

   <table class="table table-bordered">
      <tr>
         <th>제목</th>
         <th>글내용</th>
      </tr>
      <tr>


<%   
      //4. 반환데이터 출력
   while(rs.next()){
      String titleBoard = rs.getString("titleBoard");
      String conBoard = rs.getString("conBoard");
%>
         <td><a href="BoardUpdate.jsp?titleBoard=<%=titleBoard%>"><%=titleBoard %></td>
         <td><%=conBoard %></td>
      </tr>
<%
   }
%>
   </table>
         <a href="Board2.html" role="button" id="write">글쓰기</a>
            
</div>
<%
   
      //5. 객체 해지
      rs.close();
      stmt.close();
      con.close();
   
   %>
   
</body>
</html>