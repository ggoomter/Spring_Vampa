<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
        .id_ok{color:#03D65D; display: none;}		/* 공간도 존재하지 않게.  visibility:hidden은 공간은 존재함. */
		.id_already{color:#9C0432; display: none;}
        
    </style>

</head>
<body>
<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        
        <!-- 개인정보들이 들어있기때문에 post로 전달 -->
        <form name="joinForm" action="join" method="post">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="id" id="id" maxlength="20" autocomplete='off'>
                        <input type="button" name="idCheck" id="idCheck" value="중복확인" >
                        <div class="id_ok">사용 가능한 아이디입니다.</div>
						<div class="id_already">누군가 이 아이디를 사용하고 있어요.</div>
                    </td>

                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" id = "password" maxlength="15" autocomplete='off'>
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password"  name = "passwordConfirm" id = "passwordConfirm" maxlength="15" autocomplete='off'>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" id="name" maxlength="40" autocomplete='off'>
                    </td>
                </tr>
                    
   <!--              <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birth_yy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birth_mm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birth_dd" maxlength="2" placeholder="일" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="email_1" maxlength="30">@
                        <select name="email_2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" />
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" size="50" name="address"/>
                    </td>
                </tr> -->
            </table>
            <br>
            <input type="submit" value="회원가입"/>  <input type="button" value="취소">
        </form>
    </div>

	<script>
	$(function() {
		$("#idCheck").click(checkId);
	});

    function checkId(){
        let id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장

		/* ajax로 구현 */
        /*         $.ajax({
            url:'/user/idCheck', //Controller에서 인식할 주소
            type:'post', //POST 방식으로 전달
            data:{userId:id},
            success:function(outcome){
                console.log(outcome);
                if(outcome == 1){
                    $('.id_already').show();
                    $('.id_ok').hide();
                }else{
					$('.id_ok').show();
					$('.id_already').hide();
                }
            },
            error:function(){
                alert("에러입니다");
            }
        }); */


        /* fetch로 구현 */
        fetch('/user/idCheck' ,{
			method : 'post',
			headers: {
			    'Content-Type': 'application/json; charset=utf-8'
			},
			body : id,
        })
       	.then(response => response.text())	/*  객체로 다룬다. 우리는 문자열 하나만 받기때문에  .text()사용.   json형태면 .json()사용하여 오브젝트로 변환  */
        .then((response) =>{
             console.log('ajax로 서버에게 받아온 결과 : '+response);
	         if(response == '1'){
	            $('.id_already').show();
	            $('.id_ok').hide();
	        }else{
				$('.id_ok').show();
				$('.id_already').hide();
	        }
        })
       

        
    };
	</script>
</body>
</html>