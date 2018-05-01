<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <%@page import="java.util.*"%>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>   
    
<%@ include file="header.jsp" %>    



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 눌러서 들어간 페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', sans-serif;  */
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css); 
/* font-family: 'Jeju Gothic', sans-serif;  */
body,th, span, a {
	margin: 0;
	padding: 0;
	border: 0;
	font-family: 'Jeju Gothic', sans-serif;
}

table {
	border-collapse: collapse;
}
a {
	text-decoration: none;
}
#page1 {
	margin-top: 150px;
}
#page2 {
	width: 1100px;
	margin: 0 auto;
	border: 1px solid black;
	margin-bottom: 50px;
}
#contents {
	padding: 40px;
	border: 1px solid grey;
	background: #ffffff;
}
#main_title {
	font-size: 24px;
	margin-bottom: 30px;
}
.tb1 {
	width: 100%;
	border-top: 2px solid #92a0a3;
	border-bottom: 2px solid #9ea0a3;
}
.tb1 td {
	height: 29px;
	line-height: 24px;
	font-size: 14px;
	border-bottom: 1px solid #d5d8dc;
}
#bd_title{
	font-size: 16px;
	display: inline-block;
}
#bd_date, #bd_author {
	display: inline-block;
	float: right;
	color: #bbbbbb;
	margin-left: 15px;
}
.reply_item {
	border: 1px solid #cacaca;
	padding: 20px;
	line-height: 24px;
	position: relative;
}
#comment {
	display: block;
	width: 100%;
	height: 102px;
	padding: 13px 15px 10px;
	border: 1px solid #eee;
	font-size: 12px;
	resize: none;
	box-sizing: border-box;
	
}
#comment_name, #comment_pw {
	width: 120px;
	height: 36px;
	padding: 0 15px;
	border: 1px solid #eee;
	font-size: 12px;
	box-sizing: border-box;
}
#comment_insert {
	display:block;
	text-align: center;
	background-color: grey;
	cursor: pointer;
	line-height: 36px;
	height: 36px;
	width: 60px;
	border: 1px solid black;
	margin-top: 15px;
}
#comment_insert:hover {
	background-color: #cacaca;
}
.comment_list {
	border: 1px solid #cacaca;
	margin-bottom: 20px;
}
.comment_list ul {
	margin: 0;
	padding: 0;
	list-style: 
}
.comment_list ul {
	border-bottom: 1px solid #F0F0F0;
	margin: 0 0 7px 0;
	padding: 15px 15px 22px;
}
.comment_list ul li span {
	display: inline-block;
	font-size: 14px;
	color: #bbbbbb;
}
#reply_con {
	width: 100%;
    height: 80px;
    margin-top: 15px;
}


</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	//댓글을 띄워 주는 부분이 완전한 ajax가 되게 하기 위한 ajax
	$(document).ready(function(){
		comment_list();
	});
	
	function comment_list(){
		var bno = ${boardview.bno};
		
		$.ajax({
			url: "commentlist2.bizpoll",
			type: "POST",
			data: "bno=" + bno,
			//result는 bizpoll을 타서 진행 됐던 작업들의 결과 이다.(commentlist2.jsp)
			success: (function(result){
				$("#commentList").html(result);
			})
		});
	}
	
	//댓글 삭제 버튼을 클릭하면 댓글이 삭제되도록 하는 ajax
	$(document).on("click", ".relpy_del", function(){
		var rno = $(this).attr("data_num");
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
	
	//댓글에서 입력 버튼을 클릭하면 댓글이 등록 되도록하는 ajax
	$(document).on("click", "#comment_insert", function(){
		var writer = $("#reply_writer").val();
		var content = $("#reply_con").val();
		var bno = $("#reply_bno").val();
		
		
		$.ajax({
			url: "replyinsert.bizpoll",
			type: "POST",
			dataType :  "JSON",
			data: "content=" + content + "&bno=" + bno + "&writer=" + writer,
			success: (function(data){
				if(data.flag == "0") {
					$("#reply_con").val("");
					comment_list();
				} else if(data.flag == "1") {
					comment_list();
				}
			}),
			error: function(){
				alert("system error");
			}
		});
	});
	
	//게시글 삭제를 클릭하면 bno를 액션으로 보내고 게시글을 삭제한 후 게시글 리스트로 이동하게 한다.
	$(document).on("click", "#bbp_delete", function(){
		var bno = ${boardview.bno};
		var replycount = ${replycount};
		
		if(replycount != 0){
			alert("댓글이 있는 글은 삭제할 수 없습니다.");
			location.reload();
		} else if(replycount == 0) {
			$.ajax({
				url: "boarddelete2.bizpoll",
				type: "POST",
				dataType :  "JSON",
				data: "bno=" + bno,
				success: (function(data){
					if(data.result > "0") {
						location.href="boardlist2.bizpoll";
					} else{
						location.href="boarddetail2.bizpoll?bno="+bno;
					}
				}),
				error: function(){
					alert("system error");
				}
			});
		}
	});
	
	
	//좋아요를 누르면 좋아요가 하나 씩 늘어남
	$(document).on("click", "#bbp_favorite", function(){
		var bno = ${boardview.bno};
		$.ajax({
			url: "boardfavorite.bizpoll",
			type: "POST",
			dataType :  "JSON",
			data: "bno=" + bno,
			success: (function(data){
				if(data.favoritecount > 0) {
					location.reload();
				} else {
					alert("좋아요는 24시간에 한 번 추가 할 수 있습니다.");
				}
			}),
			error: function(){
				alert("system error");
			}
		});
	});
	
	//로그인이 되어 있지 않은 상태에
	$(document).on("click", "#bbp_answer_null", function(){
		alert("로그인 하시면 댓글을 달 수 있습니다.");
	});
	
	//로그인을 누를 때 로그인 모달 창이 뜨게 한다.
	$(document).ready(function(){
		$("#bbp_login").click(function(){
			$("#myModal").css("display", "block");
		});	
	
		$(".close").click(function(){
			$("#myModal").css("display", "none");
		})
	
	});
	
</script>
</head>
<body>
	<div id="page1">
		<div id="page2">
			<div id="contents">
				<h1 id="main_title">자유게시판</h1>
				<table class="tb1">
					<tbody>
						<tr>
							<td>
								<div id="bd_title">제목 : ${boardview.title}</div>
								<div id="bd_date">${boardview.regdate}</div>
								<div id="bd_author">${boardview.writer}</div>
							</td>	
						</tr>
						<tr>
							<td>
								<spqn>첨부파일 : 
									<c:if test="${boardview.filename != null}">
										<strong><a id="add_file" href="download.bizpoll?bno=${boardview.bno}">${boardview.filename}</a></strong>
									</c:if>
								</span>
								
								<span>${boardview.downcnt}</span>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="bd_con">
									<p>내용 : ${boardview.contents}</p>
								</div>
							</td>
						</tr>
						
					</tbody>
				</table>
				
				<div>
					<c:if test="${boardview.writer == sessionScope.loginUser.mid}">
						<a href="#" id="bbp_modify" name="bbp_modify">수정</a>
						<a href="#" id="bbp_delete" name="bbp_delete">삭제</a>
					</c:if>
					<a href="boardlist2.bizpoll" id="bbp_list" name="bbp_list">목록</a>
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<a href="#" id="bbp_answer_null" name="bbp_answer_null">답변</a>
						</c:when>
						<c:otherwise>
							<a href="answer.bizpoll?bno=${boardview.bno}" id="bbp_answer" name="bbp_answer">답변</a>
						</c:otherwise>
					</c:choose>
					<a href="#" id="bbp_favorite" name="bbp_favorite">좋아요<i class="fa fa-thumbs-o-up"></i></a>
					<span>${replycount}</span>
				</div>
				
				<div class="reply_list" style="margin-top: 30px;">
					<div class="reply_item">
						
						<div id="commentList"></div>
						 
						
						<!-- 댓글을 입력하는 부분이 있는 div -->
						<div>
								<input type="hidden" id="reply_bno" name="reply_bno" value="${boardview.bno}">
								<c:choose>
									<c:when test="${sessionScope.loginUser.mid != null}">
										<input id="reply_writer" name="reply_writer" value="${sessionScope.loginUser.mid}" readonly="readonly" style="width: 80px; text-align: center;">
										<div><textarea id="reply_con" name="reply_con" placeholder="댓글을 입력하세요"></textarea></div>
										<button id="comment_insert">입력</button>
									</c:when>
									<c:otherwise>
										<a id="bbp_login" href="#" style="color: blue;">로그인</a>을 하시면 댓글을 작성할 수 있습니다.
									</c:otherwise>
								</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<%@ include file="footer.jsp" %>

</html>