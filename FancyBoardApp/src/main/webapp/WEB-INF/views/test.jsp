<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head></head>
<body>
	<h2>Ajax Test Page</h2>
	
	<ul id="replies">
	</ul>
	
	<ul class="pagination">
	</ul>
	
	<script src="/resources/jquery-3.1.0.min.js"></script>
	<script>
		var bno = 134;
		$.getJSON("/replies/all/" + bno, function(data){
			console.log(data.length)
			var str ="";
			
			$(data).each(
				function(){
					str += "<li data-rno='"+this.rno+"' class='replyLi'>"
					+ this.rno + ":" + this.replytext + "</li>";		
				});
			$("#replies").html(str);
		});
	</script>
</body>
</html>