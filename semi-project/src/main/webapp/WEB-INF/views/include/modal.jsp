<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모달창입니다.</title>
    <link href="${pageContext.request.contextPath}/css/modal.css" rel="stylesheet" type="text/css" />
</head>
<body>

      <div id="modal1">
        <h2 id="modalTitle">지역 선택</h2>
        <select name="siDo" id="sel1" class="sel"></select> 
        <select name="siGunGu" id="sel2" class="sel"></select>
        <select name="eupMyeongDong" id="sel3" class="sel"></select>
        <input type="reset" value="취소" id="res1" class="in1" />
        <input type="submit" value="확인" id="sub1" class="in1" />
      </div>

      <div id="modal2">
        <h2 id="modalTitle">업종 선택</h2>
        <select name="sec1st" id="sel1" class="sel"></select>
        <select name="sec2nd" id="sel2" class="sel"></select>
        <select name="sec3rd" id="sel3" class="sel"></select>
        <input type="reset" value="취소" id="res2" class="in1" />
        <input type="submit" value="확인" id="sub2" class="in1" />
      </div>

      <div id="modal3">
        <h2 id="modalTitle">창업 비용</h2>
        <p>
          환산 보증금이란? <br>
          환산 보증금을 기준으로 해당 지역별 상가 건물 임대차 보호법의 적용 대상 유무가 결정된다. <br>
          환산 보증금:&nbsp; <input type="text" id="conversion" placeholder="보증금 + (월세 * 100)" readonly> &nbsp;(원)
        </p>
        <article id="deposit">
          <input type="number" id="pri1" class="pri" placeholder="보증금" onkeyup="autoCal(this);" /> (원) <br>
          <input type="number" id="pri2" class="pri" placeholder="월세" onkeyup="autoCal(this);" /> (원) <br>
        </article>
        <input type="reset" value="취소" id="res3" class="in1">
        <input type="submit" value="확인" id="sub3" class="in1">
      </div>

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

      // p1 선택시 박스 초기화
      $
      
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
    document.getElementById('loc').onclick = () => {
      // 로그인 여부 판단
      // const id = document.getElementById('id').value;
      // const pw = document.getElementById('pw').value;

      // if (id === '' || pw === '') {
      //   alert('로그인을 해주세요!');
      //   return;
      // }

      document.getElementById('modal1').style.display = 'block';
      document.getElementById('modal2').style.display = 'none';
      document.getElementById('modal3').style.display = 'none';

      // 지역 버튼 클릭시 값 초기화
      $("select[name='siDo'] option:eq(0)").prop("selected", true);
      $("select[name='siGunGu'] option").remove();
      $("select[name='siGunGu']").append("<option value=''>구 선택</option>");
      $("select[name='eupMyeongDong'] option").remove();
      $("select[name='eupMyeongDong']").append("<option value=''>동 선택</option>");
    };

    // 업종 버튼 이벤트 부여
    document.getElementById('category').onclick = () => {
      // 로그인 여부 판단
      // const id = document.getElementById('id').value;
      // const pw = document.getElementById('pw').value;

      // if (id === '' || pw === '') {
      //   alert('로그인을 해주세요!');
      //   return;
      // }

      document.getElementById('modal1').style.display = 'none';
      document.getElementById('modal2').style.display = 'block';
      document.getElementById('modal3').style.display = 'none';

      // 업종 버튼 클릭시 값 초기화
      $("select[name='sec1st'] option:eq(0)").prop("selected", true);
      $("select[name='sec2nd'] option").remove();
      $("select[name='sec2nd']").append("<option value=''>중분류 선택</option>");
      $("select[name='sec3rd'] option").remove();
      $("select[name='sec3rd']").append("<option value=''>소분류 선택</option>");
    };

    // 가격 버튼 이벤트 부여
    document.getElementById('price').onclick = () => {
      // 로그인 여부 판단
      // const id = document.getElementById('id').value;
      // const pw = document.getElementById('pw').value;

      // if (id === '' || pw === '') {
      //   alert('로그인을 해주세요!');
      //   return;
      // }

      document.getElementById('modal1').style.display = 'none';
      document.getElementById('modal2').style.display = 'none';
      document.getElementById('modal3').style.display = 'block';

      // 가격 버튼 클릭시 값 초기화
      document.getElementById('pri1').value = null;
      document.getElementById('pri2').value = null;
      document.getElementById('conversion').value = null;
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

    // 확인 버튼 이벤트 부여
    document.getElementById('sub1').onclick = () => {
      const $siDo = document.querySelector('select[name=siDo]');
      const $siGunGu = document.querySelector('select[name=siGunGu]');
      const $eupMyeongDong = document.querySelector('select[name=eupMyeongDong]');

      const $siDoValue = $siDo.options[$siDo.selectedIndex].textContent;
      const $siGunGuValue = $siGunGu.options[$siGunGu.selectedIndex].textContent;
      const $eupMyeongDongValue = $eupMyeongDong.options[$eupMyeongDong.selectedIndex].textContent;

      if ($siDoValue === $("select[name='siDo'] option:eq(0)").val() ||
          $siGunGuValue === $("select[name='siGunGu'] option:eq(0)").val() ||
          $eupMyeongDongValue === $("select[name='eupMyeongDong'] option:eq(0)").val()) {
        alert('잘못된 지정 값입니다.');
        return;
      } else {
        if ($siDoValue && $siGunGuValue && $eupMyeongDongValue) {
          document.getElementById('p1').innerText = $siDoValue + ' ' + $siGunGuValue + ' ' + $eupMyeongDongValue;
        }
      }

      document.getElementById('modal1').style.display = 'none';
    };

    document.getElementById('sub2').onclick = () => {
      const $sec1st = document.querySelector('select[name=sec1st]');
      const $sec2nd = document.querySelector('select[name=sec2nd]');
      const $sec3rd = document.querySelector('select[name=sec3rd]');

      const $sec1stValue = $sec1st.options[$sec1st.selectedIndex].textContent;
      const $sec2ndValue = $sec2nd.options[$sec2nd.selectedIndex].textContent;
      const $sec3rdValue = $sec3rd.options[$sec3rd.selectedIndex].textContent;

      if ($sec1stValue === $("select[name='sec1st'] option:eq(0)").val() ||
          $sec2ndValue === $("select[name='sec2nd'] option:eq(0)").val() ||
          $sec3rdValue === $("select[name='sec3rd'] option:eq(0)").val()) {
        alert('잘못된 지정 값입니다.');
        return;
      } else {
        if ($sec1stValue && $sec2ndValue && $sec3rdValue) {
          document.getElementById('p2').innerText = $sec3rdValue;
        }
      }

      document.getElementById('modal2').style.display = 'none';
    };

    document.getElementById('sub3').onclick = () => {
      const $pri1 = document.getElementById('pri1').value;
      const $pri2 = document.getElementById('pri2').value;
      const $conversion = document.getElementById('conversion').value;

      const $pri1st = $pri1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
      const $pri2nd = $pri2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")

      if($pri1st === '') {
        alert('보증금을 입력해주세요.')
        return;
      } else if ($pri2nd === ''){
        alert('월세를 입력해주세요.')
        return;
      } else {
        if ($pri1st && $pri2nd) {
          document.getElementById('p3').innerText =
          '환산 보증금: ' + $conversion + '원\n' + '보증금: ' + $pri1st + '원, ' + '월세: ' + $pri2nd + '원';
        }
      }

      document.getElementById('modal3').style.display = 'none';
    };

    // 보증금 or 월세 입력시 이벤트 발생 (환산 보증금)
    function autoCal() {
      var pri1 = $("#pri1").val();
      var pri2 = $("#pri2").val();

      if (pri1 === '' || pri2 === '') {
        $("#conversion").val(null);
      } else {
        var result = parseFloat(pri1) + (parseFloat(pri2) * 100);
        var formattedResult = formatNumber(result);
        $("#conversion").val(formattedResult);
      }
    }

    function formatNumber(number) {
      var formatted = number.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
      return formatted.replace(/\.00$/, '');
    }
    
  </script>
</body>
</html>