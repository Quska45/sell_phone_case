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
	text-align: center;
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
.password_update_wrap {
	width: 555px;
	margin: 0 auto;
}
.password_update_inner {
	padding: 60px 0;
	border-bottom: 1px solid #e1e1e1;
	margin-bottom: 10px;
}
.password_update_content:last-child {
	margin-bottom: 0;
}
.password_update_content {
	width: 100%;
	margin: 0 auto 40px;
	position: relative;
}
.password_update_label {
	float: left;
	width: 125px;
	font-size: 15px;
	font-weight: bold;
	position: absolute;
	top: -32px;
	left: 0;
}
.password_update_input_wrap {
	float: left;
	width: 430px;
	position: absolute;
	top: -34px;
	left: 114px;
}
.password_update_input {
	width: 100%;
    	box-sizing: border-box;
	float: left;
	height: 40px;
	border: 1px solid #d5d5d5;
	font-size: 14px;
	line-height: 41px;
}
.password_update_input_div {
	float: left;
	width: 100%;
	padding-top: 15px;
	font-size: 14px;
}
.Old_Err_ck, .New_Err_ck, .New_Confirm_Err_ck {
	display: none;
}

</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var old_pw = $("#old_password").val();
	var new_pw = $("#new_password").val();
	var new_confirm_pw = $("#new_password_confirm").val();
	
	$("#old_password").blur(function(){
		if(old_pw == ""){
			$(".Old_Err_ck").text("현재 비밀번호가 입력되지 않았습니다.").css("display", "block").css("color", "red");
		} else if(old_pw != "") {
			$(".Old_Err_ck").text("현재 비밀번호가 입력되지 않았습니다.").css("display", "none");
		}
	});
	
	$("#new_password").blur(function(){
		if(new_pw == ""){
			$(".New_Err_ck").text("새 비밀번호가 입력되지 않았습니다.").css("display", "block").css("color", "red");
		} else if(new_pw != "") {
			$(".New_Err_ck").text("새 비밀번호가 입력되지 않았습니다.").css("display", "none");
		}
	});
	
	$("#new_password_confirm").blur(function(){
		if(new_confirm_pw == ""){
			$(".New_Confirm_Err_ck").text("새 비밀번호 확인이 입력되지 않았습니다.").css("display", "block").css("color", "red");
		} else if(new_confirm_pw != "") {
			$(".New_Confirm_Err_ck").text("새 비밀번호 확인이 입력되지 않았습니다.").css("display", "none");
		}
	});
});


$(document).on("click", ".password_update_ok_btn", function(){
	var new_pw = $("#new_password").val();
	var new_pw_confirm = $("#new_password_confirm").val();
	alert(old_pw + new_pw + new_pw_confirm);
	
	
	
	/* $.ajax({
		url: "loginajax.bizpoll",
		type: "POST",
		dataType :  "JSON",
		data: "id=" + lid + "&pw=" + lpw,
		success: (function(data){
			if(data.id != null && data.pw != null) {
				alert("로그인 성공");
				//index 페이지로 이동
				location.reload();
			} else {
				alert("로그인실패");
				$("#login_id").select();
				$("#ErrCk").css("display", "block");
				
			}
		}),
		error: function(){
			alert("system error");
		}
	}); */
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
				비밀번호 수정
				</h1>
				
				<div class="password_update_wrap">
					<div class="password_update_inner">
						<div class="password_update_content">
							<div class="password_update_label">현재비밀번호</div>
							<div class="password_update_input_wrap">
								<input type="password" class="password_update_input" id="old_password" name="old_password">
								<div class="password_update_input_div">현재 비밀번호를 입력하시오</div>
							</div>
						</div>
						<div class="Old_Err_ck"></div>
					</div>
					<div class="password_update_inner" style="border: none;">
						<div class="password_update_content">
							<div class="password_update_label">새 비밀번호</div>
							<div class="password_update_input_wrap">
								<input type="password" class="password_update_input" id="new_password" name="new_password">
								<div class="password_update_input_div">비밀번호는 8~15자리로 영문 대소문자, 숫자, 특수기호를 사용하세요.</div>
							</div>
						</div>
						<div class="New_Err_ck"></div>
					</div>
					<div class="password_update_inner">
						<div class="password_update_content">
							<div class="password_update_label">새 비밀번호 확인</div>
							<div class="password_update_input_wrap">
								<input type="password" class="password_update_input" id="new_password_confirm" name="new_password_confirm">
								<div class="password_update_input_div">변경할 비밀번호를 다시 한번 입력하십시오</div>
							</div>
						</div>
						<div class="New_Confirm_Err_ck"></div>
					</div>
					
				</div>
				
				<div class="password_update_btn_wrap" style="text-align: center; margin-top: 30px;">
					<a href="#" class="password_update_ok_btn">확인</a>
					<a href="#" class="password_update_cancel_btn">취소</a>
				</div>

			</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>