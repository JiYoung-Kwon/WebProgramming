<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kpu.web.club.domain.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과 화면</title>
<link rel="stylesheet" href="resources/student.css" type="text/css"></link>
</head>
<body>
	<header>2020 KPU Web Service Programming Community</header>
	<p id=sect><%=request.getAttribute("message")%><br>
	<div>
		<%
			StudentVO student =(StudentVO)request.getAttribute("student");
		%>
		<table>
			<tr>
				<th>계정</th>
				<th>이름</th>
				<th>학번</th>
				<th>학과</th>
				<th>핸드폰</th>
				<th>이메일</th>
			</tr>
			<tr>
				<td><%=student.getId() %></td>
				<td><%=student.getPasswd()%></td>
				<td><%=student.getSnum()%></td>
				<td><%=student.getDepart()%></td>
				<td><%=student.getMobile()%></td>
				<td><%=student.getEmail()%></td>
			</tr>
		</table>
	</div>
	
	<div>
		<p> <a href="http://localhost:8080/kwonjiyoung_mvcdb/StudentServlet?cmd=list" target="_self" > 전체 회원 목록 보기</a> </p>
	</div>
</body>
</html>