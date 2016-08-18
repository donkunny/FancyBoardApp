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
		<h3 class="box-title" align="center">동쿠니 게시판</h3>
	</div>

	<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">게시글 등록하기</h3>
				</div>

				<form role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> 
							<input type="text" name='title' class="form-control" placeholder="제목을 입력하세요...">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">내용</label>
							<textarea class="form-control" name="content" rows="3" placeholder="내용을 입력하세요..."></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">작성자</label> 
							<input type="text" name="writer" class="form-control" placeholder="작성자를 입력하세요...">
						</div>
					</div>
					
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
				</form>
			</div>
		</div>
		
</body>
</html>