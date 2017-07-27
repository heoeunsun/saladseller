 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
		<div id="fh5co-contact">
			<div class="container">
				<div class="col-md-6 animate-box">
					<h3>Join</h3>
					<form name="joinForm" action="join" method="post">
						<div class="row form-group">
							<div class="col-md-6">
								<input type="text" name="id" class="form-control" placeholder="id">
								<input type="password" name="pw" class="form-control" placeholder="password">
								<input type="text" name="email" class="form-control" placeholder="e-mail">
								<input type="text" name="addr" class="form-control" placeholder="address" >
								<input type="text" name="phone" class="form-control" placeholder="phone number">
							</div>
						</div>

						<div class="form-group">
							<input type="submit" value="submit" class="btn btn-primary" onclick="return joinCheck()">
							<input type="button" value="reset" class="btn btn-primary" onclick="location.href='joinForm'">
						</div>
					</form>
				</div>
			</div>
		</div>
<script type="text/javascript">
function joinCheck() {
	if (document.joinForm.id.value=='') {
		alert("아이디를 입력하세요.");
		return false
	}
	if (document.joinForm.pw.value=='') {
		alert("비밀번호를 입력하세요.");
		return false
	}
	if (document.joinForm.email.value=='') {
		alert("비밀번호를 입력하세요.");
		return false
	}
	if (document.joinForm.addr.value=='') {
		alert("배송받을 주소를 입력하세요.");
		return false
	}
	if (document.joinForm.phone.value=='') {
		alert("연락처를 입력하세요.");
		return false
	}
	return true;
}
</script>
<%@ include file="/layout/footer.jsp" %>
