<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0"
        />
        <title>Document</title>
    
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
          }
    
          .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
          }
    
          section {
            background-color: #f5f5f5;
            padding: 20px;
          }
    
          .titlebox {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 40px;
            text-align: center;
          }
    
          .toggleBox {
            background-color: rgb(50, 96, 122);
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            height: 30px;
            margin-bottom: 20px;
          }
    
          .toggleBox a {
            text-decoration: none;
            margin-right: 10px;
            color: #fff;
            font-size: 20px;
            font-weight: bold;
          }
    
          .toggleBox span:hover {
            color: #f9f9f9;
          }
          .tab-content {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
          }
    
          .m-control .m-title {
            font-weight: bold;
            padding-right: 10px;
            vertical-align: top;
          }
    
          .form-control.input-sm,
          .sel {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
          }
    
          .sel {
            width: 49%;
            display: inline;
          }
    
          .titlefoot {
            margin-top: 20px;
            text-align: center;
          }
    
          .btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin: 0 10px;
          }
    
          .btn:hover {
            background-color: #0056b3;
          }
          #info {
            width: 60%;
            margin: 0 auto;
          }
        </style>
      </head>
      <body>
        <section>
          <div class="container">
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
                              class="form-control input-sm"
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
                              class="form-control input-sm"
                              name="userName"
                              value="${userInfo.userName}"
                            />
                          </td>
                        </tr>
                        <tr>
                          <td class="m-title">*비밀번호</td>
                          <td>
                            <input
                              class="form-control input-sm"
                              name="userPw"
                            />
                          </td>
                        </tr>
                        <tr>
                          <td class="m-title">*비밀번호확인</td>
                          <td>
                            <input
                              class="form-control input-sm"
                              name="userPwChk"
                            />
                          </td>
                        </tr>
                        <tr>
                          <td class="m-title">*E-mail</td>
                          <td>
                            <input
                              class="form-control input-sm"
                              name="userEmail1"
                              value="${userInfo.userEmail1}"
                            />
                            <select
                              class="form-control input-sm sel"
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
      </body>
    </html>
    