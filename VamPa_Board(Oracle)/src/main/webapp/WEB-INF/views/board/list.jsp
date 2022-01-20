<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<h1>목록페이지입니다.</h1>
<a href="/board/enroll">게시판 등록</a>

<script>
/*  굳이 c:out 번거롭게 사용하는 이유는 html 문자 탈락시키는 기능, 엄격한 태그 규칙, 개행 문자 파싱의 차이, 보다 나은 보안성 등의 이점이 있기 때문 */
    $(document).ready(function(){
    	let result = '<c:out value="${result}"/>';
   	    checkAlert(result);
   	    
   	    function checkAlert(result){
   	        if(result === ''){
   	            reutrn;
   	        }
   	        if(result === "enrol success"){
   	            alert("등록이 완료되었습니다.");
   	        }
   	    } 
    });
 
</script>
</body>
</html>