<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과 화면</title>
</head>
<body>
	<div><table>
	
	<tr><th> 계정 </th> <td> <%=request.getAttribute("id") %></td> </tr>
	<tr><th> 이름 </th> <td> <%=request.getAttribute("username") %></td> </tr>
	<tr><th> 학번 </th> <td> <%=request.getAttribute("snum") %></td> </tr>
	<tr><th> 학과 </th> <td> <%=request.getAttribute("depart") %></td> </tr>
	<tr><th> 핸드폰 </th> <td> <%=request.getAttribute("mobile") %></td> </tr>
	<tr><th> 이메일 </th> <td> <%=request.getAttribute("email") %></td> </tr>
	</table></div> 
</body>
</html>