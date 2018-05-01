<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 다른 파일과 합쳐준다. -->
<!-- 이 라인을 넣어준 위치에서 실행된다. -->
<%@ include file="header.jsp" %>


<!-- JSTL 라이브러리를 사용하기 위한 선언문 -->
<!-- jstl은 라이브러리마다 쓰는 방식이 달라서 각각 추가 해줘야한다.  -->
<!-- prefix는 표기업을 의미한다. core는 c fmt는 f로 쓰겠다는 것이다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@page import="java.util.Date"%>
<c:set var="date" value="<%=new Date()%>"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핸드폰 케이스 판매사이트에 오신것을 환영합니다.</title>
<!-- 브라우저 타이틀바 로고 삽입(파비콘 :favicon) -->
<link rel="icon" type="image/png" href="image/pabicon.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
          min-width: 1080px; /* min max-width를 주는 것은 모니터에 따라 해상도가 달라지기 때문에 고정된 width를 가지게 하기 위해서 이다. */
     }
     ul {
          list-style-type: none;
     }
     a {
     	text-decoration: none;
     }
     div#container {
     	position: relative;
     	width: 1315px;
     	padding-bottom: 30px;
     	margin: 0 auto;
     }
     hr#hr_before { /* new product container에서 구분선 역할을 하는 hr */
     	display: inline-block;
     	width: 30%;
     	height: 3px;
     	background-color: #282c37;
     }
     h2.new_product_title {
     	display: inline-block;
     	left: 550px;
     	padding: 0 150px;
     	font-family: 'Jeju Gothic', sans-serif;
     }
     hr#hr_after { /* new product container에서 구분선 역할을 하는 hr */
     	display: inline-block;
     	right: 0px;
     	width: 30%;
     	height: 3px;
     	background-color: #282c37;
     }
     td.td_card {
     	margin: 19.5px;
     	display: inline-block;
     }
     td.td_image {
     	align=center;
     	width=280px;
     	height=280px;
     	padding-bottom: 10px;
     }
     td.td_image > a > img {
     	width: 280px;
     	height: 280px;
     }
     a.a_company {
     	color: #999999;
     	font-size: 15px;
     	font-weight: normal;
     }
     a.a_case_name {
     	color: #000000;
     	font-size: 15px;
     	font-weight: normal;
     }
     td.price {
     	color: #060606;
     	font-size: 14px;
     	font-weight: bold;
     }
     
     
    
     
     
     /* New ITEM / BEST ITEM 시작 */
     #list_wrap {
	margin-left: 25%;
     }
     .pdt_item {
     	float: left;
     }
     .item_list{
     	height: 1030px;
     }
     
     
     /* New ITEM / BEST ITEM 끝 */
     
     
</style>

</head>
<body>

<!-- 배너 -->
<div style="margin-top:100px; margin-bottom: 30px;">
		<div style="text-align: center; width: 1315px; margin: 0 auto;">
				<img class="img_banner" src="image/case/picture01.jpg" style="height: 371px;">
				<img class="img_banner" src="image/case/picture02.jpg" style="height: 371px;">
				<img class="img_banner" src="image/case/picture03.jpg" style="height: 371px;">
		</div>
	</div>
</div>

<!-- new product container -->
<div style="margin-bottom: 30px;">
	<div id="container"> <!-- 구분선이 되는 div -->
		<hr id="hr_before">
		<h2 style="font-weight: normal" class="new_product_title">
			<b>Main</b>
			"PRODUCT"</b>
		</h2>
		<hr id="hr_after">
	</div>
</div>



<!-- 상품 카드 -->
<div style="width: 1315px; min-height: 300px; border: 3px solid white; margin: 0 auto;">
<table> <!-- 상품들 전체를 감싸는 큰 table -->
	<tbody>
		<tr><!-- 첫 번째 줄 -->
			<td class="td_card"><!--카드1번. 카드 하나에 해당하는 td, 1개 카드의 모든 항목은 여기에 들어온다. -->
				<table>
					<tbody>
						<tr><!-- 이미지가 들어가는 tr -->
							<td class="td_image"><!-- 사진이 들어가는  td -->
								<a href="#"><img src="image/case/case01.png"></a>
								
							</td>
						</tr>
						<tr>
							<td height="6"></td>
						</tr>
						<tr><!-- 회사명이 들어가는 tr -->
							<td align="center">
								<a href="#" class="a_company">
									[마리몬드]
								</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a href="#" class="a_case_name">
									미러카드케이스_무궁화(비비드)
								</a>
							</td>
						</tr>
						<tr>
							<td align="center" class="price">
								23,000 원
							</td>
						</tr>
						
					</tbody>
				</table>
			</td><!-- 카드 하나가 끝남 -->
			<td class="td_card"><!-- 카드2번 -->
				<table>
					<tbody>
						<tr><!-- 이미지가 들어가는 tr -->
							<td class="td_image"><!-- 사진이 들어가는  td -->
								<a href="#"><img src="image/case/case02.png"></a>
							</td>
						</tr>
						<tr>
							<td height="6"></td>
						</tr>
						<tr><!-- 회사명이 들어가는 tr -->
							<td align="center">
								<a href="#" class="a_company">
									[마리몬드]
								</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a href="#" class="a_case_name">
									하드케이스_용담(블랙)
								</a>
							</td>
						</tr>
						<tr>
							<td align="center" class="price">
								23,000 원
							</td>
						</tr>
						
					</tbody>
				</table>
			</td><!-- 카드 2번 끝남 -->
			<td class="td_card"><!-- 카드3번 -->
				<table>
					<tbody>
						<tr><!-- 이미지가 들어가는 tr -->
							<td class="td_image"><!-- 사진이 들어가는  td -->
								<a href="#"><img src="image/case/case03.png"></a>
							</td>
						</tr>
						<tr>
							<td height="6"></td>
						</tr>
						<tr><!-- 회사명이 들어가는 tr -->
							<td align="center">
								<a href="#" class="a_company">
									[마리몬드]
								</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a href="#" class="a_case_name">
									하드케이스_용담(바이올렛)
								</a>
							</td>
						</tr>
						<tr>
							<td align="center" class="price">
								23,000 원
							</td>
						</tr>
						
					</tbody>
				</table>
			</td><!-- 카드 하나가 끝남 -->
			<td class="td_card"><!--카드1번. 카드 하나에 해당하는 td, 1개 카드의 모든 항목은 여기에 들어온다. -->
				<table>
					<tbody>
						<tr><!-- 이미지가 들어가는 tr -->
							<td class="td_image"><!-- 사진이 들어가는  td -->
								<a href="#"><img src="image/case/case01.png"></a>
							</td>
						</tr>
						<tr>
							<td height="6"></td>
						</tr>
						<tr><!-- 회사명이 들어가는 tr -->
							<td align="center">
								<a href="#" class="a_company">
									[마리몬드]
								</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a href="#" class="a_case_name">
									미러카드케이스_무궁화(비비드)
								</a>
							</td>
						</tr>
						<tr>
							<td align="center" class="price">
								23,000 원
							</td>
						</tr>
						
					</tbody>
				</table>
			</td><!-- 카드 하나가 끝남 -->
		</tr><!-- 첫번 째 줄 끝남 -->
		<tr><!-- 두번 째 줄 -->
			<td class="td_card"><!-- 카드1번 -->
				<table>
					<tbody>
						<tr><!-- 이미지가 들어가는 tr -->
							<td class="td_image"><!-- 사진이 들어가는  td -->
								<a href="#"><img src="image/case/case04.png"></a>
							</td>
						</tr>
						<tr>
							<td height="6"></td>
						</tr>
						<tr><!-- 회사명이 들어가는 tr -->
							<td align="center">
								<a href="#" class="a_company">
									[마리몬드]
								</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a href="#" class="a_case_name">
									하드케이스_용담(핑크)
								</a>
							</td>
						</tr>
						<tr>
							<td align="center" class="price">
								23,000 원
							</td>
						</tr>
						
					</tbody>
				</table>
			</td><!-- 카드 하나가 끝남 -->
			<td class="td_card"><!-- 카드2번 -->
				<table>
					<tbody>
						<tr><!-- 이미지가 들어가는 tr -->
							<td class="td_image"><!-- 사진이 들어가는  td -->
								<a href="#"><img src="image/case/case06.png"></a>
							</td>
						</tr>
						<tr>
							<td height="6"></td>
						</tr>
						<tr><!-- 회사명이 들어가는 tr -->
							<td align="center">
								<a href="#" class="a_company">
									[마리몬드]
								</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a href="#" class="a_case_name">
									[Mary Outlet]젤리케이스_자목련(핑크)
								</a>
							</td>
						</tr>
						<tr>
							<td align="center" class="price">
								23,000 원
							</td>
						</tr>
						
					</tbody>
				</table>
			</td><!-- 카드 하나가 끝남 -->
			<td class="td_card"><!-- 카드3번 -->
				<table>
					<tbody>
						<tr><!-- 이미지가 들어가는 tr -->
							<td class="td_image"><!-- 사진이 들어가는  td -->
								<a href="#"><img src="image/case/case07.png"></a>
							</td>
						</tr>
						<tr>
							<td height="6"></td>
						</tr>
						<tr><!-- 회사명이 들어가는 tr -->
							<td align="center">
								<a href="#" class="a_company">
									[마리몬드]
								</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a href="#" class="a_case_name">
									[Mary Outlet]젤리케이스_자목련(바이올렛)
								</a>
							</td>
						</tr>
						<tr>
							<td align="center" class="price">
								23,000 원
							</td>
						</tr>
						
					</tbody>
				</table>
			</td><!-- 카드 하나가 끝남 -->
		</tr>
	</tbody>
</table>
</div>
<!-- 상품 카드 끝 -->







<div class="item_list">
	<!-- new product container -->
	<div style="margin-bottom: 30px; margin-top: 30px;">
		<div id="container"> <!-- 구분선이 되는 div -->
			<hr id="hr_before">
			<h2 style="font-weight: normal" class="new_product_title">
				<b>New</b>
				"PRODUCT"</b>
			</h2>
			<hr id="hr_after">
		</div>
	</div>
	
	<table id="list_wrap">
		<tr>
	<c:forEach items="${newProductList}" var="pDto">
		<td class="pdt_item">
			<a href="">
				<img alt="신상품" src="image/case/${pDto.p_img}" width="200px" height="200px">
				<div class="wrap_info">
					<span>${pDto.p_name}</span><br>
					<span>
						<fmt:setLocale value="ko_kr"/>
						<fmt:formatNumber value = "${pDto.p_price2}" type="currency"/>
					</span>
				</div>
			</a>
		</td>
	</c:forEach>
		</tr>
	</table>
	
	<!-- new product container -->
	<div style="margin-bottom: 30px; margin-top: 100px;">
		<div id="container"> <!-- 구분선이 되는 div -->
			<hr id="hr_before">
			<h2 style="font-weight: normal" class="new_product_title">
				<b>Best</b>
				"PRODUCT"</b>
			</h2>
			<hr id="hr_after">
		</div>
	</div>
	
	<div id="list_wrap">
	<c:forEach items="${bestProductList}" var="pDto">
		<div class="pdt_item">
			<a href="">
				<img alt="신상품" src="image/case/${pDto.p_img}" width="200px" height="200px">
				<div class="wrap_info">
					<span>${pDto.p_name}</span><br>
					<span>
						
						<fmt:setLocale value="ja_jp"/>
						<!-- currency = 접속하는 현지의 화폐단위 -->
						<fmt:formatNumber value = "${pDto.p_price2}" type="currency"/><br>
						<fmt:formatNumber value = "0.15" type="percent"/><br>
						<fmt:formatNumber value = "553654789834" pattern="###,###,###,###"/><br>
						<fmt:formatDate value="${date}" type="time"/><br>
						<fmt:formatDate value="${date}" type="time" timeStyle="full"/><br>
						<fmt:formatDate value="${date}" type="time" pattern="yyyy/mm/dd"/><br>
					</span>
				</div>
			</a>
		</div>
	</c:forEach>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>













