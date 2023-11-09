<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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