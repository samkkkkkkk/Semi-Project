<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/mainFooter.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/side.css" rel="stylesheet" type="text/css" />
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
		<c:if test="${userId == null}">
        <div class="caption">
          <h2>로그인하시면 더 많은 혜택을 경험할 수 있습니다.</h2>
        </div>
		</c:if>
      </section>
      <!--중간 세션 끝-->

      <!--사이드바 시작-->
      <section id="content2">
        <div class="sidebar" id="pointer">
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
            <form id="myForm" action="${pageContext.request.contextPath}/api/req/" method="GET">
              <input type="button" id="loc" class="b1" value="지역 선택" />
              <p id="p1">지역을 선택해 주세요.</p>
              <!--나중에 innerText 등 이용-->
              <input type="button" id="category" class="b1" value="업종 선택" />
              <p id="p2">업종을 선택해 주세요.</p>
              <input type="button" id="price" class="b1 pre" value="창업 비용" />
              <p id="p3">예상한 비용을 입력해 주세요.</p>
              <input type="hidden" name="h0" />
              <input type="hidden" name="h1" />
              <input type="hidden" name="h2" />
              <input type="hidden" name="h3" />
              <input type="submit" id="chkForm" class="btn" value="조회" />
            </form>
          </aside>
        </div>
        <!--사이드바 끝-->

        <!--메인 화면 지도 나타낼 곳-->
        <section id="content3">
          <div id="main-map"></div>
          <%@ include file="./include/modal.jsp" %>
        </section>
        <!--메인 지도 끝-->
      </section>

      <%@ include file="./include/footer.jsp"%>
    </div>
  </body>
  <script type="text/javascript" src="${reqUrl}?appkey=${serviceKey}&libraries=clusterer"></script>
  <script>
     window.onload = function () {     
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) { // 위치 정보를 가져오는 데 성공했을 때의 코드
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		        
		           var mapContainer = document.getElementById('main-map'), // 지도를 표시할 div 
		             mapOption = {
		               center: locPosition, // 지도의 중심좌표
		               level: 1 // 지도의 확대 레벨
		             };
		
		           var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		            
		           // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		           var content = 
		           	'<div class="customoverlay">' +
		             	'  <a href="https://map.kakao.com/?q=' + lat + ',' + lon + '" target="_blank">' +
		               '    <span class="title">현재 위치</span>' +
		               '  </a>' +
		               '</div>';
		
		           // 커스텀 오버레이를 생성합니다
		           var customOverlay = new kakao.maps.CustomOverlay({
		             map: map,
		             position: locPosition,
		             center: locPosition,
		             content: content,
		             yAnchor: 1
		           });
		           var imageSrc = '${pageContext.request.contextPath}/img/map-marker-icon_34392.png', // 마커이미지의 주소입니다    
		             imageSize = new kakao.maps.Size(44, 49), // 마커이미지의 크기입니다
		             imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
		           // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		           var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		
		           // 마커를 생성합니다
		           var marker = new kakao.maps.Marker({
		             position: locPosition,
		             image: markerImage // 마커이미지 설정 
		           });
		
		           // 마커가 지도 위에 표시되도록 설정합니다
		           marker.setMap(map);
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();
				
				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOP RIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
				
				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		      },
		    function(error){ // 위치 정보를 가져오는 데 실패했을 때의 코드
				var locPosition = new kakao.maps.LatLng(${lat}, ${lon}); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				var mapContainer = document.getElementById('main-map'), // 지도를 표시할 div 
		           mapOption = {
		             center: locPosition,
		             level: 1 // 지도의 확대 레벨
		           };
		         var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		         // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		         var content =
		        	 '<div class="customoverlay">' +
		        	 '  <a href="chrome://settings/content" target="_blank">' +
		        			 '    <span class="title">현재 위치 정보를 가져올 수 없습니다.</span>' +
        			 '  </a>' +
        			 '</div>';
		
       			 // 커스텀 오버레이를 생성합니다
       			 var customOverlay = new kakao.maps.CustomOverlay({
					map: map,
					position: locPosition,
					center: locPosition,
					content: content,
					yAnchor: 1
	             });
				var imageSrc = '${pageContext.request.contextPath}/img/map-marker-icon_34392.png', // 마커이미지의 주소입니다    
				  imageSize = new kakao.maps.Size(44, 49), // 마커이미지의 크기입니다
				  imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				  position: locPosition,
				  image: markerImage // 마커이미지 설정 
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
		    });
		} else { // HTML5의 GeoLocation이 지원이 안될 경우에 동작
			var mapContainer = document.getElementById('main-map'), // 지도를 표시할 div 
	           mapOption = {
	             center: new kakao.maps.LatLng(${lat}, ${lon}),
	             level: 1 // 지도의 확대 레벨
	           };
	         var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		}
	}; // window.onload() 끝
	
	// HTML의 form 요소를 가져옵니다.
	var form = document.getElementById('myForm');

	// form 요소에 'submit' 이벤트 리스너를 추가합니다.
	form.addEventListener('submit', function(event) {
	  // hidden input 요소들을 가져옵니다.
	  var h0 = document.querySelector('input[name="h0"]');
	  var h1 = document.querySelector('input[name="h1"]');
	  var h2 = document.querySelector('input[name="h2"]');
	  var h3 = document.querySelector('input[name="h3"]');

	  // 각 hidden input 요소의 value가 비어 있는지 확인합니다.
	  if (!h0.value || !h1.value || !h2.value || !h3.value) {
	    // 하나라도 value가 비어 있다면 경고 메시지를 표시하고,
	    alert("모든 선택을 실시해주세요");

	    // 'submit' 이벤트를 취소합니다.
	    event.preventDefault();
	  }
	});


</script>
</html>
