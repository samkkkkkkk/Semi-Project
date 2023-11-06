<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <style>
    /* Reset some default margin and padding for better layout */
    body, h1, h2, p, ul, li {
      margin: 0;
      padding: 0;
    }

    /* Style the section */
    section {
      background-color: aliceblue;
      padding: 20px;
    }

    /* Style the container */
    .container {
      max-width: 960px;
      margin: 0 auto;
      padding: 10px;
    }

    /* Style the title */
    /* .titlebox {
        background-color: rgb(50, 96, 122);
        color: #fff;
        padding: 10px;
        border-radius: 5px;
      } */

    .titlebox p:nth-child(1) {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 40px;
      text-align: center;
    }

    .toggleBox {
      background-color: rgb(70, 130, 180);
      color: #fff;
      padding: 10px;
      border-radius: 5px;
      height: 30px;
    }

    .toggleBox a {
      text-decoration: none;
      margin-right: 10px;
      color: #fff;
      font-size: 20px;
      font-weight: bold;
      height: 30px;
      width: 100px;
    }

    .toggleBox span:hover {
      color: #f9f9f9;
    }

    /* Style the hr */
    /* hr {
        border: 1px solid rgb(50, 96, 122);
      } */

    /* Style the user info paragraph */
    p {
      font-size: 16px;
      margin-top: 20px;
    }

    /* Style the table */
    .table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    /* Style the table headers */
    .table th {
      /* background-color: rgb(50, 96, 122); */
      /* color: #fff; */
      color: #000;
      padding: 10px;
      border-bottom: 2px solid rgb(50, 96, 122);
    }

    /* Style the table cells */
    .table td {
      padding: 10px;
      text-align: center;
      border-bottom: 1px solid rgb(50, 96, 122);
    }

    /* Style the table links */
    .table a {
      text-align: center;
      text-decoration: none;
      color: #000;
    }

    /* Hover effect on table rows */
    .table tbody tr:hover {
      background-color: #e0e0e0;
    }

    .table tbody button {
      width: 50px;
      height: 35px;
      line-height: 35px;
    }

    .pagination {
      display: flex;
      list-style: none;
      padding: 0;
      justify-content: center;
      align-items: center;
    }

    .pagination li {
      margin-top: 30px;
    }

    .pagination a {
      display: block;
      padding: 10px 15px;
      text-decoration: none;
      color: #333;
      background-color: #f9f9f9;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    .pagination a:hover {
      background-color: #ddd;
    }

    .pagination .prevNext a {
      color: #fff;
      /* Change the color for the "이전" and "다음" links */
      background-color: rgb(70, 130, 180);
      /* Change the background color for the "이전" and "다음" links */
      border-color: #007bff;
      /* Change the border color for the "이전" and "다음" links */
    }

    .pagination .active a {
      color: #fff;
      /* Change the color for the "이전" and "다음" links */
      background-color: rgb(70, 130, 180);
      /* Change the background color for the "이전" and "다음" links */
      border-color: #007bff;
      /* Change the border color for the "이전" and "다음" links */
    }
  </style>
</head>

<body>
  <section>
    <div class="container">
      <div class="row">
        <div class="titlebox">
          <p>USER INFORMATION</p>

          <div class="toggleBox">
            <a href="${pageContext.request.contextPath}/user/mypage"><span>내 정보</span></a>
            <a href="${pageContext.request.contextPath}/user/mypage/results"><span>조회기록</span></a>
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
              <c:forEach items="${resultList}" var="r">
              <tr>
                  <td>${r.rn}</td> <!-- 번호 -->
                  <td>
                    <a
                    href="#"
                    data-bno="${r.bno}"
                    data-location="${r.location}"
                    data-job-category="${r.jobCategory3}"
                    data-budget="${r.budget}"
                    onclick="onClickQuery(this)">${r.location}</a> <!-- 주소 -->
                  </td>
                  <td>${r.jobCategory3}</td> <!-- 업종 -->
                  <td><fmt:formatNumber value="${r.budget}" />원</td> <!-- 예산 -->
                  <td>
                    <button type="submit"
                    id="queryBtn"
                    data-bno="${r.bno}"
                    data-location="${r.location}"
                    data-job-category="${r.jobCategory3}"
                    data-budget="${r.budget}"
                    onclick="onClickQuery(this)">조회</button> <!-- 메인의 조회결과 페이지로  -->
                    <button type="button" id="deleteBtn" data-bno="${r.bno}" onclick="onClickDelete(this)">삭제</button>
                  </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
  <!-- 
    <button type="button">이전</button>
    <button type="button">1</button>
    <button type="button">2</button>
    <button type="button">다음</button> -->

  <ul class="pagination">
    <c:if test="${pc.prev}" >
    <li class="prevNext"><a href="${pageContext.request.contextPath}/user/mypage/results?pageNo=${pc.begin - 1}">이전</a></li>
    </c:if>
    
    <c:forEach var="i" begin="${pc.begin}" end="${pc.end}">
    <li class="${pc.page.pageNo == i ? 'active' : ''}"><a href="${pageContext.request.contextPath}/user/mypage/results?pageNo=${i}">${i}</a></li>
    </c:forEach>
    
    <c:if test="${pc.next}" >
    <li class="prevNext"><a href="${pageContext.request.contextPath}/user/mypage/results?pageNo=${pc.end + 1}">다음</a></li>
    </c:if>
  </ul>
</body>

<script>
  window.onload = () => {
    const msg = '${msg}';

    if (msg === 'deleteSuccess') {
      alert('삭제 성공!');
    }
  }

  const onClickQuery = (e) => {
    const bno = e.dataset.bno;
    const location = e.dataset.location;
    const jobCategory = e.dataset.jobCategory;
    const budget = e.dataset.budget;

    console.log('query bno: ', bno);
    console.log('location: ', location);
    console.log('jobCategory: ', jobCategory);
    console.log('budget: ', budget);
    window.location = '${pageContext.request.contextPath}/result' + `?location=\${location}&jobCategory=\${jobCategory}&budget=\${budget}`
  }

  const onClickDelete = (e) => {
    const bno = e.dataset.bno;
    console.log('delete bno: ', bno);

    if (confirm('삭제하시겠습니까?')) {
      window.location = '${pageContext.request.contextPath}/user/mypage/results/delete' + `?bno=\${bno}`
    }
  }
</script>

</html>
