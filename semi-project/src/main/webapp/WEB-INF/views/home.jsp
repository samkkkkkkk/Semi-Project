<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link
      href="${pageContext.request.contextPath}/css/header.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="${pageContext.request.contextPath}/css/side.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="${pageContext.request.contextPath}/css/main.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="${pageContext.request.contextPath}/css/mainFooter.css"
      rel="stylesheet"
      type="text/css"
    />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>사용자 첫페이지</title>
  </head>
  <body>
    <div id="container">
      <!--헤더 시작-->
      <%@ include file="./include/header.jsp"%>
      <!--헤더 끝-->

      <!--중간 세션 시작-->
      <section id="contents">
        <p id="content1">상권 분석 서비스</p>
        <h2>
          당신을 좋은 곳으로 <br />
          이끌어 줄 지도, 비즈니스맵
          <p id="app">
            <공지> businessMap앱 설치하고 <strong>혜택 알람</strong>받기!
          </p>
        </h2>
        <div class="caption">
          <h2>로그인하시면 더 많은 혜택을 경험할 수 있습니다.</h2>
        </div>
      </section>
      <!--중간 세션 끝-->

      <!--사이드바 시작-->
      <section id="content2">
        <h2 id="dream">
          고객님,<br />
          어떤 창업을 꿈꾸시나요?
        </h2>
        <aside id="sidebar">
          <h3>상권 조회</h3>
          <ul>
            <li>상권 비교 분석</li>
            <li>
              선택 업종과 선택 지역, 희망 비용을 통해<br />
              상권 조회와 매물 정보 제공
            </li>
          </ul>
          <form action="#">
            <input type="button" id="loc" class="b1" value="지역 선택" />
            <p id="">지역을 선택해 주세요.</p>
            <!--나중에 innerText 등 이용-->
            <input type="button" id="category" class="b1" value="업종 선택" />
            <p id="">업종을 선택해 주세요.</p>
            <input type="button" id="price" class="b1 pre" value="창업 비용" />
            <p id="">예상한 비용을 입력해 주세요.</p>
            <input type="button" id="" class="btn" value="조회" />
          </form>
        </aside>
        <!--사이드바 끝-->

        <!--메인 화면 지도 나타낼 곳-->
        <section id="content3">
          <img src="카카오맵.png" style="width: 800px; height: 620px" />
        </section>
        <!--메인 지도 끝-->
      </section>

      <%@ include file="./include/footer.jsp"%>
    </div>
  </body>
</html>
