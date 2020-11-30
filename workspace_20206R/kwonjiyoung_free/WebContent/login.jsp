<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>LogIn</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
</head>

<body>
	<div class="loginPage">
        	<h5><span>컴순이 다이어리</span>에 오신 것을 <br>환영합니다.</h5>
   		<hr />
   		<div id="imail">
            <i class="material-icons">person_outline</i>
        </div>
        <div id="ipw">
            <i class="material-icons">lock_outline</i>
        </div>
        <form action="http://localhost:8000/kwonjiyoung_free/MemberServlet?cmd=login" method="post">
            <input type="text" placeholder="아이디" name="id" required style="height:30px; width: 380px" /><br />
            <input type="password" placeholder="비밀번호" name="passwd" required style="height:30px; width: 380px" /><br />
            <input type="submit" value="로그인" class="login" />
            <button onclick="location.href='index.jsp';" class="login" >HOME</button>
        </form>
        <hr />
        <p><a href="register.html"><input type="button" value="회원가입" id="signup" /></a></p>
    </div>
</body>
</html>