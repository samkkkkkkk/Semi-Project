<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link href="css/common.css" rel="stylesheet"> -->
    <link href="css/minireset.css" rel="stylesheet">
    <link href="css/header.css" rel="stylesheet">
    <link href="css/loginsel3.css" rel="stylesheet">
</head>
<body>
    <header id="header">
    </header>
    <section id="container">
        <div class="login-header">
            <div class="login-logo">
                logo
            </div>
            <c:if test="${msg == 'loginFail'}">
                <div id="login-fail-msg">아이디 또는 비밀번호를 틀렸습니다.<br>
                    다시 시도해 주세요
                </div>
            </c:if>
            <c:if test="${msg == 'joinSuccess'}">
                <div id="join-success-msg">
                    회원 가입을 환영합니다!
                </div>
            </c:if>
        </div>
		<div class="container">
		    <div class="login-form">
		        <div class="titlebox">
		            로그인
		        </div>
		        <form method="post" name="loginForm">
		            <div class="form-group"><!--사용자클래스선언-->
		                <label for="id">아이디</label>
		                <input type="text" name="userId" class="form-control" id="id" placeholder="아이디">
		                </div>
		                <div class="form-group"><!--사용자클래스선언-->
		                <label for="id">비밀번호</label>
		                <input type="password" name="userPw" class="form-control" id="pw" placeholder="비밀번호">
		                </div>
		                <div class="form-group">
		                <button type="button" id="loginBtn" class="btn btn-login btn-block">로그인</button>
		                <button type="button" id="joinBtn" class="btn btn-join btn-block">회원가입</button>
		         	</div>
		         </form>
		       </div>
		    </div>                        
    </section>
    <script>
    	window.onload = () => {
            document.getElementById('loginBtn').onclick = () => {
            if (document.loginForm.userId.value === '') {
                alert('아이디를 입력하세요');
            }
            else if (document.loginForm.userPw.value === '') {
                alert('비밀번호를 입력하세요');
            }
            else {
                document.loginForm.submit();
            }
        }

            document.querySelector("#joinBtn").onclick = () => {
                location.href = "${pageContext.request.contextPath}/user/join"
            }
        }
    </script>
    <footer id="footer">
    </footer>

</body>
</html>
