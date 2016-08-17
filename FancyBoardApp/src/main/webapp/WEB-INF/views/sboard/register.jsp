<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=pageContext.getServletContext().getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<title>Donkunny's Bulletin Board</title>
</head>
<body>
	<div class="box-header">
		<h3 class="box-title">REGISTER BOARD</h3>
	</div>

	<form role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">제목</label> <input type="text" name='title' class="form-control" placeholder="Write Title">
			</div>
			
			<div class="form-group">
				<label for="exampleInputPassword1">Content</label> 
				<textarea class="form-control" name="content" rows="3" placeholder="Write here ..."></textarea>
			</div>
			
			<div class="form-group">
				<label for="exampleInputEmail1">Writer</label> 
				<input type="text" name="writer" class="form-control" placeholder="Write Writer">
			</div>
		</div>
		
		<div class="box-footer">
			<button class="btn btn-primary">등록</button>
			<button class="btn btn-danger">취소</button>
		</div>
	</form>

	<script src="/resources/jquery-3.1.0.min.js"></script>
	<script>
		$(".btn-danger").on("click", function() {
			self.location = "/sboard/list";
		});
	</script>
</body>
</html>