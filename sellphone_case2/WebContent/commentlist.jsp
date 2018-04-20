<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 코멘트 시작 -->
	<div class="box-body" style="border-top: 3px solid black; margin-top: 20px;">
           				<div style="font-size: 20px; margin-bottom: 5px;">
           				댓글 
           					<span id="comment_count"><input value="${replycount}" id="replyCountInput" id="replyCountInput"></span>
           				</div>
            			
            			
	</div>

	<c:if test="${replycount != 0}">	
		<c:forEach items="${replyview}" var="replyview">
			<div style="margin-bottom: 30px;">
				<span id="comment_writer">${replyview.writer}</span>
				<c:if test="${sessionScope.loginUser.mname == replyview.writer}">
					<!-- data_num은 원래 정의되어 있는 속성이 아니라 ajax 에서 this를 이용해 값을 가져오기 위해 임의로 만든 것 -->
					<a href="#" class="reply_del" data_num="${replyview.rno}">삭제</a>
					<%-- <input type="hidden" value="${replyview.rno}" id="input_rno" name="input_rno">
					<span><a href="#" id="reply_del" style="float:right; margin-left: 10px;">삭제</a></span> --%>
				</c:if>
				<span id="comment_date" style="float: right;">${replyview.regdate}</span>
				<textarea name="comment_input_content" id="comment_input_content" style="display: block; width:100%" readonly="readonly">${replyview.content}</textarea>
			</div>			
		</c:forEach>
	</c:if>	
	<c:if test="${replycount == 0}">
		<div>조회된 댓글이 없습니다.</div>
	</c:if>
	
</body>
</html>