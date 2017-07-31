 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
		<div id="fh5co-contact">
			<div class="container">
				<div class="col-md-6 animate-box">
					<h3>login</h3>
					<form name="loginForm" action="login" method="post">
						<div class="row form-group">
							<div class="col-md-6">
								<input type="text" name="id" class="form-control" placeholder="id">
								<input type="password" name="pw" class="form-control" placeholder="password">
							</div>
						</div>

						<div class="form-group">
							<input type="submit" value="Login" class="btn btn-primary" onclick="return loginCheck()">
							<input type="button" value="Join" class="btn btn-primary" onclick="location.href='joinForm'">
						</div>
					</form>
				</div>
			</div>
		</div>
		
<script type="text/javascript">
function loginCheck() {
	if (document.loginForm.id.value=='') {
		alert("아이디를 입력하세요.");
		return false
	}
	if (document.loginForm.pw.value=='') {
		alert("비밀번호를 입력하세요.");
		return false
	}
	return true;
}
</script>
<%@ include file="/layout/footer.jsp" %>

