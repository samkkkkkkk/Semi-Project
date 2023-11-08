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
                <form>
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
                          />
                        </td>
                      </tr>
                      <tr>
                        <td class="m-title">*비밀번호확인</td>
                        <td>
                          <input
                            class="formBox inputBox"
                            name="userPwChk"
                          />
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
                  <button class="btn">수정</button>
                  <button class="btn">목록</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
        
      <%@ include file="../include/footer.jsp" %>

    </div>
  </body>

</html>
