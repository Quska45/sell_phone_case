<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body, div, ul {
		margin: 0px;
		padding: 0px;
		font-size: 1em;
	}
	#popup {
		width: 200px;
		margin: 50px auto;
	}
</style>
<script type="text/javascript">
	function closeOK() {
		opener.document.frm_member.pswd1.focus();
		//중복체크를 했을 때 값을 바꿔줄 거다.
		//opener.document.frm_member.idck.value = "1";
		self.close();
	}
	
	function closeNG() {
		opener.document.frm_member.id.select();
		self.close();
	}
	
</script>
</head>
<body>
	<div id="popup">
		<c:choose>
			<c:when test="${flag=='0'}">
				이미 가입된 아이디 입니다.<br>
				다른 아이디를 입력해주세요.<br>
				<button onclick="closeNG()">확인</button>
				
			</c:when>
			<c:when test="${flag=='1'}">
				사용가능한 ID입니다.<br>
				<button onclick="closeOK()">확인</button>
			</c:when>
		</c:choose>
	</div>
</body>
</html>