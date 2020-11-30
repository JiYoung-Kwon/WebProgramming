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
				<%=session.getAttribute("sessionID")%>님의 일정 수정 <br>	
			<form action="http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=update" method="post">
			<fieldset id = "update_form">
				<ul>
					<%
					List<SchedulesVO> todoList = (List<SchedulesVO>) request.getAttribute("todoList");
					for (SchedulesVO vo : todoList) {
						System.out.println(vo.getUid());
						if (Integer.parseInt(session.getAttribute("sessionUID").toString()) == vo.getUid()) {
					%>
		
			<li>일정 : <input type="text" name="title" value = <%=vo.getTitle() %> readonly></li>
			<li>년 : <input type="text" name="sc_year" value = <%=vo.getSc_year() %> autofocus></li>
			<li>월 : <input type="text" name="sc_month" value = <%=vo.getSc_month() %> ></li>
			<li>일 : <input type="text" name="sc_day" value = <%=vo.getSc_day() %> ></li>
			<li>시작 시간 : <input type="text" name="start_time" value = <%=vo.getStart_time() %>></li>
			<li>종료 시간 : <input type="text" name="end_time" value = <%=vo.getEnd_time() %>></li>
			<%
			}
		}
		%>
		</ul>
	</fieldset>
	<br>
	<fieldset>
		<input type="submit" name="submit" value="최종 수정">
		<input type="reset" name="reset" value="다시 작성">
	</fieldset>
	</form>
		</div>
	</div>

</body>
</html>
