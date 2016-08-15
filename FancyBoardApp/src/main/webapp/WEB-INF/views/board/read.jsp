<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="<%=pageContext.getServletContext().getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="box-header">
		<h3 class="box-title">READ BOARD</h3>
	</div>
	<form role="form" method="post">
		<input type="hidden" name="bno" value="${boardVO.bno}">
	</form>

	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> <input type="text"
				name='title' class="form-control" value="${boardVO.title}"
				readonly="readonly">
		</div>

		<div class="form-group">
			<label for="exampleInputPassword1">내용</label>
			<textarea class="form-control" name="content" rows="3"
				readonly="readonly">${boardVO.content}</textarea>
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">작성자</label> <input type="text"
				name="writer" class="form-control" value="${boardVO.writer}"
				readonly="readonly">
		</div>
	</div>

	<div class="box-footer">
		<button type="submit" class="btn btn-warning">Modify</button>
		<button type="submit" class="btn btn-danger">REMOVE</button>
		<button type="submit" class="btn btn-primary">LIST ALL</button>
	</div>
	
	<script src="/resources/jquery-3.1.0.min.js"></script>
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-warning").on("click", function() {
				formObj.attr("action", "/board/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".btn-danger").on("click", function() {
				formObj.attr("action", "/board/remove");
				formObj.submit();
			});

			$(".btn-primary").on("click", function() {
				self.location = "/board/listAll";
			});

		});
	</script>
</body>
</html>