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
	<div style="margin-bottom: 15px;">댓글 수 : ${replycount}</div>
	<div>
		<c:forEach items="${replyview}" var="replyview">
			<div class="comment_list">
				<ul>
					<li>${replyview.content}
					</li>	
					<li>
						<span>작성자 : ${replyview.writer}</span>
						<span>${replyview.regdate}</span>
						<a href="#" class="relpy_del" data_num="${replyview.rno}">삭제</a>
					</li>
					
				</ul>
			</div>
		</c:forEach>
	</div>
</body>
</html>