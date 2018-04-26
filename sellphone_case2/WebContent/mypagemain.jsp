<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ include file="header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', sans-serif;  */
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css); 
/* font-family: 'Jeju Gothic', sans-serif;  */
body, th, span, a, div {
	margin: 0;
	padding: 0;
	border: 0;
	font-family: 'Jeju Gothic', sans-serif;
}
tr {
	height: 40px;
	text-align: center;
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
}
#contents {
	padding: 40px;
	border: 1px solid grey;
	background: #ffffff;
}
#clearfix {
	background: url(image/password-protection-symbol-on-monitor-screen.png) center 90px no-repeat;
	background-size: 125px;
	text-align: center;
	height: 350px;
}
#select_category {
	background-color: #f5f5f5;
	border: 1px solid #d2d2d2;
	margin-bottom: 30px;
}
.category_attr {
	width: 182px;
	height: 64px;
	line-height: 64px;
	text-align: center;
	display: inline-block;
	border-left: 1px solid #d2d2d2; 
}
.category_attr a {
	width: 182px;
	height: 64px;
}
.category_attr:hover {
	background-color: grey;
}
.password_set {
	   margin-top: 230px;
    margin-left: 10px;
}

</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).on("click", "#mypage_password_confirm", function(){
	if(${sessionScope.loginUser.mpw} == $("#mypage_password").val()){
		location.href="mypageupdate.jsp";
	} else {
		$("#mypage_password_error").css("display", "block");
	}
});


</script>
</head>
<body>
	<div id="page1">
		<div id="page2">
			<div id="contents">
				<div id="select_category">
					<div class="category_attr">
						<a id="category1" href="#">개인정보수정</a>
					</div>
					<div class="category_attr">
						<a id="category2" href="#">비밀번호변경</a>
					</div>
				</div>
				<h1 id="mypage_title" style="display: block;">
				개인정보 수정
				</h1>
				<div id="clearfix">
					<div class="edit_tit" style="margin-top: 40px;">개인정보보호</div>
					<div class="edit_txt">
					회원 여러분의 개인정보보호를 위해 회원님의 정보를 다시 한번 입력 해주시기 바랍니다.
					</div>
					<div class="edit_content">
						<input class="password_set" type="password" id="mypage_password" name="mypage_password" style="width: 240px; height: 30px;">
						<a class="password_set" href="#" id="mypage_password_confirm" style="font-size: 20px;">확인</a>
						<div id="mypage_password_error" style="display: none; color: red;">비밀번호가 틀렸습니다.</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>