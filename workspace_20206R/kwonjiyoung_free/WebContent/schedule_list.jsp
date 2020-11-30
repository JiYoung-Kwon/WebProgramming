<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kpu.web.club.domain.*,java.util.List"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"
	pageEncoding="UTF-8" />
<title>로그인 이후 첫 화면</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />

</head>
<body>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1>
					<a href="#">컴순이 다이어리</a>
				</h1>
			</div>
			<div id="menu">
				<ul>
					<li><a
						href="http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=scheduler"
						accesskey="1" title="">스케줄러</a></li>
					<li class="current_page_item"><a href="index.jsp"
						onclick="alert('로그아웃되었습니다.');" accesskey="5" title="">로그아웃 </a></li>
				</ul>
			</div>
		</div>
		<div id="banner" class="container">
			<p id="third">
				<%=session.getAttribute("sessionID")%>님의 일정입니다. <br>
				<table id="sc_list" border=1 cellspacing=0>
					<tr>
						<th>일정</th>
						<th>년</th>
						<th>월</th>
						<th>일</th>
						<th>시작 시간</th>
						<th>종료 시간</th>
					</tr>
					<%
						List<SchedulesVO> todoList = (List<SchedulesVO>) request.getAttribute("todoList");
					for (SchedulesVO vo : todoList) {
						if (Integer.parseInt(session.getAttribute("sessionUID").toString()) == vo.getUid()) {
					%>
					<tr>
						<td><%=vo.getTitle()%></td>
						<td><%=vo.getSc_year()%></td>
						<td><%=vo.getSc_month()%></td>
						<td><%=vo.getSc_day()%></td>
						<td><%=vo.getStart_time()%></td>
						<td><%=vo.getEnd_time()%></td>
					</tr>
					
				</table>
				<a id = "schedule_button" href="http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=updatelist&uid=<%=vo.getUid()%>">수정하기</a>
				<a id = "schedule_button" href="http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=delete&uid=<%=vo.getUid()%>">삭제하기</a>
				<%
						}
					}
					%>
			</p>
		</div>
	</div>

</body>
</html>
