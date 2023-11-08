<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0"
    />
    <title>첫페이지</title>

    <link
      href="${pageContext.request.contextPath}/css/MyPageResult.css"
      rel="stylesheet"
    />
    <style>
      html,
      body {
        height: 100%;
      }

      #container {
        width: 100%; /* 내용 전체의 너비 */
        padding: 0px;
      }
      #footer {
        width: 100%; /* 부모 요소의 너비와 똑같게  */
        background-color: rgb(70, 130, 180);
        clear: left; /* 플로팅 해제 */
      }
    </style>
  </head>
  <body>
    <div id="container">
      <%@ include file="../include/header.jsp" %>

      <section>
        <div class="resultContainer">
          <div class="row">
            <div class="titlebox">
              <p>USER INFORMATION</p>

              <div class="toggleBox">
                <a href="${pageContext.request.contextPath}/user/mypage"
                  ><span>내 정보</span></a
                >
                <a href="#"><span>조회기록</span></a>
              </div>

              <p>* 내 조회 기록 관리</p>

              <table class="table">
                <thead>
                  <tr>
                    <th>번호</th>
                    <th>지역</th>
                    <th>업종</th>
                    <th>비용</th>
                    <th>비고</th>
                  </tr>
                </thead>
                <!-- <hr /> -->
                <tbody>
                  <!--jstl 사용해서 -->
                  <c:forEach
                    items="${resultList}"
                    var="r"
                  >
                    <tr>
                      <td>${r.rn}</td>
                      <!-- 번호 -->
                      <td>
                        <a
                          href="#"
                          data-bno="${r.bno}"
                          data-location="${r.location}"
                          data-job-category="${r.jobCategory3}"
                          data-budget="${r.budget}"
                          onclick="onClickQuery(this)"
                          >${r.location}</a
                        >
                        <!-- 주소 -->
                      </td>
                      <td>${r.jobCategory3}</td>
                      <!-- 업종 -->
                      <td><fmt:formatNumber value="${r.budget}" />원</td>
                      <!-- 예산 -->
                      <td>
                        <button
                          class="btn"
                          type="submit"
                          id="queryBtn"
                          data-bno="${r.bno}"
                          data-location="${r.location}"
                          data-job-category="${r.jobCategory3}"
                          data-budget="${r.budget}"
                          onclick="onClickQuery(this)"
                        >
                          조회
                        </button>
                        <!-- 메인의 조회결과 페이지로  -->
                        <button
                          class="btn"
                          type="button"
                          id="deleteBtn"
                          data-bno="${r.bno}"
                          onclick="onClickDelete(this)"
                        >
                          삭제
                        </button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </section>

      <ul class="pagination">
        <c:if test="${pc.prev}">
          <li class="prevNext">
            <a
              href="${pageContext.request.contextPath}/user/mypage/results?pageNo=${pc.begin - 1}"
              >이전</a
            >
          </li>
        </c:if>

        <c:forEach
          var="i"
          begin="${pc.begin}"
          end="${pc.end}"
        >
          <li class="${pc.page.pageNo == i ? 'active' : ''}">
            <a
              href="${pageContext.request.contextPath}/user/mypage/results?pageNo=${i}"
              >${i}</a
            >
          </li>
        </c:forEach>

        <c:if test="${pc.next}">
          <li class="prevNext">
            <a
              href="${pageContext.request.contextPath}/user/mypage/results?pageNo=${pc.end + 1}"
              >다음</a
            >
          </li>
        </c:if>
      </ul>

      <%@ include file="../include/footer.jsp" %>
    </div>
  </body>

  <script>
    window.onload = () => {
      const msg = '${msg}';

      if (msg === 'deleteSuccess') {
        alert('삭제 성공!');
      }
    };

    const onClickQuery = (e) => {
      const bno = e.dataset.bno;
      const location = e.dataset.location;
      const jobCategory = e.dataset.jobCategory;
      const budget = e.dataset.budget;

      console.log('query bno: ', bno);
      console.log('location: ', location);
      console.log('jobCategory: ', jobCategory);
      console.log('budget: ', budget);
      window.location =
        '${pageContext.request.contextPath}/result' +
        `?location=\${location}&jobCategory=\${jobCategory}&budget=\${budget}`;
    };

    const onClickDelete = (e) => {
      const bno = e.dataset.bno;
      console.log('delete bno: ', bno);

      if (confirm('삭제하시겠습니까?')) {
        window.location =
          '${pageContext.request.contextPath}/user/mypage/results/delete' +
          `?bno=\${bno}`;
      }
    };
  </script>
</html>
