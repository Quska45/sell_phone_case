<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ include file="header.jsp" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 인덱스</title>
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
	border: 5px solid black;
	padding: 20px;
	margin-bottom: 30px; 
}
#board_top_left_selbox {
	width: 118px;
	height: 38px;
}
#board_top_right {
	float: right;
}
#selsearch {
	width: 118px;
	height: 38px;
}
#search_input {
	width: 250px;
	height: 32px;
}
#searchbtn {
	width: 60px;
	height: 37px;
	border: none;
}
.td1{
	width: 100%;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}
.tb1 #list_title {
	background-color: grey;
	font-weight: bold;
	border-collapse: collapse;
}
#th1{width: 80px;}
#th2{width: 666px;}
#th3{width: 100px;}
#th4{width: 100px;}
#th5{width: 60px;}
.textbold {
	border-bottom: 1px solid black;
}
#paging {
	position: relative;
	margin-top: 45px;
	text-align: center;
}
.paging_arrow {
	margin-right: 7px;
}
#paging a {
	border: 1px solid black;
	display:inline-block;
	text-align: center;
	float: left;
	color: #4d4f56;
	line-height: 37px;
	padding-top: 3px;
	min-width: 40px;
	font-size: 13px;
}
#paging a:hover {
	background-color: grey;
}
.paging_a1 {
	margin-left: -6px;
}
.paging_a2 {
	margin-left: -6px;
}
#write {
	position: absolute;
	top: 0;
	right:0;
	color:black!important;
	background-color: grey;
	border: none!important;
	
}
#write_not_login {
	position: absolute;
	top: 0;
	right:0;
	color:black!important;
	background-color: grey;
	border: none!important;
	
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
#select_category > div:last-child{
	border-right: 1px solid #d2d2d2;
}
#board_title {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 10px;
}
.board_pagenation{
	margin-bottom: 15px;
	height: 30px;
}
#th2_title {
	text-align: left;
}

</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	//글쓰기 버튼을 눌렀을 때 로그인이 되어 있다면 게시글을 등록하는 페이지로 넘어가는 서블릿을 타게함 
	$(document).on("click", "#write",function() {
		location.href = "boardinsertview2.bizpoll";
		submit();
	});
	
	//최신순, 조회 수 등 내가 원하는 것으로 게시글 리스트를 정렬 할 수 있음
	$(document).on("change", "#board_top_left_selbox", function(){
		var flag = $("#board_top_left_selbox").val();
		alert(flag);
		location.href="boardlistsort.bizpoll?flag=" + flag;
	});
	
	//검색 버튼을 눌렀을 때 검색을 시작함.
	$(document).on("click", "#searchbtn", function(){
		var flag = $("#selsearch").val();
		var keyword = $("#search_input").val();

		$.ajax({
			url: "boardsearch2.bizpoll",
			type: "POST",
			dataType :  "JSON",
			data: "flag=" + flag + "&keyword=" + keyword,
			success: (function(data){
				alert("댓글 삭제 성공");
			}),
			error: function(){
				alert("system error");
			}
		});
	
	});
	
	//글쓰기를 누를 때 로그인 모달 창이 뜨게 한다.
	$(document).ready(function(){
		$("#write_not_login").click(function(){
			$("#myModal").css("display", "block");
		});	
	
		$(".close").click(function(){
			$("#myModal").css("display", "none");
		})
	
	});
	
</script>
</head>
<body>
	<div id="page1">
		<div id="page2">
			<div id="contents">
				<div id="select_category">
					<div class="category_attr">
						<a id="category1" href="#">자유게시판</a>
					</div>
					<div class="category_attr">
						<a id="category2" href="#">질의응답</a>
					</div>
					<div class="category_attr">
						<a id="category3" href="#">자주묻는질문</a>
					</div>
					<div class="category_attr">
						<a id="category4" href="#">과정관련자료실</a>
					</div>
				</div>
				
				<div id="board_title">
				자유게시판
				</div>
				
				<!-- 검색 입력란 -->
				<div id="clearfix">
					<div id="board_top_right">
						<select id="selsearch" name="selsearch">
							<option>직접입력</option>
							<option>제목</option>
							<option>내용</option>
							<option>제목 + 내용</option>
							<option>작성자</option>
						</select>
						<input id="search_input" name="search_input" placeholder="검색어를 입력하세요"></input>
						<a href="#" id="searchbtn">검색</a>
					</div>
					
					<select id="board_top_left_selbox">
						<option>선택</option>
						<option>최신순</option>
						<option>조회순</option>
						<option>등록자</option>
						<option>제목</option>
					</select>
				</div>
				
				<!-- 게시물 목록 들어가는 테이블 -->
				<table class="tb1">
					<thead>
						<tr id="list_title">
							<th id="th1" class="th_title">번호</th>
							<th id="th2" class="th_title">제목</th>
							<th id="th3" class="th_title">등록자</th>
							<th id="th4" class="th_title">등록일</th>
							<th id="th5" class="th_title">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardlist}" var="bDto">
							<tr class="textbold">
								<td id="th1_num">${bDto.bno}</td> 
								
								<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>						
								<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate2"/>						
								<td id="th2_title">
									<a href="boarddetail2.bizpoll?bno=${bDto.bno}">
									<c:forEach var = "i" begin = "1" end = "${bDto.re_level}">
										&nbsp;&nbsp;
									</c:forEach>
										${bDto.title}
									[${bDto.replycnt}]                  
										<c:if test="${today2 == regdate2}">	new	</c:if>
										<c:if test="${bDto.filesize > 0}">
											<i class="fa fa-folder" style="width:15px; height: 15px; float: right; margin-right: 15px;"></i>
										</c:if>
									</a>
								</td> 						
								<td id="th3_regi">${bDto.writer}</td> 						
								<c:choose>
									<c:when test="${today2 == regdate2}">
										<td><fmt:formatDate pattern="HH:mm:ss" value="${bDto.regdate}"/></td>
										
									</c:when>
									<c:otherwise>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}"/></td>
									</c:otherwise>
								</c:choose>						
								<td id="th5_count">${bDto.viewcnt}</td> 						
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<!-- 1,2,3 .... 페이지 전환창 -->
				<div id="paging">
					<div class="board_pagenation">
						<ul class="pagination">
						
						<c:if test="${pageMaker.prev}">
							<li>
								<a href="boardlist2.bizpoll?page=${pageMaker.startPage - 1}">&laquo;</a>
							</li>
						</c:if>
							<li>
							<!-- 반복문이 돌면서 begin 부터 end까지 차례대로 idx에 담기게 된다. -->
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<!-- c:out은 해당 번호에 페이지를 띄웠을 때 변화를 주기 위한 것이다. 변하는 것은 active를 통해 값이 참이었을 때 실행되는 것이다. -->
								<li <c:out value="${pageMaker.criDto.page == idx? 'class=active':''}"/>>
								<a href="boardlistsort.bizpoll?page=${idx}">${idx}</a></li>
							</c:forEach>
								
							</li>
						<c:if test="${pageMaker.next}">
							<li>
								<a href="boardlist2.bizpoll?page=${pageMaker.endPage + 1}">&raquo;</a>
							</li>
						</c:if>
						</ul>
						<span>
							<c:choose>
								<c:when test="${empty sessionScope.loginUser}">
									<a id="write_not_login" href="#">글쓰기</a>
								</c:when>
								<c:otherwise>
									<a id="write" href="#">글쓰기</a>
								
								</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<%@ include file="footer.jsp" %>
</html>