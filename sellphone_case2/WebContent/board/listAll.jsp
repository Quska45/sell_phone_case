<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>



<script src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 목록, 게시글 등록 버튼 클릭시 이벤트 처리
	$(".btn-primary").on("click", function() {
		alert("게시글 등록 버튼 잘 눌림");
		location.href = "boardinsertview.bizpoll";
	});	
	
});


</script>

<section class="content">

	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form element -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				
				<div class="box-body">
					<table class="table table-boarded">
						<tr style="width:10px">
							<th>No</th>
							<th>Title</th>
							<th>Writer</th>
							<th>Regdate</th>
							<th style="width:40px">Viewcnt</th>
						</tr>
						
							<!-- BoardListAction에서 보낸 boardlist의  bDto에 담아준다. -->
						  <c:forEach items="${boardlist}" var="bDto">
							  <tr>
							  	<td>${bDto.bno}</td>
							  	<td><a href="boarddetail.bizpoll?bno=${bDto.bno}">${bDto.title}</a><td>${bDto.replycnt}<td></td>
							  	<td>${bDto.writer}</td>
							  	<td>
							  	<fmt:formatDate value="${today}" pattern="yyyy-mm-dd" var="today2"/>
							  	<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-mm-dd" var="regdate2"/>
								
								<c:choose>
									<c:when test="${today2 == regdate2}">
										<td><fmt:formatDate pattern="HH:mm:ss" value="${bDto.regdate}"/></td>
									</c:when>
									<c:otherwise>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}"/></td>
									</c:otherwise>
								</c:choose>
	
							  	<td>${bDto.viewcnt}</td>
						  </tr>
						  </c:forEach>
					</table>
					
					<button type="submit" class="btn btn-primary">게시글 등록</button>
					
					<div>
						<form action="boardsearch.bizpoll" name="replyinsert" method="POST">
							<input type="hidden" value="${boardlistSize}" id="boardlistSizeInput">							
							
							
							<c:if test="${!empty searchKeyword}">
								<c:if test="${boardlistSize==0}">
									<span id="listNoneSpan">조회된 건수가 0입니다.</span>
								</c:if>
								<c:if test="${boardlistSize!=0}">
									<span>조회된 건 수 : ${boardlistSize}</span>
								</c:if>
							</c:if>
							
							<select id="selsearch" name="selsearch" style="height: 25px;">
	                                                            	<option value="1">-조건 선택-</option>
	                                                            	<option value="2">제목</option>
	                                                            	<option value="3">내용</option>
	                                                            	<option value="4">제목+내용(다음카카오)</option>
	                                                            	<option value="5">작성자</option>
	                                                 </select>
								<input id="search_input" name="search_input" type="text" placeholder="입력하시오">
								<button type="submit" id="search_btn">검색</button>
						</form>
					</div>
					<div class="board_pagenation">
						<ul class="pagination">
						
						<c:if test="${pageMaker.prev}">
							<li>
								<a href="boardlist.bizpoll?page=${pageMaker.startPage - 1}">&laquo;</a>
							</li>
						</c:if>
							<li>
							<!-- 반복문이 돌면서 begin 부터 end까지 차례대로 idx에 담기게 된다. -->
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<!-- c:out은 해당 번호에 페이지를 띄웠을 때 변화를 주기 위한 것이다. 변하는 것은 active를 통해 값이 참이었을 때 실행되는 것이다. -->
								<li <c:out value="${pageMaker.criDto.page == idx? 'class=active':''}"/>>
								<a href="boardlist.bizpoll?page=${idx}">${idx}</a></li>
							</c:forEach>
								
							</li>
						<c:if test="${pageMaker.next}">
							<li>
								<a href="boardlist.bizpoll?page=${pageMaker.endPage + 1}">&raquo;</a>
							</li>
						</c:if>
						</ul>
					</div>
					
					
				</div>
				<div class="box-footer">Footer</div>
			</div>
		</div>
	</div>
</section>
<!-- 컨트롤러의 success를 처리하기 위한 스크립

밑에다가 쓴 이유가 있음 -->
<script type="text/javascript">
	var result="${msg}";
	
	if(result == "SUCCESS"){
		alert("처리가 완료 되었습니다.");
	} 
</script>
<%@ include file="../include/footer.jsp" %>