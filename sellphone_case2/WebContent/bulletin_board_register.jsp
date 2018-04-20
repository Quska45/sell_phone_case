<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	background-color: #ffffff;
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
.tb1 th, .tb1 td {
	text-align: left;
	border-bottom: 1px solid #d5d8dc;
	height: 29px;
	line-height: 24px;
}

.tb_tit {
	padding: 10px;
	font-size: 16px;
	border-bottom: 1px solid #e5e5e5;
	line-height: 25px;
	
}

#bbp_title {
	float: left;
	height: 40px;
	border: 1px solid #d5d5d5;
	font-size: 14px;
	box-sizing: border-box;
	line-height: 41px;
	width: 100%;
}

#bbp_content {
	float: left;
	height: 188px;
	border: 1px solid #d5d5d5;
	font-size: 14px;
	box-sizing: border-box;
	line-height: 41px;
	width: 100%;
}

#bbp_writer {
	float: left;
	height: 40px;
	border: 1px solid #d5d5d5;
	font-size: 14px;
	box-sizing: border-box;
	line-height: 41px;
	width: 50%;
}

.allButton a {
	text-align: center;
	border: 1px solid black;
	padding: 5px;
}

.allButton {
	margin-top: 30px;
}

</style>
<script src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).on("click", ".bbr_submit", function(){
	alert("글쓰기 버튼 잘 눌림");
	$("#bbp_frm").submit();
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
						<form name="bbp_frm" id="bbp_frm" action="boardinsertsave2.bizpoll" method="post">
							<tr>
								<th>Title</th>
								<td class="tb_tit">
								 	<input type="text" id="bbp_title" name="bbp_title" placeholder="제목을 입력하세요.">
								</td>
							</tr>
							
							<tr>
								<th>Content</th>
								<td class="tb_tit">
									<textArea type="text" id="bbp_content" name="bbp_content" placeholder="내용을 입력하세요."></textArea>
								</td>
							</tr>
							
							<tr>
								<th>Writer</th>
								<td class="tb_tit">
									<input type="text" id="bbp_writer" name="bbp_writer" value="${sessionScope.loginUser.mid}">
								</td>
							</tr>
						</form>
					</tbody>
				</table>
				<div class="allButton">
					<a class="bbr_submit" href="#">등록</a>
				</div>
			</div>
		</div>
	</div>




</body>

<%@ include file="footer.jsp" %>
</html>