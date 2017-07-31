<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var result = '${msg}';
	if(result == "SUCCESS"){
		alert("회원가입 성공");
		location.replace("loginForm");
	}else if(result == "FAIL"){
		alert("회원가입 실패");
		location.replace("joinForm");
	}
</script>
