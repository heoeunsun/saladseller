<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="service.SMTPAuthenticatior"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.util.*,java.io.*,javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<!-- 
<script>
	alert("");
	history.go(-1);
</script>
	 -->
<%
	request.setCharacterEncoding("utf-8");

	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String message = request.getParameter("message");
	String to = request.getParameter("to");

	Properties p = new Properties(); // 정보를 담을 객체

	p.put("mail.smtp.host", "smtp.naver.com");
	p.put("mail.smtp.port", "465");
	//p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	try {
		if (fname.equals("") || lname.equals("") || email.equals("") || subject.equals("") || message.equals("")
				|| to.equals("")) {
%>
<script>
	alert("입력 값 확인.");
	history.go(-1);
</script>
<%
	} else {
			Authenticator auth = new SMTPAuthenticatior();
			Session ses = Session.getInstance(p, auth);

			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체 

			msg.setSubject(subject); //  제목

			StringBuffer buffer = new StringBuffer();
			buffer.append("first name : ");
			buffer.append(fname + "<br>");
			buffer.append("last name : ");
			buffer.append(lname + "<br>");
			buffer.append("e-mail : ");
			buffer.append(email + "<br>");
			buffer.append("subject : ");
			buffer.append(subject + "<br>");
			buffer.append("message : ");
			buffer.append(message + "<br>");

			Address fromAddr = new InternetAddress(to); //보내는 이메일
			msg.setFrom(fromAddr);

			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

			msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용
			Transport.send(msg); // 전송
%>
<script>
	alert("전송 완료");
	history.go(-1);
</script>
<%
	}
	} catch (Exception e) {
		e.printStackTrace();
%>
<script>
	alert("전송 실패");
	history.go(-1);
</script>
<%
	return;
	}
%>