<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
               <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	color: #333;
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
	border: 1px solid grey;
	background: #ffffff;
	height: 680px;
    padding: 21px 3px;
}

/* 상품이미지 큰게 들어가는 부분 시작 */
.big_con_img_wrap{position: relative;}
.big_con_right{
	position: absolute;
    top: 50%;
    width: 27px;
    height: 44px;
    margin-top: -22px;
    z-index: 10;
}
.big_con_left {
	position: absolute;
    top: 50%;
    width: 27px;
    height: 44px;
    margin-top: -22px;
    z-index: 10;
}
.con_left_section {
	width: 500px;
    float: left;
}
/* 상품이미지 큰게 들어가는 부분 끝 */

/* 상품이미지 옆에 구매와 관련한 정보창 시작 */
.con_right_section {
	width: 576px;
	float: left;
	padding-left: 13px;
}
.con_right_section_top {
	border-bottom: 2px solid #181717;
    width: 100%;
    padding-bottom: 18px;
    
}
.goods_title {
	font-size: 24px;
    color: #181717;
    margin-bottom: 5px!important;
	
}
/* 상품이미지 옆에 구매와 관련한 정보창 끝 */

</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
	<div id="page1">
		<form>
			<div id="page2">
					<div id="contents">
						<!-- 상품이미지 큰게 들어가는 부분 시작-->
						<div class="con_left_section">
							<div class="img_cont" style="margin-top: 5px; width: 500px; height: 625px;">
								<div class="big_con_img_wrap">
									<div class="big_con_img"><img src="./image/case/case01.png" style="width: 500px; height: 500px;"></div>
									<div class="big_con_right">></div>
									<div class="big_con_left">></div>
								</div>
								<div class="small_con_img">
									<img src="./image/case/case01.png" style="width: 100px; height: 100px; padding-left: 40%; padding-top: 12px;">
								</div>
							</div>
						</div>
						<!-- 상품이미지 큰게 들어가는 부분 끝-->
						<!-- 상품이미지 옆에 구매와 관련한 정보창 시작 -->
						<div class="con_right_section">
							<div class="con_right_section_top">
								<p class="goods_title">카드케이스 백목련(핑크)</p>
							</div>
							<table class="con_right_section_table">
								<tbody>
									<tr>
										<th>판매가</th>
										<td>25,000원</td>
									</tr>
									<tr>
										<th>회원등급</th>
										<td>4%추가할인 4%추가적립</td>
									</tr>
									<tr>
										<th>사은품</th>
										<td>23,000원 이상 구매 시 사은품_쇼핑백 小 1개 선택</td>
									</tr>
									<tr>
										<th>배송</th>
										<td><select><option>택배(선불)</option><option>착불</option></select></td>
									</tr>
									<tr>
										<th>배송비</th>
										<td>50,000원 이상 무료 미만2,500원</td>
									</tr>
									<tr>
										<th>상품정보</th>
										<td>전자상거래 상품정보 제공 고시 정보</td>
									</tr>
									<tr>
										<th>상품옵션</th>
										<td>상품옵션을 선택해 주세요</td>
										<th>기종</th>
										<td>
											<select>
												<option>- 기종 선택 -</option>
												<option>갤럭시 S8</option>
												<option>갤럭시 S8</option>
												<option>아이폰8</option>
												<option>아이폰8+</option>
											</select>
										</td>
									</tr>
									<tr>
										
									</tr>
								</tbody>
							</table>
							<div class="SNS_div"></div>
							
						
						</div>
						<!-- 상품이미지 옆에 구매와 관련한 정보창 끝 -->
					</div>
			</div>
		</form>
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>