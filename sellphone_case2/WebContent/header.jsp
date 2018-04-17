<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>   
    
<% response.setHeader("Cache-Control", "no-store"); response.setHeader("Pragma", "no-cache"); %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', sans-serif;  */
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css); 
/* font-family: 'Jeju Gothic', sans-serif;  */
body, ul {
     /* 중복된 것은 컴마로 코드를 축소 시킬 수 있다. */
          margin: 0;
          padding: 0;
     }
     body {
          /* 가장 연한색 */
          background-color: #f5f6f7;
          min-width: 1080px; /* min max-width를 주는 것은 모니터 따라 해상도가 달라지기 때문에 고정된 width를 가지게 하기 위해서 이다. */
     }
     ul {
          list-style-type: none;
     }
     a {
     	text-decoration: none;
     }
     a:link, a:visited {
		color: inherit;/* 내 부모꺼를 상속받겠다는 것 */
		text-decoration: none;
	}
     #header {
     	width: 100%;
     	top: 0;
     	position: fixed;
     	padding-bottom: 42px;
     	background-color: #f5f6f7;
     	clear: both;
     	z-index: 30; /* 우선순위를 줘서 위로 올라오게 하는 것 */
     }
     #inner1 {
     /* 첫 번째 줄 */
          height: 26px;
          /* 가장 진한색 */
          background-color: white;
          box-sizing: border-box;
     }
     .inner {
     	padding: 0 110px;
     }
     #head_inner {
          max-width: 1200px; /* 어느 해상도의 pc든지 최대가 1200으로 고정되는 것이다. */
          height: 0 auto; /* 내 기준을 잡고 부모 안에서 가운데 정렬이 된다. */
          position: relative;
     }
     #link {
          width: 300px;
          display: inline-block; /* block속성은 유지하면서 양 옆의 여백은 먹지 않음. */
          position:relative;
     }
     #fafa {/* head_inner의 파파태그들 */
     	display: inline-block;
     	color: #282c37;
     	padding-left: 10px;
     }
     #link > a {
          color: #282c37;
          text-decoration: none;
          font-weight: bold;
          line-height: 26px; /* 부모 안에서 높이를 정렬 시켜준다. */
     }
     #member {
          list-style-type: none;
          float: right;
          font-size: 13px;
          line-height: 26px;
     }
     #member li {
          float: left;
          color: #FFFFFF;
     }
     #member li a{
          color: #282c37;
          text-decoration: none;
          padding: 0px 10px;
          font-weight: bold;
          height: 26px;
          display: inline-block; /* inline인 a태그는 상하의 개념이 없기 때문에 이렇게 해줘야 이쁘게 된다. */
     }
     #member li:hover {
          background-color: #9baec8;
     }
     #li_drop {
          position: relative;
     }
     #li_drop:hover #dropdown {
          display: block;
     }
     #dropdown {
          width: 118px;
          position: absolute;/* 부모위치에 맞게 들어감 */
          left: -10px; /* 부모를 기준으로 위치를 옮길 수 있음 */
          display: none;
     }
     #iphone8 {
          color : #f9d423!important; /* important가 들어간걸 가장 높은 우선순위에 둔다. */
     }
     #dropdown a:hover {
          text-decoration: underline;
     }
     #dropdown ul{
          list-style-type: none;
     }
     #dropdown ul li {
          width:118px;
          background-color: white;
     }
     #topArea {
     /* 두 번째 줄 */
          height: 220px;
          position: relative; /* line2_search의 위치를 잡아줌 */
          /* background-image: url(image/01.png);
          background-position: 50% 50%;
          background-repeat: no-repeat;
          background-size: 20% 60%; */
     }
     div#line2_search {
     	height: 34px;
     	display: inline-block;
     	float: right;
     	position: absolute; /* topArea랑 위치를 맞춤 */
     	right: 126px;
     	bottom: 5px;
     	
     }
     div#line2_wrap {
     	height: 34px;
     	border: 2px solid black;
     	box-sizing: border-box;
     }
     input#search_keyword {
     	width: 200px;
     	height: 30px;
     	font-size: 13px;
     	box-sizing: border-box;
     	display: block;
     	float: left;
     	border: 0px;
     	padding-left: 5px; 
     	font-family: 'Jeju Gothic', sans-serif;
     }
     input#search_btn {
     	font-size: 17px;
     	width: 55px;
     	height: 30px;
     	float: left;
     	background-color: #282c37;
     	color: white;
     	display: block;
     	border: 0px solid #282c37;
     	font-family: 'Jeju Gothic', sans-serif;
     }
     #search_btn:hover {
     	color: yellow;
     }
     
     #logo {
          width: 280px;
          height: 180px;
          display: block;
          margin: 20px auto;
          cursor: pointer;
          /* width를 무조건 줘야한다. 왜냐면 내 사이즈가 있어야 그것을 바탕으로 기준을 잡기 때문이다. 0은 위아래는 0을 주고 좌우는 오토로 가운데 오게해준다는 것임 */
     }
     
     #category {
     /* 세번째 줄 */
     	  width: 1500px;
          height: 40px;
          margin: 0 auto;
          color: white;
          background-color: black;
          padding: 0 75px;
          box-shadow: 0 4px 8px rgba(0,0,0,0.2),/* rgb인데 0.2는 검정색을 아주 옅게 준다는 것이다. */
          					/* x축간격/y축간격 */
          		0 6px 20px 0 rgba(0,0,0,0.19);
     }
     #head_inner {
          max-width: 1200px; /* 어느 해상도의 pc든지 최대가 1200으로 고정되는 것이다. */
          margin: 0 auto; /* 내 기준을 잡고 부모 안에서 가운데 정렬이 된다. */
          text-align: center;
          position:absolute;
          height: 35px;
     }
     #head_inner ul li:hover {
          background-color: black;
          border-top: 5px solid white;
          height: 35px;
          tran
     }
     .line3_li {
          float : left;
          list-style-type: none;
          height : 40px;
     }
     .line3_li > a {
          color: white;
          height: 35px;
          text-decoration: none;
          font-family: 'Jeju Gothic', sans-serif;
          padding: 0 15px;
          display: block;
          width: 80px;
          line-height: 40px;
     }
     .category_drop {
          display: none;
     }
     .category_drop a {
          display:block;
          font-weight: bold;
          text-decoration: none;
          margin: 0 auto;
          color: white;
          font-family: 'Jeju Gothic', sans-serif;
          text-align: center;
          line-height: 35px;
     }
     img.img_banner {
     	width: 300px;
     	padding: 0 40px;
     }
     #head_inner li:hover .category_drop{
          display: block;
          background-color: #343838;
     }
     .category_drop > a:hover {
          background-color: black;
     }
     
     
     
     
     
     
     /* 모달창 시작 */
     @import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css); 
	/* font-family: 'KoPub Batang', serif;  */
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css); 
	/* font-family: 'Jeju Gothic', sans-serif;  */
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
		position: relative;
		height: 39px;
		padding-top: 16px;
		border-bottom: 1px solid #dadada;
		overflow: hidden;/* 내용물이 넘치면 안보이게 하라는 것 */
	}
	h1 {
		float: left;
		margin-left: 25px;
		margin-top: 0;
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
		color: white;
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
		display: block;
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
		color: white;
	}
	#login_help a:hover {
		text-decoration: underline;
	}
	div.right { /* 계정찾기 */
		display: inline-block;
		position: absolute;
		right: 0;
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
     
     
     div#myModal {
     	background-color:white;
     	border: 1px solid red;
     	right: 35%;
     	z-index: 1000;
     	display: none;
     }
     .modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    padding-top: 100px; /* Location of the box */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0)!important; /* Fallback color */
	    background-color: rgba(0,0,0,0.4)!important; /* Black w/ opacity */
	}
	     
     .close {
     	position: absolute;
     	right: 0;
     	top: 0;
     	cursor: pointer;
     }
     /* 모달창 끝 */
     
     #stop_line {
     	color:black!important;
     }
     
</style>

<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#login").click(function(){
			$("#myModal").css("display", "block");
		});	
	
		$(".close").click(function(){
			$("#myModal").css("display", "none");
		})
	
	});
	
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
	
	$(document).on("click", "#logout", function(){
		$.ajax({
			url: "logout.bizpoll",
			type: "POST",
			dataType :  "JSON",
			success: function(data){
				if(data.flag=="1"){
					alert("로그아웃 성공");
					alert("data.flag" + data.flag);
					//index.bizpoll을 띄우라는 것이다.
					location.href="index.bizpoll";
				} else if(data.flag!="0"){
					alert("data.flag" + data.flag);
					alert("로그아웃 실패");
				}
			},
			error: function(){
				alert("system error");
			}	
		});
	});
	
	$(document).on("click", "#logo", function(){
		location.href="index.bizpoll";
	});
	
</script>
</head>
<body>
<div id="header_wrap">
<div id="myModal" class="modal"><!-- 모달 창시작 -->
     <div id="wrap"><!-- 컨텐ㅊ트 전체를 감싸는 div -->
	
		<div id="kakao_header"><!-- 말그대로 헤더 -->
		<span class="close">&times;</span>
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
						<form action="loginck.bizpoll" method="POST" id="login_form">
						<!-- 인풋에 있는 것을 자바로 보낼 때 form을 사용한다 -->
							<input class="idpw" type="text" name="login_id" id="login_id" placeholder="빈센트계정(이메일)"/>
							<!-- <a href="#" id="Qmark">?</a> -->
							<input class="idpw" type="password" name="login_pw" id="login_pw" placeholder="비밀번호(4~16자리)"/>
							<div id=ErrCk></div>
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
	</div><!-- 모달창 끝 -->
<div id="header">
	<!-- 첫번쨰줄 시작 -->
     <div id="inner1" class="inner">
     
          <div class="head_inner">
              <div id="link">
                   <a href="#">BOOKMARK+</a>
                   <div id="fafa">
			<i class="fa fa-facebook-official"></i>
			<i class="fa fa-twitter"></i>
			<i class="fa fa-youtube-square"></i>
              	   </div>
              </div>
              <ul id="member">
              
              <!-- when은 if otherwise는 else라고 생각하면 된다. -->
              	<c:choose>
              		<c:when test="${empty sessionScope.loginUser}">
				<li><a href="#" id="login">로그인</a></li>
				<li><a href="constract.bizpoll">회원가입</a></li>
              		</c:when>
              		<c:otherwise>
              			<li id="stop_line">${sessionScope.loginUser.mname}(${sessionScope.loginUser.mid})</li>
              			<li><a href="#" id="logout">로그아웃</a></li>
              		</c:otherwise>
              	</c:choose>
                   
                   <li id="li_drop">
                        <a href="boardlist2.bizpoll">마이페이지▼</a>
                        <div id="dropdown">
                             <ul>
                                  <li><a href="#">주문/배송조회</a></li>
                                  <li><a href="#">장바구니</a></li>
                                  <li><a href="#">위시리스트</a></li>
                                  <li><a href="#">쿠폰조회</a></li>
                             </ul>
                        </div>
                   </li>
                   <li><a href="boardlist.bizpoll">고객행복센터</a></li>
              </ul>
          </div>
     </div>
     <!-- 두번쨰줄 이미지 로고 -->
     <div id="topArea">
     	<div class="head_inner">
          <img src="image/case/vincent.png" id="logo">
          <div id="line2_search">
          	<div id="line2_wrap">
          		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어를 입력해주세요">
			<!-- name을 주는 이유는 인풋으로 입력받은 것을 자바에서 인식할 수 있도록 하는 것이다. -->
          		<!-- type은 입력받는 것을 text로 받는 다는 것이다. -->
          		<!-- placeholder는 검색창에 떠 있는 글자를 정할 수 있따. -->
          		<input id="search_btn" type="submit" value='검색'> 
          		<!-- value는 버튼에 들어갈 텍스트 -->
          	</div>
          </div>
        </div>
     </div>
     <!-- 세번쨰줄 내비기능 -->
     <div id="category" class="inner">
          <div id="head_inner">
              <ul>
                   <li class="line3_li"><a href="#" id="iphone8">iphone8</a>
                        <div class="category_drop">
                             <a href="#">범퍼케이스</a>
                             <a href="#">젤리케이스</a>
                             <a href="#">가죽케이스</a>
                             <a href="#">기능형케이스</a>
                        </div>
                   </li>
                   <li class="line3_li"><a href="#">iphone8+</a>
                        <div class="category_drop">
                             <a href="#">범퍼케이스</a>
                             <a href="#">젤리케이스</a>
                             <a href="#">가죽케이스</a>
                             <a href="#">기능형케이스</a>
                        </div>
                   </li>
                   <li class="line3_li"><a href="#">iphoneX</a>
                        <div class="category_drop">
                             <a href="#">범퍼케이스</a>
                             <a href="#">젤리케이스</a>
                             <a href="#">가죽케이스</a>
                             <a href="#">기능형케이스</a>
                        </div>
                   </li>
                   <li class="line3_li"><a href="#">galaxy8</a>
                        <div class="category_drop">
                             <a href="#">범퍼케이스</a>
                             <a href="#">젤리케이스</a>
                             <a href="#">가죽케이스</a>
                             <a href="#">기능형케이스</a>
                        </div>
                   </li>
                   <li class="line3_li"><a href="#">galaxy8+</a>
                        <div class="category_drop">
                             <a href="#">범퍼케이스</a>
                             <a href="#">젤리케이스</a>
                             <a href="#">가죽케이스</a>
                             <a href="#">기능형케이스</a>
                        </div>
                   </li>
                   <li class="line3_li" style="letter-spacing: -1px;"><a href="#">galaxy8노트</a>
                        <div class="category_drop">
                             <a href="#">범퍼케이스</a>
                             <a href="#">젤리케이스</a>
                             <a href="#">가죽케이스</a>
                             <a href="#">기능형케이스</a>
                        </div>
                   </li>
              </ul>
          </div>
     </div>
</div><!-- 헤더의 끝 -->
</div>
</body>
</html>