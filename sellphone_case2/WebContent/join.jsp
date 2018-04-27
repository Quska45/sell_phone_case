<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css); 
/* font-family: 'KoPub Batang', serif;*/
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css); 
/* font-family: 'Jeju Gothic', sans-serif;  */
       
       /* 공통 사항 시작*/
       body, ul, h1, form {
              margin: 0;
              padding: 0;
       }
       body {
              position: relative;
              background: #f5f6f7;
              width: 100%;
              height: 100%;
              font-family: 'Jeju Gothic', sans-serif;
       }
       ul {
              text-decoration: none;
       }
       div#header, #container, #footer {
              position: relative;
              width: 768px;
              min-width: 460px;
              margin: 0 auto;
       }
       div.bir_dd, .bir_mm, .bir_yy {
              display: table-cell;
              width: 114px;
              padding: 11px 0 11px 16px;
              table-layout: fixed;
              vertical-align: middle;
       }
       /* 공통사항 끝 */
       
       
       /* 헤더의 시작 */
       
              /* 네이버 로고의 시작 */
              div#header {
                     box-sizing: border-box;
                     height: 169px;
                     padding: 62px 0 0;
                     margin-bottom: 70px
              }
              a.h_logo {
                     line-height: 999px;
                     display: block;
                     overflow: hidden;
                     width: 240px;
                     height: 44px;
                     margin: 0 auto;
                     position: relaive;
              }
              a.h_logo img{
                     position: absolute;
                     top:50px;
                     left: 250px;
                     width: 300px;
                     display: block;
              }
              /* 네이버 로고의 끝 */
              
       /* 헤더의 끝 */
       
       /* container 시작 */
              /* 아이디, 비밀번호 입력 시작*/
              div#container {
                     max-width: 768px;
              }
              div.join_content {
                     width: 460px!important;
                     margin: 0 auto!important;
              }
              div.row_group {
                     zoom: 1;
                     margin-bottom: 10px;
                     border: 1px solid #dadada;
                     background-color: #fff;
              }
              div.join_row {
                     box-sizing: border-box;
                     padding: 11px 11px 11px 13px;
                     background: #fff;
              }
              span.int_id {
                     padding-right: 95px;
              }
              input.int {
                     font-size: 15px;
                     position: relative;
                     z-index: 10;
                     width: 100%;
                     height: 16px;
                     padding: 6px 0;
                     border: none;
                     background: #fff;
              }
              .join_from .1b1 {
                     font-size: 15px;
                     line-height: 18px;
                     position: absolute;
                     z-index: 9;
                     top: 5px;
                     left: 0;
                     display: block;
                     color: #8e8e8e; 
              }
              .join_row+.join_row {
                     border-top: 1px solid #f0f0f0;
              }
              span.ps_box {
                     position: relative;
                     display: block;
                     height: 27px;
              }
              div.join_sex {
                     overflow: heidden;
                     padding: 8px 18px 8px 15px;
                     
              }
              span.sex {
                     display: block;
                     height: 31px;
                     margin-right: -3px;
                     border: 1px solid #dcdcdc;
              }
              span.jender {
                     position: relative;
                     z-index: 10;
                     display: block;
                     float: left;
                     width: 49.8%;
                     height: 31px;
                     border-right: 1px solid #dcdcdc;
              }
              span.jender input{
                     position: absolute;
                     z-index: 9;
                     top: -3px;
                     left: 0;
                     width: 100%;
                     height: 31px;
                     
              }
              span.jender label {
                     line-height: 32px;
                     position: absolute;
                     z-index: 10;
                     top: 0;
                     left: 0;
                     display: block;
                     width: 100%;
                     height: 31px;
                     cursor: pointer;
                     text-align: center;
                     color: #8e8e8e;
                     background: #fff;
              }
              .jender+.jender {
                     border: none;
              }
              
              div#idErrCk {
              	color:red;
              	margin-top: 7px;
              }
              
              div#pw1ErrCk {
              	color:red;
              	margin-top: 7px;
              }
              
              div#pw2ErrCk {
              	color:red;
              	margin-top: 7px;
              }
              
              div#nameErrCk {
              	color:red;
              	margin-top: 7px;
              }
              /* 아이디, 비밀번호 입력 끝*/
              
              /* 생년월일 입력 시작 */
              div.join_birthday {
                     padding: 0;
              }
              div.join_birth {
                     display: table;
                     padding-right: 15px;
              }
              div.bir_title {
                     font-size: 13px;
                     display: table-cell;
                     width: 28px;
                     padding: 3px 12px 0 14px;
                     table-layout: fixed;
                     text-align: center;
                     vertical-align: middle;
                     color: #8e8e8e;
                     border-right: 1px solid #efefef;
                     background: #f7f7f7;
              }
              div.bir_yy {
                     padding-right: 4px;
                     padding-left: 14px;
              }
              .join_birth .cell {
                     width: 1px;
                     padding: 0;
                     color: gray;
              }
              select.sel {
                     font-size: 15px;
                     font-weight: 700;
                     line-height: 18px;
                     width: 100%;
                     height: 29px;
                     color: #000;
                     border: none;
                     border-radius: 0;
              }
              /* 생년월일 입력 끝 */
              
              
              
              /* 주소검색창 시작 */
              div#address_num {
              	position: relative;
              }
              input#address_search {
              	position: absolute;
              	
              }
              /* 주소검색창 끝 */
              
              
              
              /* 가입하기 버튼 시작 */
              span.btn_join {
                     display: block;
                     height: 61px;
                     margin: 33px 0 19px;
                     background-color: #1fbc02;
                     text-align: center;
                     line-height: 61px;
              }
              .btn_join input {
                     width: 100%;
                     height: 61px;
                     border: 1px solid #1eb702;
                     background-color: #1eb702;
              }
              #btnSubmit {
              	font-size: 30px;
              	text-decoration: none;
              	color: gray;
              }
              /* 가입하기 버튼 끝 */
       /* container 끝 */
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var flag=0;
		
		
		
		
		$("#btnSubmit").click(function(){
			//편하게 사용하기 위해 각 항목의 값을 가져와서 변수에 담아준다.
			var id = $("#id").val();
			var pw1 = $("#pswd1").val();
			var pw2 = $("#pswd2").val();
			var name = $("#nm").val();
			
			//셀렉트 박스를 통해 받아온 email에 관한 정보를 변수에 담아준다.
			var email = $("#email").val();
			var emailAddress = $("#emailAddress").val();
			var fullEmail = $("#email").val() + "@" + $("#emailAddress").val();
			
			//년, 월, 일 정보를 받아온다.
			var year = $("#sel_year").val();
			var month = $(".sel_month").val();
			var day = $("#sel_day").val();
			
			
			//var idckval = $(#"idckval");
			
			//패스워드의 유형성 체크를 위해서 선언한 변수 - 영문과 숫자를 조합해 6~20자리 까지 가능하다.
			var regPass = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			
			//실직적으로 유효성 체크를 실행하는 if문
			if(id == "") {
				$("#idErrCk").text("아이디를 입력하세요.").css("display", "block");
				$("#id").focus();
				return false;
			} else if(pw1 == "") {
				$("#pw1ErrCk").text("패스워드를 입력하세요.").css("display", "block");
				$("#pswd1").focus();
				return false;
			} else if(pw2 == "") {
				$("#pw2ErrCk").text("패스워드 재확인을 입력하세요.").css("display", "block");
				$("#pswd2").focus();
				return false;
			} else if(name == "") {
				$("#nameErrCk").text("이름을 입력하세요.").css("display", "block");
				$("#nm").focus();
				return false;
			} else if(email == "") {
				alert("이메일을 입력하세요");
				$("#email").focus();
				return false;
			} else if(emailAddress == "") {
				alert("이메일주소를 입력하세요");
				return false;
			} else if(pw1 != pw2) {
				$("#pw1ErrCk").text("패스워드가 일치하지 않습니다.").css("display", "block");
				$("#pswd1").focus();
				return false;
			} else if(!regPass.test(pw1)) {
				$("#pw1ErrCk").text("패스워드는 영문과 숫자를 조합한 6~20자리 입니다.").css("display", "block");
				$("#pswd1").focus();
				return false;
			} else if(flag != 1){
				alert("아이디 중복체크를 하세요.");
				return false;
			} 
			
			else {
				alert("유효성체크를 모두 완료했습니다.");
				$("form").submit();
			}			
			
			/* else if(idck != id){
				//중복체크를 한 아이디를 바꾸게 되면 이 if문에 의해 다시 중복체크를 해야한다.
				alert("아이디를 다시 중복체크 하세요");
				return false;
			} */
			
		});
		//회원가입시 유효성 체크를 해주는 쿼리 끝
		
		
		//아이디중복체크를 ajax로 해보기 시작
		$("#id").blur(function(){
			//아이디 인풋 창의 입력된 텍스트를 가져온다.
			var id = $(this).val();
			
			//만약 아이디가 공백이면 아이디를 입력하라는 경고 메세지를 띄우고  
			if(id == "") {
				$("#idErrCk").text("아이디를 입력하세요.").css("display", "block");
				$(this).focus();
				return false;
			//아이디가 공백이 아니면 유효성 체크를 실행한다.
			} else if(id != "") {
				//아이디가 공백이 아니면 에러메세지가 없어지고 유효성 체크를 하는 ajax가 실행된다.
				$("#idErrCk").text("아이디를 입력하세요.").css("display", "none");
				$.ajax({
					url: "memajax.bizpoll", //서블렛을 어디로 갈지 정해주는 url
					type: "POST",	//타입은 post방식이다.
					dataType: "json",	//json이 가장 많이 쓰이기 때문에 이걸 쓰면 된다.
					data: "id=" + id,	//쿼리스트링이기 때문에 띄어쓰기 하면 안된다.
					success: function(data) { //성공하면 이 메소드가 실행됨
						if(data.flag == "0") {
							$("#idErrCk").text("중복된 ID입니다.").css("display", "block");
							flag=0;
						} else {
							$("#idErrCk").text("멋진 ID입니다.").css("display", "block");
							flag=1;
						}
					},
					error: function() {
						alert("System Error!!!");
					}
				});
			}
		});
		//아이디중복체크를 ajax로 해보기 끝
		
		
		
		
		
		
		
		
		//이메일 셀렉트 박스에 뭔가를 바꾸면 이벤트가 생기게하는 쿼리 시작
		$("#emailSelBox").change(function(){
			//셀렉트 박스의 값을 가져와서 변수에 넣었다.
			var emailSelBox = $("#emailSelBox").val();
			
			//셀렉트박스가 직접입력으로 선택 되면 메일주소란이 공백이 되고 포커스가 간다.
			if(emailSelBox == "self") {
				$("#emailAddress").val("");
				$("#emailAddress").focus();
			//이메일주소를 선택하면 내가 선택한 이메일이 들어간다.
			} else {
				$("#emailAddress").val(emailSelBox);
			}
		});
		//이메일 셀렉트 박스에 뭔가를 바꾸면 이벤트가 생기게하는 쿼리 끝
	});
	
	
	
</script>

</head>
<body>
       <!-- 회원가입 페이지 전체를 감싸는 div -->
       <div id=wrap>
              <div id="header">
                     <h1>
                           <a href="#" class="h_logo">
                                  <img src="image/case/vincent.png">
                           </a>
                     </h1>
              </div>
              
               <!-- container 시작 -->
              <div id="container">
                     <div id="content">
                           <div class="join_content">
                                  <div class="join_form">
                                         <form action="memberinsert.bizpoll" name="frm_member">
                                                <!-- 아이디, 비밀번호 입력창 시작  -->
                                                <div class="row_group">
                                                       <div id="idDiv" class="join_row">
                                                              <span class="ps_box int_id">
                                                                     <input type="text" id="id" name="id" placeholder="아이디" class="int">
                                                                     <!-- <label id="idLb" for="id" class="1b1">아이디</label> -->
                                                              </span>
                                                              <div id="idErrCk"></div><!-- 에러체크 메세지를 띄워주는 div -->
                                                       </div>
                                                       <div id="pswd1Div" class="join_row">
                                                              <span id="pswd1Img" class="ps_box int_pass">
                                                                     <input type="password" id="pswd1" name="pswd1" placeholder="비밀번호" class="int">
                                                              </span>  
                                                              <div id="pw1ErrCk"></div>     
                                                       </div>
                                                       <div id="pswd2Div" class="join_row">
                                                              <span id="pswd2Img" class="ps_box int_pass_pass">
                                                                     <input type="password" id="pswd2" name="pswd2" placeholder="비밀번호 재확인" class="int">
                                                              </span>
                                                              <div id="pw2ErrCk"></div>       
                                                       </div>
                                                       <div class="join_row">
                                                              <span class="ps_box int_pass_pass">
									<span>이메일</span>
                                                                     <input type="text" id="email" name="email" style="width: 150px;" >
                                                                     <span>@</span>
                                                                     <input type="text" id="emailAddress" name="emailAddress" style="margin-right:7px; width: 100px;">
                                                                     <select id="emailSelBox" name="emailSelBox" style="height: 25px;">
                                                                     	<option value="self">직접입력</option>
                                                                     	<option value="gmail">gmail.com</option>
                                                                     	<option value="naver">naver.com</option>
                                                                     	<option value="daum">daum.net</option>
                                                                     	<option value="yahoo">yahoo.com</option>
                                                                     </select>
                                                              </span>
                                                              <div id="email2ErrCk"></div>       
                                                       </div>
                                                </div>
                                                <!-- 아이디, 비밀번호 입력창 끝  -->
                                  
                                                <!-- 이름부터 이메일 까지 작성하는 입력창 시작 -->
                                                <div class="row_group">
                                                       <div id="nmDiv" class="join_row">
                                                              <span class="ps_box">
                                                                     <input type="text" id="nm" name="nm" placeholder="이름" class="int">
                                                              </span>
                                                              <div id="nameErrCk"></div>
                                                       </div>
                                                       <div id="sexDiv" class="join_row join_sex">
                                                              <span class="sex">
                                                                     <span class="jender">
                                                                           <input type="radio" id="man" name="sex" value="0" onclick="checkSex()">
                                                                           <label id="manLb" for="man">남자</label>
                                                                     </span>
                                                                     <span class="jender">
                                                                           <input type="radio" id="woman" name="sex" value="0" onclick="checkSex()">
                                                                           <label id="womanLb" for="woman">여자</label>
                                                                     </span>
                                                              </span>
                                                       </div>
                                                       <!-- 생일 입력창 시작 -->
                                                       <div id="birthdayDiv" class="join_row join_birthday">
                                                              <div class="join_birth">
                                                                     <div class="bir_title">
                                                                            <span>생일</span>
                                                                     </div>
                                                                     <div class="bir_yy">
                                                                           <span class="ps_box">
                                                                                  <input type="text" id="yy" id="sel_year" name="sel_year"  placeholder="년(4자)" class="int">
                                                                                  <!-- <label id="yyLb" for="yy" class="1b1">년(4자)</label> -->
                                                                            </span>
                                                                     </div>
                                                                     <span class="cell"><!-- | --></span>
                                                                     <div class="bir_mm">
                                                                           <span class="ps_box">
                                                                                  <select id="mm" title="월" class="sel_month" onchange="checkBirthday('check')">
                                                                                         <option value>월</option>
                                                                                         <option value>1</option>
                                                                                         <option value>2</option>
                                                                                         <option value>3</option>
                                                                                         <option value>4</option>
                                                                                         <option value>5</option>
                                                                                         <option value>6</option>
                                                                                         <option value>7</option>
                                                                                         <option value>8</option>
                                                                                         <option value>9</option>
                                                                                         <option value>10</option>
                                                                                         <option value>11</option>
                                                                                         <option value>12</option>
                                                                                  </select>
                                                                            </span>
                                                                     </div>
                                                                     <span class="cell"><!-- | --></span>
                                                                     <div class="bir_dd">
                                                                           <span class="ps_box">
                                                                                  <input type="text" id="dd" id="sel_day" placeholder="일" class="int">
                                                                            </span>
                                                                     </div>
                                                              </div>
                                                       </div>
                                                </div>
                                                
                                                <!-- 주소 검색창 시작 -->
                                                <div class="row_group">
								<div id="address_num" class = "join_row">
									<span class="ps_box">
										<input type="text" placeholder="우편번호" class="int">
									</span>
								</div>
								<input id="address_search" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<div class = "join_row">
									<span class="ps_box">
										<input type="text" placeholder="주소" class="int">
									</span>
								</div><div class = "join_row">
									<span class="ps_box">
										<input type="text" placeholder="상세주소" class="int">
									</span>
								</div>								
								<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
								<script>
								    function sample6_execDaumPostcode() {
								        new daum.Postcode({
								            oncomplete: function(data) {
								                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
								
								                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
								                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								                var fullAddr = ''; // 최종 주소 변수
								                var extraAddr = ''; // 조합형 주소 변수
								
								                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								                    fullAddr = data.roadAddress;
								
								                } else { // 사용자가 지번 주소를 선택했을 경우(J)
								                    fullAddr = data.jibunAddress;
								                }000
								
								                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
								                if(data.userSelectedType === 'R'){
								                    //법정동명이 있을 경우 추가한다.
								                    if(data.bname !== ''){
								                        extraAddr += data.bname;
								                    }
								                    // 건물명이 있을 경우 추가한다.
								                    if(data.buildingName !== ''){
								                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								                    }
								                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
								                }
								
								                // 우편번호와 주소 정보를 해당 필드에 넣는다.
								                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
								                document.getElementById('sample6_address').value = fullAddr;
								
								                // 커서를 상세주소 필드로 이동한다.
								                document.getElementById('sample6_address2').focus();
								            }
								        }).open();
								    }
								</script>
							</div>
                                                <!-- 주소 검색창 끝 -->
                                                
                                                
                                                <!-- 가입하기 버튼 시작 -->
                                                <span class="btn_join">
                                                       <a href="#" id="btnSubmit" class="int_join">가입하기</a>
                                                </span>
                                                <!-- 가입하기 버튼 끝 -->
                                         </form>
                                  </div>
                           </div>
                     </div>
              </div>
              <!-- container 끝 -->
              <!-- 가입하기 버튼이 있는 footer -->
              <div id="footer">
              
              </div>
       </div>
</body>
</html>
