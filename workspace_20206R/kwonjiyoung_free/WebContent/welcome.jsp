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
					<li><a href="http://localhost:8000/kwonjiyoung_free/SchedulesServlet?cmd=scheduler" accesskey="1" title="">스케줄러</a></li>
					<li class="current_page_item"><a href="index.jsp"
						onclick="alert('로그아웃되었습니다.');" accesskey="5" title="">로그아웃 </a></li>
				</ul>
			</div>
		</div>
		<div id="banner" class="container">
			<p id="third">
				<%=session.getAttribute("sessionID")%>님 환영합니다. <br>
			<table id="sc_list" border=1 cellspacing=0>
				<tr>
					<th>--- 전체 스케줄 목록 ---</th>
				</tr>
				<%
					List<SchedulesVO> todoList = (List<SchedulesVO>) request.getAttribute("todoList");
				for (SchedulesVO vo : todoList) {
				%>
				<tr>
					<td>
						<%=vo.getTitle()%>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<li>
				</p>
		</div>
	</div>
	<div id="page-wrapper">
		<div id="page" class="container">
			<div id="content">
				<div class="title">
					<h2>기능 설명</h2>
				</div>
				<p>이 웹사이트는 노트북을 사용하는 대학생들을 위해 만들어졌습니다. 노트북을 많이 사용하는 학생들을 위해 웹
					사이트를 제작하였습니다.</p>
				<div id="two-column">
					<div class="box1">
						<ul class="default">
							<li><a href="#">Vestibulum luctus venenatis dui</a></li>
							<li><a href="#">Integer rutrum nisl in mi</a></li>
							<li><a href="#">Etiam malesuada rutrum enim</a></li>
							<li><a href="#">Aenean elementum facilisis ligula</a></li>
							<li><a href="#">Ut tincidunt elit vitae augue</a></li>
						</ul>
						<a href="#" class="button button-small">Etiam posuere</a>
					</div>
					<div class="box2">
						<ul class="default">
							<li><a href="#">Vestibulum luctus venenatis dui</a></li>
							<li><a href="#">Integer rutrum nisl in mi</a></li>
							<li><a href="#">Etiam malesuada rutrum enim</a></li>
							<li><a href="#">Aenean elementum facilisis ligula</a></li>
							<li><a href="#">Ut tincidunt elit vitae augue</a></li>
						</ul>
						<a href="#" class="button button-small">Etiam posuere</a>
					</div>
				</div>

			</div>
			<div id="sidebar">
				<div class="title">
					<h2>사이드 바</h2>
				</div>
				<ul class="default">
					<li><a href="#">Vestibulum luctus venenatis dui</a></li>
					<li><a href="#">Integer rutrum nisl in mi</a></li>
					<li><a href="#">Etiam malesuada rutrum enim</a></li>
					<li><a href="#">Etiam malesuada rutrum enim</a></li>
					<li><a href="#">Aenean elementum facilisis ligula</a></li>
					<li><a href="#">Ut tincidunt elit vitae augue</a></li>
				</ul>
				<div class="section">
					<h3>Aenean elementum facilisis</h3>
					<p>Donec leo, vivamus fermentum nibh in augue praesent a lacus
						at urna congue rutrum.</p>
					<a href="#" class="button button-small">Etiam posuere</a>
				</div>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<div id="three-column" class="container">
			<div id="tbox1">
				<div class="title">
					<h2>뭘 넣을까 자기소개</h2>
				</div>
				<p>자기소개 페이지</p>
				<a href="#" class="button">Learn More</a>
			</div>
			<div id="tbox2">
				<div class="title">
					<h2>자기소개 2</h2>
				</div>
				<p>자기소개 페이지 2</p>
				<a href="#" class="button">Learn More</a>
			</div>
			<div id="tbox3">
				<div class="title">
					<h2>자기소개 3</h2>
				</div>
				<p>자기소개 페이지 3</p>
				<a href="#" class="button">Learn More</a>
			</div>
		</div>

	</div>
	<div id="wrapper2">
		<div class="container">
			<div class="title">
				<h2>웹 사이트에 오신 것을 환영합니다</h2>
			</div>
			<p>
				This is <strong>Soft String</strong>, a free, fully
				standards-compliant CSS template designed by <a
					href="http://templated.co" rel="nofollow">TEMPLATED</a>. The photos
				in this template are from <a href="http://fotogrph.com/">
					Fotogrph</a>. This free template is released under the <a
					href="http://templated.co/license">Creative Commons Attribution</a>
				license, so you're pretty much free to do whatever you want with it
				(even use it commercially) provided you give us credit for it. Have
				fun :)
			</p>
		</div>
	</div>
	<div id="copyright" class="container">
		<p>
			&copy; Untitled. All rights reserved. | Photos by <a
				href="http://fotogrph.com/">Fotogrph</a> | Design by <a
				href="http://templated.co" rel="nofollow">TEMPLATED</a>.
		</p>
		<ul class="contact">
			<li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
			<li><a href="#" class="icon icon-facebook"><span></span></a></li>
			<li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
			<li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
			<li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
		</ul>
	</div>
</body>
</html>
