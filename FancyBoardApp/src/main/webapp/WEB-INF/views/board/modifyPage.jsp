<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

	<form role="form" action="modifyPage" method="post">

		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">

		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">등록 번호</label> 
				<input type="text" name='bno' class="form-control" value="${boardVO.bno}" readonly="readonly">
			</div>

			<div class="form-group">
				<label for="exampleInputEmail1">Title</label> 
				<input type="text" name='title' class="form-control" value="${boardVO.title}">
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Content</label>
				<textarea class="form-control" name="content" rows="3">${boardVO.content}</textarea>
			</div>

			<div class="form-group">
				<label for="exampleInputEmail1">Writer</label> 
				<input type="text" name="writer" class="form-control" value="${boardVO.writer}">
			</div>
		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">저장</button>
			<button type="submit" class="btn btn-warning">취소</button>
		</div>
	</form>
	
	<script src="/resources/jquery-3.1.0.min.js"></script>
	<script>
		$(document).read(
			function(){
				var formObj = $("form[role='form']");
				console.log(formObj);
				
				$(".btn-warning").on("click", function(){
					sef.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
				});
				
				$(".btn-primary").on("click", function(){
					formObj.submit();
				});
			});
	</script>
</body>
</html>