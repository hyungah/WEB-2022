<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 등록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
</head>
<body>
		<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">사용자 등록</h2>
		<hr/>
		<form action="insert.do" method="post">
		  <div class="form-group">
	      <label for="id">id :</label>
	      <input type="text" class="form-control" id="id" name="id">
	    </div>
	    <div class="form-group">
	      <label for="pwd">password :</label>
	      <input type="password" class="form-control" id="pwd" name="pwd">
	    </div>
	    <div class="form-group">
	      <label for="name">name :</label>
	      <input type="text" class="form-control" id="name" name="name">
	    </div>
	    <!-- 2. email 입력할 수 있는 폼 만들기 -->
			<div class="form-group">
	      <label for="name">email :</label>
	      <input type="text" class="form-control" id="email" name="email">
	    </div>

	    
	    <div class="text-center">
				<button  type="submit" class="btn btn-secondary">등록</button>
				<button  type="button" class="btn btn-secondary" onclick ="location.href='index.do'">돌아가기</button>
			</div>
		</form>
	</div>
</body>
</html>
