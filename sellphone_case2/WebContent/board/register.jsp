<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>   
<%@page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>

<script type="text/javascript">
$(document).ready(function() {
	$("#title").val("");
	$("#content").val("");
	$("#writer").val("");
	$("#writer").val();
});
</script>

<!-- Main Content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<!-- AdminLTE 제작한 box 속성 -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				<!-- form속성에 action을 지정하지 않으면 현재 경로를 그대로 action의 대상 경로로 설정 -->
				<form role="form" action="boardinsertsave.bizpoll" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="title">Title</label>
							<input type="text" id="title" name="title" class="form-control" placeholder="Enter">
						</div>
						<div class="form-group">
							<label for="content">Content</label>
							<textarea id="content" name="content" class="form-control" rows="3"  placeholder="Enter..."></textarea>
						</div>
						<div class="form-group">
							<label for="writer">Writer</label>
							<input type="text" id="writer" name="writer" class="form-control" placeholder="Enter">
						</div>
					</div>
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Submit</button>
						
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<%@ include file="../include/footer.jsp" %>
