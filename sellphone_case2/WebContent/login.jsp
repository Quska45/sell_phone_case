<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sellphone_case_login</title>
<link rel="icon" type="image/png" href="image/pabicon.png">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css); 
/* font-family: 'KoPub Batang', serif;  */
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css); 
/* font-family: 'Jeju Gothic', sans-serif;  */
	
	body, ul, h1 {
		margin: 0;
		padding: 0;
	}
	body {
		background-color: #f5f6f7;
	}
	ul {
		list-style-type: none;
	}
	a:link, a:visited {
		text-decoration: none;
		color: inherit;
	}
	div#wrap {/* 안에 들어가는 컴텐츠 전체를 감싸는 div */
		margin: 50px auto 0px;
		border: 1px solid #dadada;
		width: 464px;
		height: 850px;
	}
	div#kakao_header {
		height: 39px;
		padding-top: 16px;
		border-bottom: 1px solid #dadada;
		overflow: hidden;/* 내용물이 넘치면 안보이게 하라는 것 */
	}
	h1 {
		float: left;
		margin-left: 25px;
	}
	a#kakao_logo {
		float: left;
		height: 22px;
		margin-top: 2px;
		font-size: 18px;
		font-weight: normal;
		line-height: 20px;
		font-family: 'Jeju Gothic', sans-serif;
	}
	#kakao_logo > span {
		display: inline-block;
		margin: 8px 0px 0px;
	}
	#kakao_logo > img {
		width: 71px;
		height: 21px;
		float: left;
		margin-right: 10px;
	}
	ul.list_help {
		float: left;
		
	}
	ul.list_help > li {
		float: left;
		margin-right: 14px;
	}
	ul.list_help > li > a {
		color: #777;
		letter-spacing: -1px;/* 자간을 조정해줌 */
		font-size: 13px;
	}
	div#kakao_help {
		float: right;
		margin-top: 2px;
		margin-right: 11px;
	}
	ul.list_help {
		float: left;
	}
	ul.list_help > li{
		float: left;
	}
	.list_help > li:hover {
		text-decoration: underline;
	}
	div#kakao_content {/* 헤더아래 오는 녀셕들을 감싸는 div */
		margin: 10px auto;
		height: 400px;
		text-align: center;
	}
	div#login_content {/* kakao_content 안에 오는 div. 테두리 안을 의미함. */
		width: 270px;
		height: 394px;
		padding: 0 25px;
		border: 1px solid #dadada;
		text-align: left;
		display: inline-block;
	}
	div#login_area {
		width: 270px;
		height: 372px;
		position: relative;
	}
	div#subtitle {
		position: relative;
		height: 18px;
		margin: 22px auto 13px 0px;
	}
	#subtitle > img {
		width: 60px;
		height: 18px;
	}
	input.idpw {
		color: #333;
		letter-spacing: -1px;
		background-color: #f5f6f7;
		width: 240px;
		height: 22px;
		border: 1px solid #e5e5e5;
		border-radius: 5px;
		font-weight: normal;
		font-size: 13px;
		line-height: 22px;
		padding: 8px 12px;
		margin-bottom: 8px;
		/*outline: none; 인풋에 커서 줄 때 파란선 뜨는 걸 없애줌 */
	}
	form#login_form {
		position: relative;	
	}
	#login_form > a {
		position: absolute;
		width: 21px;
		text-align: center;
		border-radius: 70px;
		display: inline-block;
		right: 15px;
		top: 10px;
		background-color: #2b90d9;
		font-family: 'Jeju Gothic', sans-serif;
	}
	div#remember {
		margin: -1px 0 16px;
		
	}
	#remember > input {
		color: #333;
		margin: 3px 3px 3px 4px;
		vertical-align: middle;
	}
	#remember > label {
		font-size: 13px;
		letter-spacing: -1px;
		font-family: 'Jeju Gothic', sans-serif;
	}
	a#btn_login {/* 로그인 버튼 */
		display: inline-block; 
		background-color: #2b90d9;
		border: 1px solid #2b90d9;
		width: 268px;
		padding-top: 5px;
		line-height: 38px;
		text-align: center;
		border-radius: 5px;
		font-family: 'Jeju Gothic', sans-serif;
		box-shadow: 0 4px 8px rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
	}
	div#login_help { /* 맨 아래 회 원가입/계정 찾기 */
		width: 270px;
		position: absolute;
		bottom: 20px;
		padding-top: 10px;
		font-size: 12px;
		letter-spacing: -1px;
		border-top: 1px solid #cfcfcf;
	}
	#login_help > a{
		font-family: 'Jeju Gothic', sans-serif;
	}
	#login_help a {
		letter-spacing: -1px;
		color: #333;
	}
	#login_help a:hover {
		text-decoration: underline;
	}
	div.right { /* 계정찾기 */
		display: inline-block;
		position: absolute;
		right: 0;
	}
	.right > a {
		color: #777!important;
		/* 위에 앵커에 먹어있는 속성이 우선순위가 높아서 이게 안먹기 때문에 강제로 먹여ㅓㅆ다. */
	}
	span.right_bar {
		display: inline-block;
		width: 1px;
		height: 11px;
		background-color: #ccc;
		font-size: 11px;
		margin: 4px 1px 0 3px;
	}
	div#kakao_footer {/* 풋터 전체를 감쌈 */
		/* padding: 19px 30px 22px; /* 상 좌우 하 */ */
		border-top: 1px solid #d4d4d4;
		font-size: 12px;
		text-align: center;
		letter-spacing: -1px;	
	}
	#kakao_footer img{
		width: 100%;
		height: 100%;
	}
	#kakao_footer .link_info { /* 여러번 타고 들어갈 수록 우선순위가 높아진다. */
		display: inline-block;
		line-height: 22px;
		color: #898989;
	}
	#kakao_footer .link_info:hover {
		text-decoration: underline;
	}
	#footer_link .txt_bar {
		display: inline-block;
		width: 1px;
		height: 8px;
		margin: 4px 1px 0 3px;
		font-size: 11px;
		background-color: #ccc;
	}
	.util_cont {
		position: relative;
		display: inline-block;
		font-size: 12px;
		text-align: center;
		letter-spacing: -1px;
	}
	.btn_info {
		display: inline-block;
		padding: 0;
		margin-top: -2px;
		font-size: 12px;
		line-height: 22px;
		color: #898989;
		vertical-align: top;
		border: 0 none;
		background-color: transparent;
		cursor: pointer;
	}
	#btn_semo {
		display: inline-block;
		font-size: 1px;
		position: absolute;
		top: 0px;
		right: -10px;
	}
	.link_kakao {
		text-decoration: underline;
	}
	#footer_info {
		margin-top: 5px;
	}
	.txt_copyright {
		font-size: 12px;
		color: #919191;
	}
	#ErrCk {
		display: none;
		color:red;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">

	/* $(document).on("click", "#btn_login", function(){
		var id = $("#login_id").val();
		var pw = $("#login_pw").val();
		var flag=0;
		
		if(id == "") {
			$("#ErrCk").text("ID, PW를 올바르게 입력하세요./").css("display", "block");
			$("#login_id").focus();
			return false;
		} else if(pw == "") {
			$("#ErrCk").css("display", "block");
			$("#login_pw").focus();
			return false;
		} else if(id != "" && pw != "") {
			$("#ErrCk").css("display", "none");
			$.ajax({
				url: "loginck.bizpoll",
				type: "POST",
				dataType: "json",
				data: "id=" + id + "&pw=" + pw, //쿼리스트링이기 때문엔 &가 들어가야 한다.
				success: function(data) {
					if(data.flag == "0") {
						$("#ErrCk").css("display", "block");
						return false;
					} else {
						$("#ErrCk").css("display", "none");
						$("#login_index").submit();
					}
				},
					error: function() {
						alert("System Error!!!");
					}
			});
		}
		
	}); */



 //아이디중복체크를 ajax로 해보기 시작	
	// 아이디 중복체크
	$(document).on("click", "#btn_login", function(){
		var id = $("#login_id");
		var pw = $("#login_pw");
		
		var lid = id.val();
		
		if(lid == "") {
			$("#ErrCk").text("ID값을 입력하시오").css("display", "block").css("color", "red");
			id.focus();
			return false;
		}
		
		var lpw = pw.val();
		
		if(lpw == "") {
			$("#ErrCk").text("PW값을 입력하시오").css("display", "block").css("color", "red");
			pw.focus();
			return false;
		}
		
		$.ajax({
			url: "loginajax.bizpoll",
			type: "POST",
			dataType :  "JSON",
			data: "id=" + lid + "&pw=" + lpw,
			success: (function(data){
				if(data.flag == "1") {
					alert("로그인 성공");
					//index 페이지로 이동
					$("#login_form").submit();
				} else if(data.flag == "0") {
					alert("로그인실패");
					$("#login_id").select();
					$("#ErrCk").css("display", "block");
					
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
	<div id="wrap"><!-- 컨텐ㅊ트 전체를 감싸는 div -->
		<div id="kakao_header"><!-- 말그대로 헤더 -->
			<h1><!-- 더 크게 만들어 준다. -->
				<a id="kakao_logo" href="#">
					<img src="image/case/vincent.png">
					<span>로그인</span>
				</a>
			</h1>
			<div id="kakao_help">
				<ul class="list_help">
					<li><a href="#">도움말</a></li>
					<li><a href="#">문의하기</a></li>
				</ul>
			</div>
		</div>
		<div id="kakao_content"><!-- 헤더아래 들어오는 녀석들 -->
			<div id="login_content">
				<div id="login_area">
					<div id="subtitle">
						<img src="image/case/vincent.png">
					</div>
					<div id="container">
						<form action="loginck.bizpoll" name="frm_login" method="post" id="login_form">
						<!-- 인풋에 있는 것을 자바로 보낼 때 form을 사용한다 -->
							<input class="idpw" type="text" name="login_id" id="login_id" placeholder="빈센트계정(이메일)"/>
							
							<a href="#" id="Qmark">?</a>
							<input class="idpw" type="password" name="login_pw" id="login_pw" placeholder="비밀번호(4~16자리)"/>
							<div id="ErrCk">ID 또는 PW가 잘못 됐습니다.</div>
						</form>
							<div id="remember">
								<input type="checkbox" name="remember" id="remember2">
								<label for="remember">빈센트계정 저장</label>
							</div>
							
							<a href="#" id="btn_login">
								<!-- <img alt="로그인" src="image/login.png">이미지에 마우스대면 먼지 나옴 -->
								로그인
							</a>
					</div>
					<div id="login_help">
						<a href="#">회원가입</a>
						<div class="right">
							<a href="#">빈센트계정 찾기</a>
							<span class="right_bar"></span>
							<a href="#">빈센트계정 찾기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="kakao_footer">
			<img src="image/star.jpg">
			<!-- <div id="footer_link">
				<a href="#" class="link_info">공지사항</a>
				<span class="txt_bar"></span>
				<a href="#" class="link_info">이용약관</a>
				<span class="txt_bar"></span>
				<a href="#" class="link_info">개인정보 처리방침</a>
				<span class="txt_bar"></span>
				<a href="#" class="link_info">운영정책</a>
				<span class="txt_bar"></span>
				<span class="util_cont">
				</span>
			</div>
			<div id="footer_info">
				
				<small class="txt_copyright">
					Copyright ⓒ
					<a href="#" class="link_kakao">Vincent Corp.</a>
				</small>
			</div> -->
		</div>
	</div>
</body>
</html>

<!-- el태그를 사용해야 하는데 jquery로 해버리면 둘이 충돌해 버린다. 따라서 스크립트로 짜준다.
flag값을 받아와서 로그인이 안되면 에러메세지를 띄워준다.
<script type="text/javascript">
	window.onload = function() {
		var code = ${flag};
		if(code == 0) {
			document.getElementById("ErrCk").display = "block";
		}
	}
</script> -->

