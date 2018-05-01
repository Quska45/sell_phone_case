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
	margin-top: 150px;
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
.tbl_form {
	    width: 100%;
   	 border-top: 1px solid #777777;
   	 border-bottom: 1px solid #777777;
   	 background-color: #f9f9f9;
}
.tbl_form th {
	padding: 20px;
	border-bottom: 1px solid #e5e5e5;
	font-size: 15px;
	color: #000;
	text-align: left;
	letter-spacing: -1px;
	width: 150px;
}
.tbl_form td {
	padding: 20px;
	border-bottom: 1px solid #e5e5e5;
	text-align: left;
}


</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).on("click", "#mypageupdate_ok_btn", function(){
	$("#mypageupdate").submit();
})



</script>
</head>
<body>
	<div id="page1">
		<div id="page2">
			<div id="contents">
				<div id="select_category">
					<div class="category_attr">
						<a id="category1" href="mypageupdate.jsp">개인정보수정</a>
					</div>
					<div class="category_attr">
						<a id="category2" href="mypage_password_update.jsp">비밀번호변경</a>
					</div>
				</div>
				<h1 id="mypage_title" style="display: block;">
				개인정보 수정
				</h1>
				<div id="clearfix">
					<div id="mypage_modify">
						<form action="mypageupdate.bizpoll" name="mypageupdate" id="mypageupdate" method="POST">
						<table class="tbl_form">
							<tbody>
								<tr>
									<th>아이디<span style="color: #fda101;">*</span></th>
									<td>
										<div class="mypageColum">
											<input id="mypageColum_input_id" name="mypageColum_input_id" type="hidden" value="${sessionScope.loginUser.mid}">
											<span id="mypageColum_id">${sessionScope.loginUser.mid}</span>
										</div>
									</td>
								</tr>
								<tr>
									<th>이름<span style="color: #fda101;">*</span></th>
									<td>
										<div class="mypageColum">
											<input id="mypageColum_input_name" name="mypageColum_input_name" type="hidden" value="${sessionScope.loginUser.mname}">
											<span id="mypageColum_name">${sessionScope.loginUser.mname}</span>
										</div>
									</td>
								</tr>
								<tr>
									<th>생년월일<span style="color: #fda101;">*</span></th>
									<td>
										<div class="mypageColum">
											<input id="mypageColum_input_birth" name="mypageColum_input_birth" type="hidden" value="${sessionScope.loginUser.mbirth}">
											<span id="mypageColum_birth">${sessionScope.loginUser.mbirth}</span>
										</div>
									</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>
										<div class="mypageColum">
											<input id="mypageColum_input_phone" name="mypageColum_input_phone" value="${sessionScope.loginUser.mphone}">
										</div>
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										<div class="mypageColum">
											<input id="mypageColum_input_juso" name="mypageColum_input_juso" value="${sessionScope.loginUser.mjuso}">
										</div>
									</td>
								</tr>
								<tr style="border-bottom: 2px solid #9ea0a3;">
									<th>이메일</th>
									<td>
										<div class="mypageColum">
											<input id="mypageColum_input_email" name="mypageColum_input_email" value="${sessionScope.loginUser.memail}">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						</form>
						<div class="mypageupdate_btn_div">
							<a href="#" id="mypageupdate_ok_btn">저장</a>
							<a href="#" id="mypageupdate_cancel_btn">취소</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>