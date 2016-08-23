<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}
</style>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=pageContext.getServletContext().getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<h2>Ajax Test Page</h2>
	
	<div>
		<div>
			REPLYER <input type="text" name="replyer" id="newReplyWriter" >
		</div>	
		<div>
			REPLY TEXT <input type="text" name="replytext" id="newReplyText" >
		</div>
		<button id="replyAddBtn" >ADD REPLY</button>
	</div>
	
	<div id="modDiv" style="display: none;" >
		<div class="modal-title" ></div> 
		<div>
			<input type="text" id="replytext" >
		</div>
		<div>
			<button type="button" id="replyModBtn" >수정</button>
			<button type="button" id="replyDelBtn" >삭제</button>
			<button type="button" id="closeBtn" >닫기</button>
		</div>
	</div>
	
	<ul id="replies">
	</ul>
	
	<ul class="pagination">
	</ul>
	
	<script src="/resources/jquery-3.1.0.min.js"></script>
	<script>
		var bno = 134;
		getPageList(1);
		
		function getAllList(){
		$.getJSON("/replies/all/" + bno, function(data){
			console.log(data.length)
			var str ="";
			
			$(data).each(
				function(){
					str += "<li data-rno='"+this.rno+"' class='replyLi'>"
					+ this.rno + ":" + this.replytext + 
					"<button>수정</button></li>";		
				});
			$("#replies").html(str);
		});
		}
		
		$("#replyAddBtn").on("click", function(){
			var replyer = $("#newReplyWriter").val();
			var replytext = $("#newReplyText").val();
			
			$.ajax({
				type : 'post',
				url : '/replies',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result) {
					if(result == 'SUCCESS') {
						alert("등록되었습니다.");
						getAllList();
					}
				}
			});
		});
		
		$("#replyDelBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type: 'delete',
				url: '/replies/' + rno,
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE"
				},
				dataType: 'text',
				success: function(result) {
					console.log("result: " + result);
					if(result == 'SUCCESS') {
						alert("삭제 되었습니다.");
						$("#modDiv").hide("slow");
						// getAllList();
						getPageList(replyPage);
					}
				}
			});
		});
		
		$("#replyModBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type: 'put',
				url: '/replies/' + rno,
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "PUT" },
					data:JSON.stringify({replytext:replytext}),
					dataType:'text',
					success:function(result){
						console.log("result: " + result);
						if(result == 'SUCCESS'){
							alert("수정 되었습니다.");
							$("#modDiv").hide("slow");
							// getAllList();
							getPageList(replyPage);
						}
				}});
		});
		
		$("#replies").on("click",".replyLi button", function(){
			var reply = $(this).parent();
			var rno = reply.attr("data-rno");
			var replytext = reply.text();
			
			// alert(rno + " : " + replytext);
			$(".modal-title").html(rno);
			$("#replytext").val(replytext);
			$("#modDiv").show("slow");
		});
		
		$("#closeBtn").on("click", function(){
			$("#modDiv").hide("slow");
		});
		
		function getPageList(page) {
			$.getJSON("/replies/" + bno + "/" + page, function(data){
				
				console.log(data.list.length);
				var str = "";
				
				$(data.list).each(function(){
					str += "<li data-rno='" +this.rno+"' class='replyLi'>"
					+this.rno +":" + this.replytext + 
					"<button>수정</button></li>";
				});
			
				$("#replies").html(str);
				printPaging(data.pageMaker);
			});
		}
		
		function printPaging(pageMaker){
			var str = "";
			
			if(pageMaker.prev){
				str += "<li><a href='"+(pageMaker.startPage-1) +"'> << </a></li>";
			}
			
			for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++) {
				var strClass = pageMaker.cri.page == i?'class=acitive':'';
				str += "<li " + strClass +"><a href='" +i+"'>" +i+"</a></li>";
			}
			
			if(pageMaker.next){
				str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
			}
			$('.pagination').html(str);
		}
		
		var replyPage = 1;
		$(".pagination").on("click", "li a", function(event){
			event.preventDefault();
			replyPage=$(this).attr("href");
			getPageList(replyPage);
		});
		
	</script>
</body>
</html>