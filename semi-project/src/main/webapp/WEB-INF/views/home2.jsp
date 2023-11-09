<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link
      href="${pageContext.request.contextPath}/css/side.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="${pageContext.request.contextPath}/css/search.css"
      rel="stylesheet"
      type="text/css"
    />
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0"
    />
    <title>사용자 조회페이지</title>
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
      <!--중간 세션 시작-->

      <section id="content2">
        <h2 id="dream">
          고객님의<br />
          상권 조회 내역입니다.
        </h2>
        <%@ include file="./include/sidebar.jsp" %>

        <div id="btn">
          <button
            type="button"
            id="btnId1"
            class="btn1"
          >
            상권 현황
          </button>
          <button
            type="button"
            id="btnId2"
            class="btn1"
          >
            매물
          </button>
        </div>

        <!--컨텐츠1 시작-->
        <div id="shopList">
          <article id="article3">
          <div id="map">
          	<img
              src="카카오맵.png"
              style="width: 650px; height: 448px"
            />
          </div>
          </article>

          <article
            id="article2"
            class="ottdiv ottif"
          >
            <img
              src="상권이미지-removebg-preview.png"
              id="image"
            />
            <h2 id="search">상권 조회</h2>

            <div id="foodList">
              <strong id="foodTitle">한식 가맹점 총 수</strong>
              <!--상권 조회시 푸드 리스트 반복문 자바스크립트로 돌릴 곳-->
              <div id="foodListSpan">
                <div id="">국수 / 칼국수 --<span> 28개</span></div>
              </div>
            </div>
          </article>
        </div>
        <!--컨텐츠1 끝-->

        <!--컨텐츠2 시작 기본값 : display none임-->
        <article id="saleList">
          <div id="saleList2">
            <div id="saleStatus">
              매물 현황 보고서
              <ul class="tabnav">
                <li>매물 12</li>
                <li>평균 1억 5000만원</li>
              </ul>
            </div>
            <!--자바스크립트로 반복문 돌릴 곳-->`
            <div id="ListContents">
              <div>
                <span>1.</span> <span>서울특별시 종로구 혜화동</span
                ><span> 9000만원</span>
              </div>
            </div>
          </div>
        </article>

        <article id="map">
          <img
            src="카카오맵.png"
            style="width: 600px; height: 448px"
          />
        </article>
        <!--컨텐츠2 끝-->
      </section>

      <%@ include file="./include/footer.jsp"%>
      <script>
        //로그인 드롭다운 이벤트
        let flag = false;
        document.getElementById('userInfo').onclick = function (e) {
          // console.log('이벤트 발생!');
          if (!flag) {
            document.querySelector('.dropOut').style.height = '200px';
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
        document
          .querySelector('.dropOutButton')
          .addEventListener('mouseout', (e) => {
            console.log('mouseout event occurred!');
            e.target.style.backgroundColor = 'transparent';
          }); //로그인 드롭다운 버튼 이벤트 끝

        //매물 버튼에 따라 페이지 전환하기
        document.getElementById('btnId2').addEventListener('click', (e) => {
          document.getElementById('saleList').style.display = 'block';
          document.getElementById('map').style.display = 'block';
          document.getElementById('shopList').style.display = 'none';
        });

        document.getElementById('btnId1').addEventListener('click', (e) => {
          document.getElementById('saleList').style.display = 'none';
          document.getElementById('map').style.display = 'none';
          document.getElementById('shopList').style.display = 'block';
        });
      </script>
    </div>
  </body>
</html>
