<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>여기다가 우리꺼 이름 넣을 예정</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
  </head>

  <body>
    <%@ include file="./include/header.jsp" %>
    <%@ include file="./include/sidebar.jsp" %>

        <div class="bodywrap">
          bodywrap
          <div id="map" style="width: 100%; height: 90%;"></div>

          <!-- 나재성이 만든 대충 테스트용 폼 -->
          <form id="myForm" action="${pageContext.request.contextPath}/api/req/" method="GET">
           	지역<input type="input" name="h1" value="11110640" />
            업종<input type="input" name="h2" value="I21201" />
            창업비용<input type="input" name="h3" value="31008018" />
            <button type="submit" id="checkBtn">조회</button>
          </form>
        </div>
        
        



        <script type="text/javascript" src="${reqUrl}?appkey=${serviceKey}&libraries=clusterer"></script>
        <script>
        var map;
        window.onload = function () {     
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        var lat = position.coords.latitude, // 위도
			            lon = position.coords.longitude; // 경도
			        
			        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			        
		            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		              mapOption = {
		                center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표 // 전달받은 첫번째 json을 가공해서 중심이 어디 있는지 표시하고
		                level: 1 // 지도의 확대 레벨
		              };
		
		            map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			            
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
			      });
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			    
			    var locPosition = new kakao.maps.LatLng(${ lat }, ${ lon }),    
			        message = 'geolocation을 사용할 수 없습니다.'
			        
			    displayMarker(locPosition, message);
			}
        }; // window.onload() 끝
          


          // 조회버튼
          document.getElementById('myForm').addEventListener('submit', function (e) {
            e.preventDefault(); // 폼 기본 동작인 페이지 새로고침 방지
            
            // 조회 전에 action 저장
            const originalAction = this.action;
            
            const $h1 = document.querySelector('input[name=h1]').value;
            const $h2 = document.querySelector('input[name=h2]').value;
            const $h3 = document.querySelector('input[name=h3]').value;

            this.action = this.action + $h1 + '/' + $h2+'/' + $h3; // 폼의 action 속성 변경
//			console.log(this.action);
            
            this.submit(); // 폼 데이터 서버로 전송
            
         	// 조회 후에 action 속성을 원래대로 초기화
            this.action = originalAction;
          }); // 조회버튼 끝
        </script>
  </body>

  </html>