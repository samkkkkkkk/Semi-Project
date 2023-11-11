<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<head>
  <link
    href="${pageContext.request.contextPath}/css/header.css"
    rel="stylesheet"
  />
  <link
    href="${pageContext.request.contextPath}/css/footer.css"
    rel="stylesheet"
  />
</head>
<!--헤더 시작-->
<div class="box">
  <div class="headerWrap">
    <div class="headerStyle">
      <div class="textWrapper"><a href="${pageContext.request.contextPath}/">businessMap</a></div>

      <c:if test="${userId == null}">
        <!-- 로그인 하기 전 -->
        <a
          href="${pageContext.request.contextPath}/user/login"
          class="loginButton"
        >
          <span>로그인</span>
        </a>
      </c:if>
      <c:if test="${userId != null}">
        <!-- 로그인 한 후 -->
        <!--사용자 이름 클릭 시 자바스크립트로 dropOut height 200px로 변경-->
        <ul class="dropOut">
          <li>
            <a
              href="#"
              id="userInfo"
            >
              <span>${userName}님</span>
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
            <ul
              class="dropOutButton"
              style="display: none"
            >
              <li>
                <a
                  href="${pageContext.request.contextPath}/user/mypage"
                  class="dropOutButton-myInfo"
                >
                  <span>내 정보</span>
                </a>
              </li>
              <li>
                <a
                  href="${pageContext.request.contextPath}/user/logout"
                  class="dropOutButton-logout"
                >
                  <span>로그아웃</span>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </c:if>
    </div>
  </div>
</div>
<!--헤더 끝-->

<script>
  let flag = false;
  <c:if test="${userId != null}">
	  document.getElementById('userInfo').onclick = function () {
	    // console.log('이벤트 발생!');
	    if (!flag) {
	      document.querySelector('.dropOut').style.height = '180px';
	      document.querySelector('.dropOutButton').style.display = 'block';
	      // console.log('alter styles! + flag: ', flag);
	      flag = true;
	      return;
	    } else {
	      document.querySelector('.dropOut').style.height = '50px';
	      document.querySelector('.dropOutButton').style.display = 'none';
	      // console.log('delete styles! + flag: ', flag);
	      flag = false;
	      return;
	    }
	  };
	
	  document
	    .querySelector('.dropOutButton')
	    .addEventListener('mouseover', (e) => {
	      console.log('mouseover');
	      console.log(e.target);
	      e.target.style.backgroundColor = '#d9d9d9';
	    });
	  document.querySelector('.dropOutButton').addEventListener('mouseout', (e) => {
	    console.log('mouseout event occurred!');
	    e.target.style.backgroundColor = 'transparent';
	  });
  </c:if>
</script>
