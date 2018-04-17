<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>   


<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	// 수정버튼 클릭
	$(".btn-warning").on("click", function() {
		formObj.attr("action", "boardupdateview.bizpoll");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	// 삭제
	$(".btn-danger").on("click", function() {
		formObj.attr("action", "boarddelete.bizpoll");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	// 목록
	$(".btn-primary").on("click", function() {
		location.href = "boardlist.bizpoll";
	});
});


$(document).on("click", ".reply_del", function(){
	var rno = $(this).attr("data_num");
	alert(rno);
	$.ajax({
		url: "replydelete.bizpoll",
		type: "POST",
		dataType :  "JSON",
		data: "rno=" + rno,
		success: (function(data){
				alert("댓글 삭제 성공");
				location.reload();
		}),
		error: function(){
			alert("system error");
		}
	});
	
});

</script>
<!-- Main Content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<!-- AdminLTE 제작한 box 속성 -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- form속성에 action을 지정하지 않으면 현재 경로를 그대로 action의 대상 경로로 설정 -->
				<form role="form" method="post">
					<input type="hidden" name="bno" id="bno" value="${boardview.bno}">
				</form>
				
				<div class="box-body">
					<div class="form-group">
						<label for="title">Title</label>
						<input type="text" id="title" name="title" class="form-control" value="${boardview.title}" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="content">Content</label>
						<textarea class="form-control" id="content" name="content" rows="3" cols="" readonly="readonly">${boardview.contents}</textarea>
					</div>
					<div class="forn-group">
						<label for="writer">Writer</label>
						<input type="text" id="writer" name="writer" class="form-control" value="${boardview.writer}" readonly="readonly" >
					</div>
				</div>
				
				<div>
					<c:if test="${sessionScope.loginUser.mname == boardview.writer}">
						<button type="submit" class="btn btn-warning">Modify</button>
						<button type="submit" class="btn btn-danger">Remove</button>
					</c:if>
						<button type="submit" class="btn btn-primary">LIST ALL</button>
				</div>
				
				
				<!-- 코멘트 시작 -->
				<div class="box-body" style="border-top: 3px solid black; margin-top: 20px;">
              				<div style="font-size: 20px; margin-bottom: 5px;">
              				댓글 
              					<span id="comment_count">${replycount}</span>
              				</div>
	              				
					<c:forEach items="${replyview}" var="replyview">
							<div style="margin-bottom: 30px;">
								<span id="comment_writer">${replyview.writer}</span>
								<c:if test="${sessionScope.loginUser.mname == replyview.writer}">
									<!-- data_num은 원래 정의되어 있는 속성이 아니라 ajax 에서 this를 이용해 값을 가져오기 위해 임의로 만든 것 -->
									<a href="#" type="button"  class="reply_del" data_num="${replyview.rno}">삭제</a>
									<%-- <input type="hidden" value="${replyview.rno}" id="input_rno" name="input_rno">
									<span><a href="#" id="reply_del" style="float:right; margin-left: 10px;">삭제</a></span> --%>
								</c:if>
								<span id="comment_date" style="float: right;">${replyview.regdate}</span>
								<textarea name="comment_input_content" id="comment_input_content" style="display: block; width:100%" readonly="readonly">${replyview.content}</textarea>
							</div>			
					</c:forEach>
						
					
					<form action="replyinsert.bizpoll" name="replyinsert" method="POST">
					<c:forEach items="${replyview}" var="replyview">
						<input type="hidden" id="comment_input_bno" name="comment_input_bno" value="${replyview.bno}">
					</c:forEach>
		              			<c:choose>
							<c:when test="${empty sessionScope.loginUser}">
								<div style="margin-top: 20px;"><a href="index.bizpoll">로그인</a>
								을 하셔야 댓글을 입력할 수 있습니다.</div>
							</c:when>
		              				<c:otherwise>
				              			<div id="comment_con">
									<span id="comment_writer">작성자</span>
									<span id="comment_name" name="comment_name">${sessionScope.loginUser.mname}</span>
									<span id="comment_date" style="float: right">작성일자</span>
									<textarea name="comment_input_write" id="comment_input_write" placeholder="댓글을 입력하세요" style="display: block; width:100%"></textarea>
									
									<input type="submit" value="댓글등록">
								</div>		
							</c:otherwise>
						</c:choose>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</section>
<%@ include file="../include/footer.jsp" %>
