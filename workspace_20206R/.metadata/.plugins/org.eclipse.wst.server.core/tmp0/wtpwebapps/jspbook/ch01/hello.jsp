<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<!-- 테이블 태그에 대해 알아본다 .  -->
<h2>KPU</h2>
<img
src="http://www.kpu.ac.kr/intro/img/intro/logo_1.png " alt = "KPU">
<br><br>

<table border="1">
	<tr>
		<th> 1 열 </th>
		<th> 2 열 </th>
		<th> 3 열 </th>
	</tr>
	<tr>
		<td rowspan="2"> 1행 1열 </td>
		<td> 1행 2열 </td>
		<td> 1행 3열 </td>
	</tr>
	<tr>
		<td> 2행 2열 </td>
		<td> 2행 3열 </td>
	</tr>
	<tr>
		<td colspan="3">3행 3열</td>
	</tr>
</table>

<body>
</html>	