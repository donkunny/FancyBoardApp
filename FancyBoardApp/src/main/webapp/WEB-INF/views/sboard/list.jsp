<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=pageContext.getServletContext().getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>Donkunny's Bulletin Board</title>

</head>
</head>
<body>
	<div class="box-header">
		<h3 class="box-title" align="center">동쿠니 게시판</h3>
	</div>
	<br><br>
	<!-- Search function -->
	<div class="box-body">
		<div class="col-xs-2">
			<select name="searchType" class="form-control">
				<option value="n"
					<c:out value="${cri.searchType == null?'selected':''}" />>
					---</option>

				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':''}" />>
					제목</option>

				<option value="c"
					<c:out value="${cri.searchType eq 'c'?'selected':''}" />>
					내용</option>

				<option value="w"
					<c:out value="${cri.searchType eq 'w'?'selected':''}" />>
					작성자</option>

				<option value="tc"
					<c:out value="${cri.searchType eq 'tc'?'selected':''}" />>
					제목 또는 내용</option>

				<option value="cw"
					<c:out value="${cri.searchType eq 'cw'?'selected':''}" />>
					내용 또는 작성자</option>

				<option value="tcw"
					<c:out value="${cri.searchType eq 'tcw'?'selected':''}" />>
					모두</option>
			</select>
		</div>
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
		<button type="button" class="btn btn-default" id="searchBtn" >찾기</button>
		<button type="button" class="btn btn-default" id="newBtn" >새로운 글쓰기</button>
	</div>
	<br><br>

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
				<td><a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>
						${boardVO.title}</a></td>
				<td>${boardVO.writer}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
				<td><span class="badge bg-red">${boardVO.viewcnt}</span> </td>
			</tr>
		</c:forEach>
	</table>

	<!-- pagination -->
	<div class="box-footer">
		
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.cri.page == idx?'class =active':'' }" />>
						<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>					
					</li>					
				</c:forEach>
			
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
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
		
		$(document).ready(function(){
			$('#searchBtn').on(
				"click", function(event) {
				
					self.location = "list"
						+ "${pageMaker.makeQuery(1)}"
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();
			});
			$('#newBtn').on("click",function(evt) {
				self.location = "register";				
			});
		});
	</script>

</body>
</html>