<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 눌러서 들어간 페이지</title>
<style type="text/css">
body,th, span, a {
	margin: 0;
	padding: 0;
	border: 0;
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
</style>
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
								<div id="bd_title">첫 번째 게시글의 제목 입니다.</div>
								<div id="bd_date">2018-04-10</div>
								<div id="bd_author">변광진</div>
							</td>	
						</tr>
							<td>
								<div class="bd_con">
									<p>
									안녕하세요. 첫 번째 게시글입니다.
									</p>
								</div>
							</td>
						<tr>
							
						</tr>
					</tbody>
				</table>
				
				<div class="reply_list" style="margin-top: 30px;">
					<div class="reply_item">
						<div class="comment_list">
							<ul>	
								<li>
									<span>변광진</span>
									<span>2018-04-10</span>
									
								</li>
								<li>댓글 입니다.
								</li>
							</ul>
						</div>
						<textarea id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
						<a href="#" id="comment_insert">입력</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<%@ include file="footer.jsp" %>

</html>