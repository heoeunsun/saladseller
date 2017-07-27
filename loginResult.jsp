<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var result = '${msg}';
	if(result == "SUCCESS"){
		alert("로그인 성공");
		location.replace("index");
	}else if(result == "FAIL"){
		alert("로그인 실패");
		location.replace("loginForm");
	}
</script>