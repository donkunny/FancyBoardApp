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
	<form role="form" action="listPage" method="post">
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">

		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">제목</label> <input type="text"
					name='title' class="form-control" placeholder="제목을 작성하세요.">
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">내용</label>
				<textarea class="form-control" name="content" rows="3"
					placeholder="내용을 작성하세요."></textarea>
			</div>

			<div class="form-group">
				<label for="exampleInputEmail1">Writer</label> <input type="text"
					name="writer" class="form-control" placeholder="작성자">
			</div>
		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="submit" class="btn btn-danger">취소</button>
		</div>
	</form>
	<script src="/resources/jquery-3.1.0.min.js"></script>
	<script>
		$(document).read(
			function(){
				var formObj = $("form[role='form']");
				console.log(formObj);
				
				$(".btn-danger").on("click", function(){
					sef.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
// 					formObj.attr("method", "get");
// 					formObj.attr("action", "/board/listPage");
// 					formObj.submit();
				});
				
				$(".btn-primary").on("click", function(){
					formObj.submit();
				});
			});
	</script>

</body>
</html>