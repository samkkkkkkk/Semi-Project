<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>첫페이지</title>
     <link href="${pageContext.request.contextPath}/css/MyPage.css" rel="stylesheet">
    <style>
    
      #container {
        width: 100%; /* 내용 전체의 너비 */
        padding: 0px;
      }
      #footer {
        width: 100%; /* 부모 요소의 너비와 똑같게  */
        background-color:  rgb(70, 130, 180);;
        clear: left; /* 플로팅 해제 */
      }
     
    </style>
  </head>
  <body>
    <div id="container">
      <%@ include file="../include/header.jsp" %>
      
      <section>
        <div class="row">
            <div class="titlebox">USER INFORMATION</div>
  
            <div class="toggleBox">
              <a href="${pageContext.request.contextPath}/user/mypage"><span>내 정보</span></a>
              <a href="${pageContext.request.contextPath}/user/mypage/results"><span>조회기록</span></a>
            </div>
  
            <div class="tab-content">
              <div
                id="info"
                class="tab-pane fade in active"
              >
                <p>*표시는 필수 입력 표시입니다</p>
                <form name="userForm" method="post">
                  <table class="table">
                    <tbody class="m-control">
                      <tr>
                        <td class="m-title">*ID</td>
                        <td>
                          <input
                            class="formBox inputBox"
                            name="userId"
                            value="${userInfo.userId}"
                            readonly
                          />
                        </td>
                      </tr>
                      <tr>
                        <td class="m-title">*이름</td>
                        <td>
                          <input
                            class="formBox inputBox"
                            name="userName"
                            value="${userInfo.userName}"
                          />
                        </td>
                      </tr>
                      <tr>
                        <td class="m-title">*비밀번호</td>
                        <td>
                          <input
                            class="formBox inputBox"
                            name="userPw"
                            type="password"
                          />
                          <span class="form-control" id="msgPw"></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="m-title">*비밀번호확인</td>
                        <td>
                          <input
                            class="formBox inputBox"
                            name="userPwChk"
                            type="password"
                          />
                          <span class="form-control" id="msgPw-c"></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="m-title">*E-mail</td>
                        <td>
                          <input
                            class="formBox inputBox email"
                            name="userEmail1"
                            value="${userInfo.userEmail1}"
                          />
                          <select
                            class="formBox inputBox sel"
                            name="userEmail2"
                          >
                            <option <c:if test="${userInfo.userEmail2 == '@naver.com'}">selected</c:if>>@naver.com</option>
                              <option <c:if test="${userInfo.userEmail2 == '@gmail.com'}">selected</c:if>>@gmail.com</option>
                              <option <c:if test="${userInfo.userEmail2 == '@daum.net'}">selected</c:if>>@daum.net</option>
                          </select>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </form>
  
                <div class="titlefoot">
                  <button class="btn" id="modifyBtn">수정</button>
                  <button class="btn" id="withdrawal">회원탈퇴</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
        
      <%@ include file="../include/footer.jsp" %>

    </div>
  </body>
  <script>
    let pwFlag;

    document.getElementById('modifyBtn').onclick = () => {
      const userForm = document.userForm;
      if (userForm.userName.value === '') {
        alart('이름은 필수값입니다.');
        return;
      }

      if (userForm.userPw.value != "" || userForm.userPwChk.value != "") {
        if (!pwFlag) {
          alert('비밀번호를 정확히 입력했는지 확인해주세요.');
          return;
        }
      }

      console.log();
      if (confirm('수정을 계속 진행하시겠습니까?')) {
        userForm.submit();
      }
      else return;
    }

    document.getElementById('withdrawal').onclick = () => {
      if (confirm('회원탈퇴를 계속 진행하시겠습니까?')) {
        alert('회원탈퇴가 완료되었습니다.');
        window.location = '${pageContext.request.contextPath}/user/withdrawal'
      }
    }

    // document.getElementById('mainBtn').onclick = () => {
    //     location.href = "${pageContext.request.contextPath}/";
    // }

    document.userForm.userPw.onkeyup = function () {
      var regex = /^[A-Za-z0-9+]{8,16}$/;
      if (regex.test(document.userForm.userPw.value)) {
        document.userForm.userPw.style.borderColor = "green";
        document.getElementById("msgPw").innerHTML = "사용가능합니다";
      } else {
        document.userForm.userPw.style.borderColor = "red";
        document.getElementById("msgPw").innerHTML = "비밀번호를 제대로 입력하세요.";
        pwFlag = false;

      }
    }
    document.userForm.userPwChk.onkeyup = function () {
      var regex = /^[A-Za-z0-9+]{8,16}$/;
      if (regex.test(document.userForm.userPwChk.value) && document.userForm.userPwChk.value == document.userForm.userPw.value) {
        document.userForm.userPwChk.style.borderColor = "green";
        document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
        pwFlag = true;
      } else {
        document.userForm.userPwChk.style.borderColor = "red";
        document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
        pwFlag = false;
      }
    } 
  </script>
</html>
