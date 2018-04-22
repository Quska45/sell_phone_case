<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <%@page import="java.util.*"%>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>

    
<%@ include file="header.jsp" %>    



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 눌러서 들어간 페이지</title>
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
	margin-top: 400px;
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
		alert(writer + content + bno);
		
		
		$.ajax({
			url: "replyinsert.bizpoll",
			type: "POST",
			dataType :  "JSON",
			data: "content=" + content + "&bno=" + bno + "&writer=" + writer,
			success: (function(data){
				if(data.flag == "0") {
					alert("댓글 등록 성공");
					comment_list();
				} else if(data.flag == "1") {
					alert("댓글 등록 실패");
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
		alert(bno);
		
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
		
	});
	
</script>
</head>
<body>
	<div id="page1">
		<div id="page2">
			<div id="contents">
				<h1 id="main_title">공지사항</h1>
				<table class="tb1">
					<tbody>
						<tr>
							<td>
								<div id="bd_title">${boardview.title}</div>
								<div id="bd_date">${boardview.regdate}</div>
								<div id="bd_author">${boardview.writer}</div>
							</td>	
						</tr>
						<tr>
							<td>
								<div class="bd_con">
									<p>${boardview.contents}</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div>
						<c:choose>
							<c:when test="${boardview.writer == sessionScope.loginUser.mid}">
								<input id="bbp_bno" name="bbp_bno" type="hidden" value="${boardview.bno}">
								<a href="#" id="bbp_modify" name="bbp_modify">수정</a>
								<a href="#" id="bbp_delete" name="bbp_delete">삭제</a>
								<a href="#" id="bbp_list" name="bbp_list">목록</a>
							</c:when>
							<c:otherwise>
								<a href="#" id="bbp_list" name="bbp_list">목록</a>
							</c:otherwise>
						</c:choose>
				</div>
				
				<div class="reply_list" style="margin-top: 30px;">
					<div class="reply_item">
						<div style="margin-bottom: 15px;">댓글 수 : ${replycount}</div>
						
						<div id="commentList"></div>
						
						
						<!-- 댓글을 입력하는 부분이 있는 div -->
						<div>
							<form>
								<input type="hidden" id="reply_bno" name="reply_bno" value="${boardview.bno}">
								<input id="reply_writer" name="reply_writer" value="${boardview.writer}" readonly="readonly" style="width: 80px; text-align: center;">
								<div><textarea id="reply_con" name="reply_con" placeholder="댓글을 입력하세요"></textarea></div>
								<a href="#" id="comment_insert">입력</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<%@ include file="footer.jsp" %>

</html>