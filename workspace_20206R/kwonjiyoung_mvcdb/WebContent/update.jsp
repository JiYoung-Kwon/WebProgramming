<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kpu.web.club.domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="resources/student.css" type="text/css"></link>
</head>
<body>
	<div align ="center">
	<header> Member Update</header>
	<hr>
	<form action="http://localhost:8080/kwonjiyoung_mvcdb/StudentServlet?cmd=update" method="post">
	<%
		StudentVO student = (StudentVO)request.getAttribute("student");
	%>
	<fieldset>
		<legend> Information Update</legend>
		<ul>
			<li>ID : <input type="text" name="id" value = <%=student.getId() %> readonly></li>
			<li>PASSWORD : <input type="password" name="passwd" value = <%=student.getPasswd() %> autofocus></li>
			<li>USERNAME : <input type="text" name="username" value = <%=student.getUsername() %> ></li>
			<li>STUDENTNUMBER : <input type="text" name="snum" value = <%=student.getSnum() %> ></li>
			<li>DEPARTMENT : <input type="text" name="depart" value = <%=student.getDepart() %>></li>
			<li>MOBILE : <input type="text" name="mobile" value = <%=student.getMobile() %>></li>
			<li>EMAIL : <input type="text" name="email" value = <%=student.getEmail() %>></li>
		</ul>
	</fieldset>
	<br>
	<fieldset>
		<input type="submit" name="submit" value="최종 수정">
		<input type="reset" name="reset" value="다시 작성">
	</fieldset>
	</form>
	</div>
</body>
</html>