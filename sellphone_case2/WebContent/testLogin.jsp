<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	form{
		margin-top: 500px;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).on("click", "#testbtn", function(){
		var id = $("#testid").val();
		var pw = $("#testpw").val();
		
		$.ajax({
			url: "testlogin.bizpoll",
			type: "POST",
			dataType :  "JSON",
			data: "id=" + id + "&pw=" + pw,
			success: (function(data){
				if(data.flag == "1") {
					alert("로그인 성공");
					//index 페이지로 이동
					location.href="index.bizpoll";
				} else if(data.flag == "0") {
					alert("로그인실패");
					$("#testid").val("");
					$("#testpw").val("");
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
	<form action="testlogin.bizpoll" method="POST" name="frm_login" id="frm_login">
		<input type="text" id="testid" name="testid" placeholder="ID를 입력하세요">
		<input type="password" id="testpw" name="testpw" placeholder="PW를 입력하세요">
		<input type="button" id="testbtn" name="testbtn" value="로그인">
	</form>
</body>
</html>