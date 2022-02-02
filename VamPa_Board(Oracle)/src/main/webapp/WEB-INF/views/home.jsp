<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous" charset="utf-8"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta charset="UTF-8" />	
	<script	defer src="${pageContext.request.contextPath}/js/common.js"></script>
</head>
<body>

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<c:if test="${loginUser != null }">
	<p>${loginUser.id }님 환영합니다.</p>
</c:if>


<script>
/*  굳이 c:out 번거롭게 사용하는 이유는 html 문자 탈락시키는 기능, 엄격한 태그 규칙, 개행 문자 파싱의 차이, 보다 나은 보안성 등의 이점이 있기 때문 */
    $(document).ready(function(){
    	let result = '<c:out value="${result}"/>';
   	    checkAlert(result);
   	    
   	    function checkAlert(result){
   	        if(result === ''){
   	            return;
   	        }
   	        if(result === "loginSuccess"){
   	            alert("loginSuccess");
   	        }
   	        else if(result === "loginFail"){
   	            alert("loginFail");
   	        }
   	    } 
    });



</script>
</body>
</html>