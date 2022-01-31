<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
	<h2>로그인</h2>
	<form name="loginForm" action="login"  method="post">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input id="id" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button> 
					<c:if
						test="${message == 'error'}">
						<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if>
					<c:if test="${message == 'logout'}">
						<div style="color: red;">로그아웃되었습니다.</div>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
	
	<script>
	$(function() {
		$("#btnLogin").click(function() {
			userid = $("#id").val();
			var passwd = $("#password").val();
			if (userid == "") {
				alert("아이디를 입력하세요");
				$("#userid").focus(); //입력포커스 이동

				return; //함수 종료
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요");
				$("#passwd").focus();
				return;
			}
			//폼 내부의 데이터를 전송할 주소
			document.loginForm.submit(); //제출
		});
	});
</script>
</body>
</html>