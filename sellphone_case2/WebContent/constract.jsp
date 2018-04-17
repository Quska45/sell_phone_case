<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 공통사항 시작 */
	body, h1, ul, p, h3 {
		margin: 0;
		padding: 0;
	}
	body {
		background-color: #f5f6f7;
	}
	h1#naver_logo {
		/* em은 기본 글자크기에 숫자만큼 배수증가 시켜준다. */
		font-size: 2em;
	}
	div#header, div#container, div#footer {
		width: 768px;
		margin: 0 auto;
		box-sizing: border-box;
	}
	div#header {
		height: 169px;
		padding-top: 30px;
		position: relative;
	}
	div#container {
		position: relative;
	}
	div#footer {
		height: 81px;
		text-align: center;
		padding: 30px 0px 15px 0px;
	}
	/* 공통사항 끝 */
	
	/* 로고 시작 */
	.n_logo {
		display: block;
		width: 240px;
		height: 80px;
		background: url('image/case/vincent.png');
		background-repeat: no-repeat;
		background-size: 200px 80px;
		margin: 0 auto;
		box-sizing: border-box;
	}
	div.lang {
		position: absolute;
		top: 14px;
		right: 0;
	}
	.lang > select {
		background: url('image/sel_arr.gif') 100% 50% no-repeat;
		/* 웹의 기본 값을 없애는 것이다. */
		-webkit-appearance: none;
		width: 98px;
		height: 30px;
		background-color: white;
	}
	select#langselect {
		font-size: 12px;
		font-weight: 400;
		height: 30px;
		padding: 6px 8px 5px 7px;
		min-width: 98px;
		color: #333;
		border: 1px solid #ccc;
	}
	option {
	pause: 0px 2px 1px;
	display: block;
	}
	/* 로고 끝 */
	
	/* container 시작 */
	form#join_content {
		width: 460px!important;
		margin: 0 auto!important;
	}
	.terms {
		margin-bottom: 20px;
		background-color: white;
		border: 1px solid #dadada;
	}
	.terms_span > input {
		position: absolute;
		right: 1px;
		top: 50%;
		width: 22px;
		height: 22px;
		margin-top: -11px;
		/* 체크박스 모양은 우리가 이미지를 지정해서 쓸거기 때문에 보이지 않도록 했다. */
		visibility: hidden;
	}
	.terms_span {
		position: relative;
		display: block;
		height: 58px;
	}
	.terms_p {
		display: block;
		padding: 15px;
		margin: 0;
		position: relative;
	}
	.terms_span > label {
		background: url('image/check_off.gif') 100% 50% no-repeat;
		display: block;
		line-height: 20px;
		height: 50px;
		top: -1px;
		font-size: 14px;
		font-weight: 700;
	}
	.terms_span > input:checked +label {
		background-image: url('image/check_on.gif');
	}
	
	/* terms_li1 */
	#terms_ul {
		padding-bottom: 7px;
		list-style: none;
	}
	#terms_ul_li1 {
		border-top: 1px solid #f0f0f0;
	}
	ul#terms_ul > li {
		display: block;
		padding: 13px 15px 7px;
	}
	.ul_li_span {
		position: relative;
		display: block;
		height: 24px;
	}
	.label1 {
		height: 24px;
		font-size: 14px;
		font-weight: 700;
		line-height: 24px;
		position: absolute;
		color: #333;
		top: 0px;
		left: 0px;
		width: 100%;
	}
	.span_only {
		color: #0d9900;
		font-size: 12px;
		font-weight: 400;
	}
	.ul_li_span > input {
		visibility: hidden;
		position: absolute;
		right: 1px;
		width: 22px;
		height: 22px;
		margin-top: -11px;
		top: 50%;
	}
	.ul_li_span > label {
		background: url('image/check_off.gif') 100% 50% no-repeat;
		display: block;
	}
	.ul_li_span > input:checked +label{
		background-image: url('image/check_on.gif');
	}
	.terms_box {
		position: relative;
		box-sizing: border-box;
		height: 88px;
		margin-top: 11px;
		padding: 8px 10px;
		border: 1px solid #f0f0f0;
		background-color: #f7f7f7;
		overflow: auto;
	}
	.article {
		margin-top: 0px;
	}
	h3.article_title {
		font-size: 12px;
		font-weight: 700;
		line-height: 16px;
		color: #666;
	}
	.article > p {
		display: block;
		font-size: 12px;
		line-height: 16px;
		color: #666;
	}
	.span_select {
		color: #969696;
		font-size: 12px;
		font-weight: 400;
	}
	.btn_double_area {
		margin: 30px -5px 0px;
		overflow: hidden;
	}
	.btn_double_area > span {
		display: block;
		float: left;
		width: 50%;
	}
	.btn_type {
		width: auto;
		margin: 0px 5px;
		font-size: 20px;
		font-weight: 600;
		line-height: 61px;
		display: block;
		box-sizing: border-box;
		height: 61px;
		text-align: center;
	}
	.btn_default {
		color: #333;
		border: 1px solid #e7e7e7;
		background-color: #fff;
	}
	.btn_agree {
		color: #fff;
		border: 1px solid #1fbc02;
		background-color: #1fbc02;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	.group_join {
		margin: 20px 0px 65px;
		text-align: center;
		color: #666;
		font-size: 12px;
	}
	.group_join > a {
		text-decoration: underline;
		color: #333;
	}
	/* container 끝 */
	
	/* footer의 시작 */
	/* div#footer {
		clear: both;
		padding: 30px 0 15px 0;
		text-align: center;
	}
	#footer ul {
		margin:  0 9px 0;
	}
	#footer * {
		font-size: 11px;
		font-style: normal;
		line-height: normal;
		list-style: none;
		color: #333; 
	}
	#footer ul li {
		font-size: 11px;
		position: relative;
		display: inline;
		
	}
	#footer ul li a:hover {
		color: #438a01;
		text-decoration: underline;
	}
	#footer div em {
		font: 9px verdana;
		padding-left: 4px;
		
	}
	#footer_line2 {
		margin-top: 5px;
	}
	#footer div .logo {
		top: 2px;
		margin-left: 1px;
		background: url(image/naver_logo.png) 0 0 no-repeat;
		background-size: 60px;
		position: relative;
		display: inline-block;
		width: 63px;
		height: 11px;
	}
	#footer div span {
		font: 9px/14px Verdana;
		padding-left: 2px;
	}
	#footer div a {
		color: #2db400;
		text-decoration: underline;
	}
	#footer div a {
		font: 700 9px Verdana;
	} */
	#footer * {
		font-size: 11px;
		line-height: normal;
		list-style: none;
		color: #333;
	}
	#footer > ul {
		margin: 0 auto 9px;
		text-align: center;
	}
	#footer > ul > li {
		display: inline;
		padding: 0 5px 0 7px;
		border-left: 1px solid #dadada;
	}
	#footer ul li:first-child {
		border-left: 0px!important;
	}
	#footer > ul > li a:hover {
		color: #1fbc02;
		text-decoration: underline;
	}
	#addr_logo {
		width: 63px;
		height: 11px;
	}
	#address {
		margin: 0px auto;
		text-align: center;
	}
	#address * {
		font: 9px verdana;
	}
	#address a {
		font-weight: bold;
	}
	#address a:hover {
		color: #1fbc02;
	}
	.must_check {
		display: none;
		color: red;
	}
	#err_check {
		display: none;
	}
	#err_check_msg {
		height: 24px;
		font-size: 11px;
		font-weight: 700;
		line-height: 24px;
		color: #f46665;
		padding: 0 15px;
		display: inline-block;
		width: 428px;
		text-align: center;
	}
	/* footer의 끝 */
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	//제이쿼리는 이벤트 단위로 실행되는 경우가 많아서 재사용하지 않기 때문에 콜백함수를 많이 사용한다.
		//클릭했을 때  이벤트가 발생되도록 한다.
		$("#cbox").on("click", function(){
			var cCheck = $("#cbox").is(":checked");
			if(cCheck == true) {
				$(".ckboxs").prop("checked", true);
			} else if (cCheck == false) {
				$(".ckboxs").prop("checked", false);
			}
		});
		//4개의 체크사항중 하나라도 체크가 안되면 모두 동의 체크가 해제되도록 한다.
		$(".ckboxs").on("click", function(){
			var ckLeng = $(".ckboxs:checkbox:checked").length;
			if(ckLeng!=4) {
				$("#cbox").prop("checked", false);
			} else if(ckLeng == 4) {
				$("#cbox").prop("checked", true);
			}
		});
		
		$(".btn_agree").on("click", function(){
			var filsu1 = $("#li1box").is(":checked");
			var filsu2 = $("#li2box").is(":checked");
			
			if(filsu1 == false || filsu2 == false) {
				$("#err_check").css("display", "block");
				return false;
			} else {
				alert("페이지 이동!")
				$("#join_content").submit();
			}
			
		});
	}); 
	
	/* $(document).ready(function(){
		$("#cbox").on("click", function(){
			var check = $("#cbox").is(":checked");
			alert($("#cbox").is(":checked"));
			if(check==true) {
				$("#li1box").prop("checked", true);
				$("#li2box").prop("checked", true);
				$("#li3box").prop("checked", true);
				$("#li4box").prop("checked", true);
			} else if(check==false) {
				$("#li1box").prop("checked", false);
				$("#li2box").prop("checked", false);
				$("#li3box").prop("checked", false);
				$("#li4box").prop("checked", false);
			}
		});
		$(".btn_agree").on("click", function(){
			var li1 = $("#li1box").is(":checked");
			var li2 = $("#li2box").is(":checked");
			if(li1 != true || li2 != true){
				alert("test");
				$(".must_check").css("display", "block");
			}
			if(li1 == true && li2 == true) {
				$(".must_check").css("display", "none");
			}	
		})
		if() {
			
		}
	}); */
</script>
</head>
<body>
	<!-- naver로고의 시작 -->
	<div id="header">
		<h1 id="naver_logo"><a href="#" class="n_logo"></a></h1>
		<div class="lang">
			<select id="langselect">
				<option>한국어</option>
				<option>English</option>
				<option>중국어</option>
			</select>
		</div>
	</div>
	<!-- naver로고의 Rmx -->
	
	
	<!-- 이용약관 시작 -->
	<div id="container">
		<form id="join_content" action="join.bizpoll" method="GET">
			<div class="terms">
				<p class="terms_p">
					<span class="terms_span">
						<input type="checkbox" id="cbox">
						<label for="cbox">
						이용약관, 개인정보 수집 및 이용,<br>
						위치정보 이용약관(선택), 프로모션 안내<br>
						메일 수신(선택)에 모두 동의합니다.
						</label>
					</span>
				</p>
				
				<ul id="terms_ul">
					<li id="terms_ul_li1">
						<span class="ul_li_span">
							<input type="checkbox" id="li1box" class="ckboxs">
							<label for="li1box" class="label1">
							빈센트 이용약관 동의<span class="span_only">(필수)</span>
							</label>
						</span>
						<div class="terms_box">
							<div class="article">
								<h3 class="article_title">제 1 조 (목적)</h3>
								<p>이 약관은 빈센트 주식회사 ("회사" 또는 "빈센트")가 제공하는 빈센트 <br>
								<p>및 빈센트 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, <br>
								<p>의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
								
								<h3 class="article_title">제 2 조 (정의)</h3>
								<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
								①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유<br>
								무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 빈센트 및 네이<br>
								버 관련 제반 서비스를 의미합니다.</p>
							</div>
						</div>
					</li>
					<li id="terms_ul_li2">
						<span class="ul_li_span">
							<input type="checkbox" id="li2box" class="ckboxs">
							<label for="li2box" class="label1">
							개인정보 수집 및 이용에 대한 안내<span class="span_only">(필수)</span>
							</label>
						</span>
						<div class="terms_box">
							<div class="article">
								<p>정보통신망법 규정에 따라 빈센트에 회원가입 신청하시는 분께 수집하는 <br>
								개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이<br>
								용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
								
								<h3 class="article_title">1. 수집하는 개인정보</h3>
								<p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네<br>
								이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘<br>
								린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위<br>
								해 회원가입을 할 경우, 빈센트는 서비스 이용을 위해 필요한 최소한의 <br>
								개인정보를 수집합니다</p>
							</div>
						</div>
					</li>
					<li id="terms_ul_li3">
						<span class="ul_li_span">
							<input type="checkbox" id="li3box" class="ckboxs">
							<label for="li3box" class="label1">
							위치정보 이용약관 동의<span class="span_only">(선택)</span>
							</label>
						</span>
						<div class="terms_box">
							<div class="article">
								<p>위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을<br>
								 포함하는 빈센트 위치기반 서비스를 이용할 수 있습니다.</p>
								
								<h3 class="article_title">제 1 조 (목적)</h3>
								<p>이 약관은 빈센트 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 <br>
								위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의<br>
								무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
							</div>
						</div>
					</li>
					<li id="terms_ul_li4">
						<span class="ul_li_span">
							<input type="checkbox" id="li4box" class="ckboxs">
							<label for="li4box" class="label1">
							이벤트 등 프로모션 알림 메일 수신<span class="span_only">(선택)</span>
							</label>
						</span>
						<span class="must_check">필수 사항 두가지에 동의해주세요.</span>
					</li>
				</ul>
			</div>
			
			<div id="err_check">
				<span id="err_check_msg">빈센트 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
			</div>
			<div class="btn_double_area">
				<span><a href="#" class="btn_type btn_default">비동의</a></span>
				<span><a href="join.bizpoll" class="btn_type btn_agree">동의</a></span>
			</div>
		</form>
		
		<div class="group_join">
			회사, 동아리 등 단체에서 사용할 ID가 필요하세요? <a href="#">단체 회원 가입</a>
		</div>
	</div>
	<!-- 이용약관 끝 -->
	
	
	<!-- footer의 시작 -->
	<div id="footer">
		<ul>
			<li><a href="#">이용약관</li>
			<li><strong><a href="#">개인정보처리방침</strong></li>
			<li><a href="#">책임의 한계와 법적고지</li>
			<li><a href="#">회원정보 고객센터</li>
		</ul>
		<!-- <div id="footer_line2">
			<em>
				<a href="#" target="_blank" class="logo">
					<span class="blind"></span>
				</a>
			</em>
			<em class="copy">Copyright</em>
			<em class="u_cri">@</em>
			<a href="#" class="u_cra">NAVER Corp.</a>
			<span class="all_r">All Rights Reserved.</span>
		</div> -->
		<div id="address">
			<span><a href="http://www.naver.com">
				<img src="image/naver_logo.png" id="addr_logo">
			</a></span>
			<span>Copyright</span>
			<span>ⓒ</span>
			<span>ALL Rights Reserved.</span>
		</div>
	</div>
	<!-- footer의 끝 -->
	
	
</body>
</html>