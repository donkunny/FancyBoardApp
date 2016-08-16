<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="<%=pageContext.getServletContext().getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<title>Donkunny's Bulletin Board</title>

</head>
</head>
<body>
	<div class="box-header">
		<h3 class="box-title">LIST ALL PAGE</h3>
	</div>
	<table class="table table-striped">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th style="width: 60px">조회수</th>
		</tr>
		<c:forEach items="${list}" var="boardVO">
			<tr>
				<td>${boardVO.bno}</td>
				<td><a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}'>
						${boardVO.title}</a></td>
				<td>${boardVO.writer}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
				<td><span class="badge bg-red">${boardVO.viewcnt}</span> </td>
			</tr>
		</c:forEach>
	</table>

	<div class="box-footer">
		<button type="submit" class="btn btn-primary">글쓰기</button>
		
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="listPage?page=${pageMaker.startPage - 1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.cri.page == idx?'class =active':'' }" />	>
					<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>					
					</li>					
				</c:forEach>
			
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<script src="/resources/jquery-3.1.0.min.js"></script>
	<script>
		var result = '${msg}';
		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		} else if(result == 'REGISTER'){
			alert("등록이 완료되었습니다.");
		}
		
		$(".btn-primary").on("click", function() {
			self.location = "/board/register";
		});
	</script>

</body>
</html>