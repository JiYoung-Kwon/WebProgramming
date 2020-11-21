<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kpu.web.club.domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 목록</title>
<link rel="stylesheet" href="resources/student.css" type="text/css"></link>
</head>
<body>
	<header> Member List</header>
	<hr>
	<div>
		<p>
			<a href="http://localhost:8080/kwonjiyoung_mvcdb/welcome.html"
				target="_self"> 메인 페이지 이동</a>
		</p>
	</div>
	<table>
		<tr>
			<th>계정</th>
			<th>이름</th>
			<th>학번</th>
			<th>학과</th>
			<th>핸드폰</th>
			<th>이메일</th>
		</tr>

		<%
			List<StudentVO> studentList = (List<StudentVO>) request.getAttribute("studentList");
		for (StudentVO vo : studentList) {
		%>
		<tr>
			<td><a href="http://localhost:8080/kwonjiyoung_mvcdb/StudentServlet?cmd=update&id=<%=vo.getId()%>" target="_self"><%=vo.getId() %></a></td>
			<td><%=vo.getUsername()%></td>
			<td><%=vo.getSnum()%></td>
			<td><%=vo.getDepart()%></td>
			<td><%=vo.getMobile()%></td>
			<td><%=vo.getEmail()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>