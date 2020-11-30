<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="kpu.web.club.domain.*,kpu.web.club.persistence.*,java.util.List"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>스케줄러</title>
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
					<li><a href="http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=scheduler" accesskey="1" title="">스케줄러</a></li>
					<li class="current_page_item"><a href="index.jsp"
						onclick="alert('로그아웃되었습니다.');" accesskey="5" title="">로그아웃</a></li>
				</ul>
			</div>
		</div>
		<div id="scheduler" class="container">
			<p id="second">
				<%=session.getAttribute("sessionID")%>님의 스케줄러입니다.
			</p>
			<%
				java.util.Calendar cal = java.util.Calendar.getInstance(); //Calendar객체 cal생성
			int currentYear = cal.get(java.util.Calendar.YEAR); //현재 날짜 기억
			int currentMonth = cal.get(java.util.Calendar.MONTH);
			int currentDate = cal.get(java.util.Calendar.DATE);
			int year, month;
			String Year = request.getParameter("year"); //나타내고자 하는 날짜
			String Month = request.getParameter("month");
			if (Year == null && Month == null) { //처음 호출했을 때
				year = currentYear;
				month = currentMonth;
			} else { //나타내고자 하는 날짜를 숫자로 변환
				year = Integer.parseInt(Year);
				month = Integer.parseInt(Month);
				if (month < 0) {
					month = 11;
					year = year - 1;
				} //1월부터 12월까지 범위 지정.
				if (month > 11) {
					month = 0;
					year = year + 1;
				}
			}
			%>
			<table border=0>
				<!-- 달력 상단 부분  -->
				<tr>
					<td align=left width=200>
						<!-- 년 도-->
						<a
						href="http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=scheduler&year=<%out.print(year - 1);%>&month=<%out.print(month);%>">◀</a>
						<%
							out.print(year);
						%>년 <a
						href="http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=scheduler&year=<%out.print(year + 1);%>&month=<%out.print(month);%>">▶</a>
					</td>
					<td align=center width=300>
						<!-- 월 -->
						<a
						href="http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=scheduler&year=<%out.print(year);%>&month=<%out.print(month - 1);%>">◀</a>
						<%
							out.print(month + 1);
						%>월 <a
						href="http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=scheduler&year=<%out.print(year);%>&month=<%out.print(month + 1);%>">▶</a>
					</td>
					<td align=right width=200>
						<%
							out.print(currentYear + "-" + (currentMonth + 1) + "-" + currentDate);
						%>
					</td>
				</tr>
			</table>
			<table id="sche_table" border=1 cellspacing=0>
				<!-- 요일 -->
				<tr>
					<td width=100>일</td>
					<!-- 일=1 -->
					<td width=100>월</td>
					<!-- 월=2 -->
					<td width=100>화</td>
					<!-- 화=3 -->
					<td width=100>수</td>
					<!-- 수=4 -->
					<td width=100>목</td>
					<!-- 목=5 -->
					<td width=100>금</td>
					<!-- 금=6 -->
					<td width=100>토</td>
					<!-- 토=7 -->
				</tr>
				<!-- 날짜 -->
				<tr height=100>
					<%
						cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
					int startDay = cal.get(java.util.Calendar.DAY_OF_WEEK); //현재날짜의 요일(1~7)
					int end = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
					int br = 0; //7일마다 줄 바꾸기
					for (int i = 0; i < (startDay - 1); i++) { //처음 빈칸출력
						out.println("<td>&nbsp;</td>");
						br++;
						if ((br % 7) == 0) {
							out.println("<br>");
						}
					}
					for (int i = 1; i <= end; i++) { //날짜출력
						out.println("<td id = day>" + i + "<br>");
						//일정 추가
						int sday, smonth, syear;
						
						List<SchedulesVO> todoList = (List<SchedulesVO>) request.getAttribute("todoList");
						
						for (SchedulesVO vo : todoList) {
							sday = Integer.parseInt(vo.getSc_day());
							smonth = Integer.parseInt(vo.getSc_month());
							syear = Integer.parseInt(vo.getSc_year());
							
							if(year == syear && month+1 == smonth && i == sday)
							{
								out.println("<a href=\"http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=list&uid="+vo.getUid()+"\" >"+vo.getTitle()+"</a>");
								//out.println(vo.getTitle()+"<br>");
							}
						}
						
						out.println("</td>");
						br++;
						if ((br % 7) == 0 && i != end) {
							out.println("</tr><tr height=100>");
						}
					}
					while ((br++) % 7 != 0) //말일 이후 빈칸출력
						out.println("<td>&nbsp;</td>");
					%>
				</tr>
			</table>
			
		</div>
	</div>
</body>
</html>
