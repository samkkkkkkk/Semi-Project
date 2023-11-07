<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
      div {
        position: relative;
        border: 20px solid gray;
        width: 600px;
        height: 400px;
        margin: 200px auto;
        padding: 30px auto;
        top: 270px;
        left: 250px;
      }
      h2 {
        width: 150px;
        margin-left: 30px;
      }

      #sel1,
      #sel2,
      #sel3 {
        width: 180px;
        height: 48px;
        padding: 12px;
        border-radius: 8px;
        border: 1px solid #000;
        background: #fff;
        font-size: 18px;
        margin-left: 12px;
        color: #424242;
      }

      .in1 {
        width: 180px;
        height: 40px;
        bottom: -250px;
        border-radius: 12px;
      }

      .pri::-webkit-inner-spin-button {
        appearance: none;
        -moz-appearance: none;
        -webkit-appearance: none;
      }
      .pri::placeholder {
        text-align: right;
        font-size: large;
      }
      .pri::-webkit-inner-spin-button {
        margin-right: 5px;
      } 
      .pri {
        text-align: right;
        width: 300px;
        height: 40px;
        margin-bottom: 10px;
        border-radius: 2px;
        font-size: large;
      }
      #price {
        text-align: right;
        padding-right: 40px;
        font-size: large;
      }

      #modal3>p {
        width: 500px;
        height: 84px;
        margin: 10px auto 20px;
        padding: auto auto;
        border-radius: 2px;
        border: 10px solid rgb(224, 224, 224);
        background-color: rgb(224, 224, 224);
      }

      #res1,
      #res2,
      #res3 {
        margin-left: -80px;
        position: absolute;
        left: 130px;
        bottom: 40px;
        flex-shrink: 0;
        background-color: rgb(205, 203, 203);
        border: 0;
      }

      #res1:hover,
      #res2:hover,
      #res3:hover {
        background-color: rgb(102, 102, 102);
      }

      #sub1,
      #sub2,
      #sub3 {
        position: absolute;
        right: 60px;
        bottom: 40px;
        flex-shrink: 0;
        background-color: rgb(250, 229, 232);
        border: 0;
      }

      #sub1:hover,
      #sub2:hover,
      #sub3:hover {
        background-color: rgb(243, 128, 145);
      }

      #modal1,
      #modal2 {
        display: none;
      }
    </style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/semi" method="post">
      <input id="adr" type="button" value="지역" />
      <input id="sec" type="button" value="업종" />

      <div id="modal1">
        <h2>지역 선택</h2>
        <select name="siDo" id="sel1" class="sel"></select>
        <select name="siGunGu" id="sel2" class="sel"></select>
        <select name="eupMyeongDong" id="sel3" class="sel"></select>
        <input type="reset" value="취소" id="res1" class="in1" />
        <input type="submit" value="확인" id="sub1" class="in1" />
      </div>

      <div id="modal2">
        <h2>업종 선택</h2>
        <select name="sec1st" id="sel1" class="sel"></select>
        <select name="sec2nd" id="sel2" class="sel"></select>
        <select name="sec3rd" id="sel3" class="sel"></select>
        <input type="reset" value="취소" id="res2" class="in1" />
        <input type="submit" value="확인" id="sub2" class="in1" />
      </div>

      <div id="modal3">
        <h2>창업 비용</h2>
        <p>
          전세: 전세금 <br><br>
          월세: 보증금+(월차임x100),<br>단 이 때 계산된 금액이 5천만원 미만일 경우: 보증금+(월차임x70)
        </p>
        <article id="price">
          <input type="number" id="pri1" class="pri" placeholder="보증금" /> (원) <br>
          <input type="number" id="pri2" class="pri" placeholder="월세" /> (원) <br>
        </article>
        <input type="reset" value="취소" id="res3" class="in1">
        <input type="submit" value="확인" id="sub3" class="in1">
      </div>
    </form>
  </body>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    // 지역

    $('document').ready(function () {
      // 시/도 선택
      var adr0 = ['시/도 선택', '서울특별시'];
      // 구 선택
      var adr1 = [
        '강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구',
        '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구',
        '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구',
      ];
      // 동 선택
      var adr2 = [];

      // 시/도 선택 박스 초기화
      $('select[name^=siDo]').each(function () {
        $siDo = $(this);
        $.each(eval(adr0), function () {
          $siDo.append("<option value='" + this + "'>" + this + '</option>');
        });
        $siDo.next().append("<option value=''>구 선택</option>");
      });

      // 구 선택 박스 초기화
      $('select[name^=siGunGu]').each(function () {
        $siGunGu = $(this);
        $.each(eval(adr1), function () {
          $siGunGu.append(
            "<option value='" + this + "'>" + this + '</option>'
          );
        });
        $siGunGu.next().append("<option value=''>동 선택</option>");
      });

      // 시/도 선택시 구 설정
      $('select[name^=siDo]').change(function () {
          var adr =
              'adr' + $('option', $(this)).index($('option:selected', $(this))); // 선택지역의 중분류 Array
          var $siGunGu = $(this).next(); // 선택영역 구 객체
          var $eupMyeongDong = $siGunGu.next(); // 동 객체

          $('option', $siGunGu).remove(); // 구 초기화
          $('option', $eupMyeongDong).remove(); // 동 초기화

          if (adr == 'adr0') {
              $siGunGu.append("<option value=''>구 선택</option>");
              $eupMyeongDong.append("<option value=''>동 선택</option>");
          } else {
              $siGunGu.append("<option value=''>구 선택</option>");
              $eupMyeongDong.append("<option value=''>동 선택</option>");
              $.each(eval(adr), function () {
                  $siGunGu.append(
                      "<option value='" + this + "'>" + this + '</option>'
                  );
              });
          }
      });

      // 구 선택시 동 설정
      $('select[name^=siGunGu]').change(function () {
        const $siGunGu = document.querySelector('select[name=siGunGu]');
        const $eupMyeongDong = document.querySelector('select[name=eupMyeongDong]');

        const value1 = $siGunGu.options[$siGunGu.selectedIndex].textContent;
        const value2 = $eupMyeongDong.options[$eupMyeongDong.selectedIndex].textContent;

        const encodedValue = decodeURI(value1);

        fetch('${pageContext.request.contextPath}/select/administrativeCode/' + encodedValue)
        .then(res => res.json())
        .then(data => {

          var adr =
            'adr' + $('option', $(this)).index($('option:selected', $(this))); // 선택지역의 중분류 Array 
          var $dong = $(this).next();
          $('option', $dong).remove(); // 동 초기화
        
          if (adr == 'adr0')
            $eupMyeongDong.innerHTML = "<option value='동 선택'>동 선택</option>";
          else {
            $eupMyeongDong.innerHTML = "<option value='동 선택'>동 선택</option>";

            for (let i = 0; i < data.length; i++) {
                const eupMyeongDong = data[i].eupMyeongDong;
                const option = document.createElement('option');
                option.value = eupMyeongDong;
                option.textContent = eupMyeongDong;
                $eupMyeongDong.appendChild(option);
            }
          }

        });
      });

    });

    // 업종

    $('document').ready(function () {
      // 대분류
      var sector0 = [
        '대분류 선택',
        '교육 서비스업',
        '보건의료업',
        '부동산업',
        '사업시설 관리, 사업 지원 및 입대 서비스업',
        '소매업',
        '수리 및 개인 서비스업',
        '숙박업',
        '예술, 스포츠 및 여가관련 서비스업',
        '음식점업',
        '전문, 과학 및 기술 서비스업',
      ];
      // 중분류
      var sector1 = [
        '일반 교육기관', '기타 교육기관', '교육 지원 서비스업',
      ];
      var sector2 = ['병원', '의원', '기타 보건업',];
      var sector3 = ['부동산관련 서비스업',];
      var sector4 = [
        '사업시설 유지ㆍ관리 서비스업',
        '건물ㆍ산업설비 청소 및 방제 서비스업',
        '조경관리 및 유지 서비스업',
        '고용 알선 및 인력 공급업',
        '여행사 및 기타 여행 보조 서비스업',
        '사무 지원 서비스업',
        '기타 사업 지원 서비스업',
        '운송장비 대여업',
        '개인 및 가정용품 대여업',
        '산업용 기계 및 장비 대여업',
      ];
      var sector5 = [
        '자동차 부품 및 내장품 소매업',
        '모터사이클 및 부품 소매업',
        '종합 소매업',
        '식료품 소매업',
        '음료 소매업',
        '담배 소매업',
        '가전제품 및 정보 통신장비 소매업',
        '섬유, 의복, 신발 및 가죽제품 소매업',
        '철물, 공구, 창호 및 건설자재 소매업',
        '가구 소매업',
        '기타 생활용품 소매업',
        '문화, 오락 및 여가 용품 소매업',
        '연료소매업',
        '의약품, 의료용 기구, 화장품 및 방향제 소매업',
        '사무용 기기, 안경, 사진장비 및 정밀기기 소매업',
        '시계 및 귀금속 소매업',
        '예술품, 기념품 및 장식용품 소매업',
        '화초 및 식물 소매업',
        '애완용 동물 및 관련용품 소매업',
        '기타 상품 전문 소매업',
        '중고 상품 소매업',
      ];
      var sector6 = [
        '컴퓨터 및 주변 기기 수리업',
        '통신장비 수리업',
        '자동차 수리 및 세차업',
        '모터사이클 수리업',
        '가전제품 수리업',
        '기타 개인 및 가정용품 수리업',
        '이용 및 미용업',
        '욕탕, 마사지 및 기타 신체 관리 서비스업',
        '세탁업',
        '장례식장 및 관련 서비스업',
        '기타 개인서비스',
      ];
      var sector7 = ['일반 및 생활 숙박시설 운영업', '기타 숙박업',];
      var sector8 = [
        '도서관, 사적지 및 유사 여가관련 서비스업',
        '스포츠 서비스업',
        '유원지 및 기타 오락관련 서비스업',
      ];
      var sector9 = [
        '한식 음식점업',
        '중식 음식점업',
        '일식 음식점업',
        '서양식 음식점업',
        '동남아시아 음식점업',
        '기타 외국식 음식점업',
        '구내식당 및 뷔페',
        '기타 간이 음식점업',
        '주점업',
        '비알코올 음료점업',
      ];
      var sector10 = [
        '법무관련 서비스업',
        '회계 및 세무관련 서비스업',
        '광고업',
        '시장 조사 및 여론 조사업',
        '회사 본부 및 경영 컨설팅 서비스업',
        '건축 기술, 엔지니어링 및 관련 기술 서비스업',
        '수의업',
        '전문 디자인업',
        '사진 촬영 및 처리업',
        '인쇄 및 제품 제작업',
        '그 외 기타 전문, 과학 및 기술 서비스업',
      ];
      var sector11 = [];

      // 대분류 선택 박스 초기화
      $('select[name^=sec1st]').each(function () {
        $sec1st = $(this);
        $.each(eval(sector0), function () {
          $sec1st.append("<option value='" + this + "'>" + this + '</option>');
        });
        $sec1st.next().append("<option value=''>중분류 선택</option>");
      });

      // 중분류 선택 박스 초기화
      $('select[name^=sec2nd]').each(function () {
        $sec2nd = $(this);
        $.each(eval(sector1), function () {
          $sec2nd.append("<option value='" + this + "'>" + this + '</option>');
        });
        $sec2nd.next().append("<option value=''>소분류 선택</option>");
      });

      // 대분류 선택시 중분류 설정
      $('select[name^=sec1st]').change(function () {
          var sector =
              'sector' + $('option', $(this)).index($('option:selected', $(this))); // 선택지역의 중분류 Array
          var $sec2nd = $(this).next(); // 선택영역 중분류 객체
          var $sec3rd = $sec2nd.next(); // 소분류 객체

          $('option', $sec2nd).remove(); // 중분류 초기화
          $('option', $sec3rd).remove(); // 소분류 초기화

          if (sector == 'sector0') {
              $sec2nd.append("<option value=''>중분류 선택</option>");
              $sec3rd.append("<option value=''>소분류 선택</option>");
          } else {
              $sec2nd.append("<option value=''>중분류 선택</option>");
              $sec3rd.append("<option value=''>소분류 선택</option>");
              $.each(eval(sector), function () {
                  $sec2nd.append(
                      "<option value='" + this + "'>" + this + '</option>'
                  );
              });
          }
      });

      // 중분류 선택시 소분류 설정 (DB에서 가져오기)
      $('select[name^=sec2nd]').change(function () {
        const $sec2nd = document.querySelector('select[name=sec2nd]');
        const $sec3rd = document.querySelector('select[name=sec3rd]');

        const value1 = $sec2nd.options[$sec2nd.selectedIndex].textContent;
        const value2 = $sec3rd.options[$sec3rd.selectedIndex].textContent;

        const encodedValue = decodeURI(value1);

        fetch('${pageContext.request.contextPath}/select/job/' + encodedValue)
        .then(res => res.json())
        .then(data => {

          var sector =
            'sector' + $('option', $(this)).index($('option:selected', $(this))); // 선택지역의 중분류 Array 
          var $sector3rd = $(this).next();
          $('option', $sector3rd).remove(); // 소분류 초기화

          if (sector == 'sector0')
            $sec3rd.innerHTML = "<option value='소분류 선택'>소분류 선택</option>";
          else {
            $sec3rd.innerHTML = "<option value='소분류 선택'>소분류 선택</option>";

            for (let i = 0; i < data.length; i++) {
                const smallCategoryName = data[i].smallCategoryName;
                const option = document.createElement('option');
                option.value = smallCategoryName;
                option.textContent = smallCategoryName;
                $sec3rd.appendChild(option);
            }
          }
        });

      });

    });

    // 지역 버튼 이벤트 부여
    document.getElementById('adr').onclick = () => {
      // 로그인 여부 판단
      // const id = document.getElementById('id').value;
      // const pw = document.getElementById('pw').value;

      // if (id === '' || pw === '') {
      //   alert('로그인을 해주세요!');
      //   return;
      // }

      document.getElementById('modal1').style.display = 'block';
    };

    // 업종 버튼 이벤트 부여
    document.getElementById('sec').onclick = () => {
      // 로그인 여부 판단
      // const id = document.getElementById('id').value;
      // const pw = document.getElementById('pw').value;

      // if (id === '' || pw === '') {
      //   alert('로그인을 해주세요!');
      //   return;
      // }

      document.getElementById('modal2').style.display = 'block';
    };

    // 취소 버튼 이벤트 부여
    document.getElementById('res1').onclick = () => {
      document.getElementById('modal1').style.display = 'none';
    };
    document.getElementById('res2').onclick = () => {
      document.getElementById('modal2').style.display = 'none';
    };
    document.getElementById('res3').onclick = () => {
      document.getElementById('modal3').style.display = 'none';
    };
  </script>
</body>
</html>