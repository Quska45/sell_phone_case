<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>   
<%@page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>

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
		var size = $("#replyviewsize").val();
		if(size.size() == 0){
			formObj.attr("action", "boarddelete.bizpoll");
			formObj.attr("method", "get");
			formObj.submit();
		} else {
			alert("댓글이 있는 글은 삭제 할 수 없습니다.");
		}
		
	}); 
	
	// 목록
	$(".btn-primary").on("click", function() {
		location.href = "boardlist.bizpoll";
	});
});

$(document).ready(function(){
	comment_list();
});

function comment_list(){
	var bno = ${boardview.bno};
	$.ajax({
		url: "commentlist.bizpoll",
		type: "POST",
		data: "bno=" + bno,
		success: function(result){
			$("#commentList").html(result);
		}
	});
};

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
				comment_list();
		}),
		error: function(){
			alert("system error");
		}
	});
	
});

$(document).on("click", "#reply_insert", function(){
	var name=$("#comment_name").val();
	var content = $("#comment_input_write").val();
	var bno = ${boardview.bno};
	alert(name + content + bno);
	$.ajax({
		url: "replyinsert.bizpoll",
		type: "POST",
		dataType :  "JSON",
		data: "content=" + content + "&bno=" + bno,
		success: (function(data){
			if(data.flag=="1"){
				alert("댓글 입력 실패");
			} else if(data.flag == "0") {
				alert("댓글 입력 성공");
				comment_list();
				$("#comment_input_write").val("");
			}
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
					
						<button type="submit" class="btn btn-warning">Modify</button>
						<button type="submit" class="btn btn-danger">Remove</button>
						<button type="submit" class="btn btn-primary">LIST ALL</button>
				</div>
				
				
				<div id="commentList"></div>
				
				<form action="replyinsert.bizpoll" name="replyinsert" method="POST">
					<input type="hidden" id="replyviewsize" name="replyviewsize" value="${replyview}">
			            	<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<div style="margin-top: 20px;"><a href="index.bizpoll">로그인</a>
							을 하셔야 댓글을 입력할 수 있습니다.</div>
						</c:when>
			            				<c:otherwise>
			              			<div id="comment_con">
								<span id="comment_writer">작성자</span>
								<input id="comment_name" name="comment_name" value="${sessionScope.loginUser.mname}">
								<span id="comment_date" style="float: right">작성일자</span>
								<textarea name="comment_input_write" id="comment_input_write" placeholder="댓글을 입력하세요" style="display: block; width:100%"></textarea>
								<input type="hidden" id="comment_input_bno" name="comment_input_bno" value="${boardview.bno}">
								<a id="reply_insert" name="reply_insert" href="#" replyinsert>댓글 등록</a>
							</div>		
						</c:otherwise>
					</c:choose>
				</form>
				
			</div>
		</div>
	</div>
</section>
<%@ include file="../include/footer.jsp" %>
