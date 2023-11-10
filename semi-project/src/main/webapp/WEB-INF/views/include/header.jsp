<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>헤더입니다.</title>
    <!--개인 디자인 추가-->
    <link
      href="${pageContext.request.contextPath}/css/header.css"
      rel="stylesheet"
      type="text/css"
    />
  </head>

  <header>
    <!--헤더 시작-->
    <div class="box">
      <div class="headerWrap">
        <div class="headerStyle">
          <div class="textWrapper">
            <a href="${pageContext.request.contextPath}">businessMap</a>
          </div>
          <!-- 로그인 하기 전 -->
          <!--jstl로 변경-->
          <!-- <a
                  href="#"
                  class="loginButton"
                >
                  <span>로그인</span>q
                </a> -->

          <!-- 로그인 한 후 -->
          <!--사용자 이름 클릭 시 자바스크립트로 dropOut height 200px로 변경-->
          <ul class="dropOut">
            <li>
              <a href="#" id="userInfo">
                <span>로그인</span>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  fill="currentColor"
                  class="bi bi-list"
                  viewBox="0 0 16 16"
                >
                  <path
                    fill-rule="evenodd"
                    d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"
                  />
                </svg>
              </a>

              <!-- 사용자 이름 클릭 시 자바스크립트로 dropOutButton display: block 설정 -->
              <ul class="dropOutButton" style="display: none">
                <li>
                  <a href="#" class="dropOutButton-myInfo">
                    <span>내 정보</span>
                  </a>
                </li>
                <li>
                  <a href="#" class="dropOutButton-logout">
                    <span>로그아웃</span>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </header>
</html>
