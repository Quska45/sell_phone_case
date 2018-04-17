<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>   
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	// SAVE
	$(".btn-primary").on("click", function() {
		formObj.submit();
	});	
	
	// CANCEL
	$(".btn-warning").on("click", function() {
		self.location="/board/listAll";
	});	
});
</script>
<form role="form" method="post" action="boardupdatesave.bizpoll">
	<div class="box-body">
		<div class="form-group">
			<label for="bno">BNO</label>
			<input type="text" name="bno" id="bno" class="form-control" value="${boardupdate.bno}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="title">Title</label>
			<input type="text" name="title" id="title" class="form-control" value="${boardupdate.title}" >
		</div>
		<div class="form-group">
			<label for="content">Content</label>
			<textarea rows="3" name="content" id="content" class="form-control">${boardupdate.contents}</textarea>
		</div>
		<div class="form-group">
			<label for="writer">Writer</label>
			<input type="text" name="writer" id="writer" class="form-control" value="${boardupdate.writer}" readonly="readonly">
		</div>
	</div>
</form>
<div class="box-footer">
	<button type="submit" class="btn btn-primary">SAVE</button>
	<button type="submit" class="btn btn-warning">CANCEL</button>
</div>
<%@ include file="../include/footer.jsp" %>
