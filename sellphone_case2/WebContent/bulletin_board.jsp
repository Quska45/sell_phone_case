<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 인덱스</title>
<style>
body, th, span, a, div {
	margin: 0;
	padding: 0;
	border: 0;
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
#right_selbox {
	width: 118px;
	height: 38px;
}
#searchinput {
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

</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$("#write").on("click", function() {
		alert("게시글 등록 버튼 잘 눌림");
		location.href = "boardinsertview2.bizpoll";
		submit();
	});
</script>
</head>
<body>
	<div id="page1">
		<div id="page2">
			<div id="contents">
				<div id="select_category">
					<div class="category_attr">
						<a id="category1" href="#">공지사항</a>
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
				공지사항
				</div>
				
				<!-- 검색 입력란 -->
				<div id="clearfix">
					<div id="board_top_right">
						<select id="right_selbox">
							<option>제목</option>
							<option>내용</option>
							<option>제목 + 내용</option>
						</select>
						<input id="searchinput" placeholder="검색어를 입력하세요"></input>
						<button id="searchbtn">검색</button>
					</div>
					
					<select id="board_top_left_selbox">
						<option>최신순</option>
						<option>조회순</option>
						<option>뭐가 또 있냐 ㅡㅡ</option>
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
								<td id="th2_title"><a href="boarddetail2.bizpoll?bno=${bDto.bno}">${bDto.title}</a></td> 						
								<td id="th3_regi">${bDto.writer}</td> 						
								<td id="th4_date">${bDto.regdate}</td> 						
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
								<a href="boardlist2.bizpoll?page=${idx}">${idx}</a></li>
							</c:forEach>
								
							</li>
						<c:if test="${pageMaker.next}">
							<li>
								<a href="boardlist2.bizpoll?page=${pageMaker.endPage + 1}">&raquo;</a>
							</li>
						</c:if>
						</ul>
					</div>
					<span>
						<a id="write" href="boardinsertview2.bizpoll">글쓰기</a>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>

<%@ include file="footer.jsp" %>
</html>