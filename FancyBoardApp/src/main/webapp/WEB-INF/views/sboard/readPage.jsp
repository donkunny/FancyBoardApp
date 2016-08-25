<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<%=pageContext.getServletContext().getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="box-title">READ BOARD</h3>
	</div>

	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="bno" value="${boardVO.bno}"> 
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<input type="hidden" name="searchType" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
	</form>

	<div class="panel-body">
	<div class="form-group">
		<label for="exampleInputEmail1">제목</label> 
		<input type="text" name='title' class="form-control" value="${boardVO.title}" readonly="readonly">
	</div>
	
	<div class="form-group">
		<label for="exampleInputPassword1">내용</label>
		<textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO.content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">Writer</label> 
		<input type="text" name="writer" class="form-control" value="${boardVO.writer}" readonly="readonly">
	</div>
	</div>
	
	<div class="panel-footer">
		<button type="submit" class="btn btn-warning" id="modifyList" >수정</button>
    	<button type="submit" class="btn btn-danger" id="deleteList">제거</button>
    	<button type="submit" class="btn btn-primary" id="combackList">리스트로 돌아가기</button>
	</div>
	</div>
	
	<br />
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default" >
				<div class="panel-heading">
					<h4 class="box-title">댓글 작성하기</h4>
				</div>
				<div class="panel-body" >
					<label for="exampleInputEmail1" >작성자</label>
					<input class="form-control" type="text" placeholder="사용자 이름"  id="newReplyWriter" required="required" >
					
					<label for="exampleInputEmail1" >댓글내용</label>
					<input class="form-control" type="text" placeholder="내용을 작성하세요..."  id="newReplyText" required="required" >
				</div>
				
				<div class="panel-footer"> 
					<button type="submit" class="btn btn-primary" id="replyAddBtn">등록</button>
				</div>
			</div>

			<!-- 댓글 리스트 펼치기 part -->
			<ul class="list-group" >
				<button class="btn btn-primary" id="repliesDiv" >
				<span class="bg-green">
				댓글 리스트 펼치기 <small id="replycntSmall">[ ${boardVO.replycnt} ]</small>  
				</span></button>
				<!-- <button class="btn btn-primary" id="repliesDiv" >댓글 리스트 펼치기</button>  -->
			</ul>
			
			<div class="text-center" >
				<ul id="pagination" class="pagination pagination-sm no-margin" ></ul>
			</div>
		</div>
	</div>

	<!-- Modal for modify -->
	<div id="modifyModal" class="modal fade" role="dialog" >
		<div class="modal-dialog">

			<!-- modal-content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p><input type="text" id="replytext" class="form-control"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
				</div>
			</div>
		</div>
	</div>
	
	<script src="<%=pageContext.getServletContext().getContextPath()%>/resources/jquery-3.1.0.min.js"></script>
	<script src="<%=pageContext.getServletContext().getContextPath()%>/resources/bootstrap/js/bootstrap.js" ></script>
	<script src="<%=pageContext.getServletContext().getContextPath()%>/resources/handlebars-v4.0.5.js"></script>
	<script type="text/x-handlebars-template" id="template" >
		{{#each .}}
		<li class="replyLi" data-rno={{rno}} >
			<!-- <i class="fa fa-comments bg-blue"></i> -->
			<div class="row">
				<div class="col-sm-4">
					<h5 class="panel-header" >No. <strong>{{rno}}</strong> 작성자: {{replyer}}</h5>
				</div>
				<div class="col-sm-8" align="right">
					<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-body">{{replytext}}</div>
				<div class="panel-footer">
					<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">수정</button>
				</div>			
			</div>
		</li>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year+"/"+month+"/"+date;
		});
		
		var printData = function(replyArr, target, templateObject){
			var template = Handlebars.compile(templateObject.html());
			
			var html = template(replyArr);
			$(".replyLi").remove();
			target.after(html);
		}
		
		var bno = ${boardVO.bno};
		var replyPage = 1;
		
		function getPage(pageInfo){
			$.getJSON(pageInfo, function(data){
				printData(data.list, $("#repliesDiv"), $('#template'));
				printPaging(data.pageMaker, $(".pagination"));
				
				$("#modifyModal").modal('hide');
				$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");
			});
		}
		
		var printPaging = function(pageMaker, target) {
			var str = "";
			if(pageMaker.prev){
				str += "<li><a href='" + (pageMaker.startPage - 1) +"'> << </a></li>";
			}
			
			for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
				var strClass = pageMaker.cri.page == i? 'class=active':'';
				str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
			}
			
			if(pageMaker.next){
				str += "<li><a href='" +(pageMaker.endPage + 1) + "'> >> </a></li>";
			}
			
			target.html(str);
		};
		
		$("#repliesDiv").on("click", function(){
			/*
 			if($(".timeline li").size() > 1){
				return;
			} 
			*/
			getPage("<%=pageContext.getServletContext().getContextPath()%>/replies/" + bno + "/1");
		});
		
		$(".pagination").on("click", "li a", function(event){
			
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPage("/replies/" + bno + "/" + replyPage);
		});
		
		$(".list-group").on("click", ".replyLi", function(event){
			var reply = $(this);
			$("#replytext").val(reply.find('.panel-body').text());
			$(".modal-title").html(reply.attr("data-rno"));
			// console.log(reply.find('.panel-body').text() + reply.attr("data-rno"));
		});
		
		$("#replyAddBtn").on("click", function(){
			var replyerObj  = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var replyer = replyerObj.val();
			var replytext = replytextObj.val();
			// console.log(bno);
			
			$.ajax({
				type: 'post',
				url: '<%=pageContext.getServletContext().getContextPath()%>/replies/',
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "POST"
				},
				dataType: 'text',
				data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("<%=pageContext.getServletContext().getContextPath()%>/replies/" + bno + "/" + replyPage);
						replyerObj.val("");
						replytextObj.val("");
					}
			}});
		});
		
		
		$("#replyModBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type: 'put',
				url: '<%=pageContext.getServletContext().getContextPath()%>/replies/' + rno,
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}),
				dataType: 'text',
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("<%=pageContext.getServletContext().getContextPath()%>/replies/" +  bno + "/" + replyPage);
					}
				}
			});
			$('#modifyModal').modal('hide'); // for hiding it after modifying text
		});
		
		$("#replyDelBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type: 'delete',
				url: '<%=pageContext.getServletContext().getContextPath()%>/replies/' + rno,
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE" },
				dataType:'text',
				success:function(result) {
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제되었습니다.");
						getPage("<%=pageContext.getServletContext().getContextPath()%>/replies/" + bno + "/" + replyPage);
					}
				}
			});
			$('#modifyModal').modal('hide'); // for hiding it after modifying text
		});
		
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$("#modifyList").on("click", function() {
				formObj.attr("action", "<%=pageContext.getServletContext().getContextPath()%>/sboard/modifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$("#deleteList").on("click", function() {
				formObj.attr("action", "<%=pageContext.getServletContext().getContextPath()%>/sboard/removePage");
				formObj.submit();
			});

			$("#combackList").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "<%=pageContext.getServletContext().getContextPath()%>/sboard/list");
				formObj.submit();
			});

		});
	</script>
	
</body>
</html>