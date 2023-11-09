<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>여기다가 우리꺼 이름 넣을 예정</title>
<link href="${pageContext.request.contextPath}/css/minireset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/side.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/searchSale.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/searchSale.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/header.css"
	rel="stylesheet" type="text/css">
</head>

<body>
	<%@ include file="./include/header.jsp"%>
	<%@ include file="./include/sidebar.jsp"%>

	<div id="container">
		<article id="saleList">
			<div id="saleList2">
				<div id="saleStatus">
					<h3>bizesNm 상권 조회</h3>
					<ul class="tabnav">
						<li>indsSclsNm 가맹점 총 : totalCount 개</li>
					</ul>
				</div>
				<!--api 조회 결과 표시 될 곳-->
				<div id="ListContents">
					<div>index bizesNm lnoAdr</div>
				</div>

				<!-- 부동산 정보 표시 될 곳 -->
				<div id="ListProperty">
					<div></div>
				</div>
			</div>
		</article>
		<article id="map"></article>
	</div>
	<article id="map2"></article>
	<%@ include file="./include/footer.jsp"%>



	<script type="text/javascript"
		src="${reqUrl}?appkey=${serviceKey}&libraries=clusterer"></script>
	<script>
	
	const body = JSON.parse('${body}'); // 서버 kakaoController에서 이미 자바스크립트에서 바로 사용할 수 있는 json 형태로 변환해서 사용가능
	const items = body.items;
//	console.log(items[0].adongNm);
	const property = JSON.parse('${property}');
//	console.log(property);
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		  center: new kakao.maps.LatLng(items[0].lat, items[0].lon), // 지도의 중심좌표 // 전달받은 첫번째 json을 가공해서 중심이 어디 있는지 표시하고
		  level: 1 // 지도의 확대 레벨
		};
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	var mapContainer2 = document.getElementById('map2'),
	mapOption2 = {
	  center: new kakao.maps.LatLng(property[0].latitude, property[0].longitude),
	  level: 1 // 지도의 확대 레벨
	};
	var map2 = new kakao.maps.Map(mapContainer, mapOption);
	
	
	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), contentNode = document.createElement('div'); // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
	
	var sprite = new kakao.maps.Point(40, 40); // 초기값 설정
	// 여기서 카페인지 은행인지 주유소인지 병원이지 등등등 을 items.indsLclsCd 랑 비교해서 마커 이미지 설정
	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커이미지의 주소입니다 //스프라이트 이미지
	  imageSize = new kakao.maps.Size(36, 36); // 마커이미지의 크기입니다

	var clusterer = new kakao.maps.MarkerClusterer({
		map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		minLevel: 5, // 클러스터 할 최소 지도 레벨 
		markers: [],
		gridSize: 50, // 클러스터의 그리드 크기 설정
		texts: getTexts,
		styles: [
		    // 클러스터 스타일을 커스터마이즈합니다
		    {
		      width: '72px',
		      height: '53px',
		      background: 'rgba(0, 0, 0, 0.7)',
		      color: '#ffffff',
		      borderRadius: '20%',
		      textAlign: 'center',
		      lineHeight: '53px',
		      cursor: 'pointer',
		      fontSize: '12px',
		      fontWeight: 'bold',
		    },
		  ],
	});
	var markers = [];
	  
// 페이지를 열자마자 바로 실행할 영역
	window.onload = function () {
		saleListSetUp();  
	
		// 상권 조회 api를 이용해서 items 반복문 시작
		items.forEach((item, index) => {
		    var markerPosition = new kakao.maps.LatLng(item.lat, item.lon); // 마커가 표시될 위치입니다
		    
		    // indsLclsCd의 값에 따라 spriteOrigin을 설정합니다.
		    if (item.indsLclsCd === 'I2') {
		    	sprite = new kakao.maps.Point(5, 160);
		    } else if (['L1', 'M1', 'N1'].includes(item.indsLclsCd)) {
		    	sprite = new kakao.maps.Point(5, 0);
		    } else if (['G2', 'R1', 'S2'].includes(item.indsLclsCd)) {
		    	sprite = new kakao.maps.Point(5, 40);
		    } else if (['I1', 'P1'].includes(item.indsLclsCd)) {
		    	sprite = new kakao.maps.Point(5, 200);
		    } else if (item.indsLclsCd === 'Q1') {
		    	sprite = new kakao.maps.Point(5, 80);
		    } else if (item.indsMclsCd === 'G214') {
		    	sprite = new kakao.maps.Point(5, 120);
		    } else {
		        // indsLclsCd 값이 위의 경우에 해당하지 않을 때의 기본값입니다.
		        sprite = new kakao.maps.Point(5, 0);
		    }
	        var imageOption = {  
		            spriteSize: new kakao.maps.Size(80, 230),
		            spriteOrigin: sprite
		        }; 
		    
		    // 마커를 생성합니다
		    marker = new kakao.maps.Marker({
		        position: markerPosition,
		        image: new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption) // 마커이미지 설정 
		    });
		 	// markers 배열에 마커 추가
		    markers.push(marker);

		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
		
		    // 마커에 클릭 이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', () => {
		        // 클릭한 마커에 대한 정보를 사용하여 커스텀 오버레이를 표시하는 함수를 호출합니다
		        displayPlaceInfo(item, index+1); // index 매개변수 추가
		    });
		});
		// 상권 조회 api를 이용해서 items 반복문 끝
		
		// 부동산 데이터베이스에서 뽑아온 위도, 경도를 이용한 마커 반복문 시작
		property.forEach((property, index) => {
		    var markerPosition = new kakao.maps.LatLng(property.latitude, property.longitude); // 마커가 표시될 위치입니다
		    
		    var imageSrc = '${pageContext.request.contextPath}/img/map-marker-icon_34392.png', // 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(44, 49), // 마커이미지의 크기입니다
            imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			  position: markerPosition,
			  image: markerImage // 마커이미지 설정 
			});
			
		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map2);
		
		    // 마커에 클릭 이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', () => {
		        // 클릭한 마커에 대한 정보를 사용하여 커스텀 오버레이를 표시하는 함수를 호출합니다
		        displayPlaceInfo2(property, index); // 부동산 관련 정보 인포
		    });
		});
		// 부동산 데이터베이스에서 뽑아온 위도, 경도를 이용한 마커 반복문 끝
		
		// 클러스터러에 마커들을 추가합니다
	    clusterer.addMarkers(markers);
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOP RIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	}; // window.onload() 끝


	// 조회 결과 대입
	var saleListSetUp = () => {
		document.querySelector('#saleStatus h3').innerText = items[0].adongNm + ' 상권 조회';
	    document.querySelector('#saleStatus .tabnav li').innerText = items[0].indsSclsNm+'가맹점 총 : '+body.totalCount+' 개';
	
	    // ListContents 내부를 비웁니다
	    const listContents = document.querySelector('#ListContents');
	    listContents.innerHTML = '';
	
	    // items 배열의 각 요소에 대해 div 생성 후 추가
	    items.forEach((item, idx) => {
	        const div = document.createElement('div');
	        div.innerHTML = '<div>'+idx+'. '+ item.bizesNm+ item.lnoAdr + '<button onclick="panTo(' + idx + ')">위치보기</button>'+'</div>';
	        listContents.appendChild(div);
	    });
	    
	    // listProperty 내부를 비웁니다
	    const listProperty = document.querySelector('#ListProperty');
	    listProperty.innerHTML = '';
	
	    // items 배열의 각 요소에 대해 div 생성 후 추가
	    property.forEach((property, idx) => {
	        const div = document.createElement('div');
	        div.innerHTML = '<div>' + idx + '. 서울특별시 '+ property.adstrdNm +' '+ property.excheGtn + '원' + '<button onclick="panTo(' + idx + ')">위치보기</button>'+'</div>';
	        listProperty.appendChild(div);
	    });
	};// 조회 결과 대입 끝
	
	
	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo(item) {
		contentNode.className = 'placeinfo_wrap'; // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	    var content = '<div class="placeinfo">' +
	                    '<a class="title" href="https://map.kakao.com/?q=' + item.lnoAdr + '" target="_blank" title="' + item.bizesNm + '">' + item.bizesNm + '</a>'+
	                    '<span title="' + item.lnoAdr + '">' + item.lnoAdr + '</span>' +
	                    '<span class="jibun" title="' + item.rdnmAdr + '">(지번 : ' + item.rdnmAdr + ')</span>'+
	                  '</div>'+
	                  '<div class="after"></div>';
	
	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new kakao.maps.LatLng(item.lat, item.lon));
	    placeOverlay.setMap(map);
	};
	
	function displayPlaceInfo2(property) {
		contentNode.className = 'placeinfo_wrap';
	    var content = '<div class="placeinfo">' +
	                    '<a class="title" href="https://map.kakao.com/?q=' + property.latitude + ' ' + property.longitude + '" target="_blank" title="' + property.adstrdNm + '">' + property.adstrdNm + '</a>'+
	                    '<span title="' + property.excheGtn + '">' + property.excheGtn + '</span>' +
	                  '</div>'+
	                  '<div class="after"></div>';
	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new kakao.maps.LatLng(property.latitude, property.longitude));
	    placeOverlay.setMap(map2);
	};
	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);
	
	var panTo = (idx) => {
		//열린 오버레이 정리
		placeOverlay.setMap(null);
		
		map.setLevel(1);
		
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(items[idx].lat, items[idx].lon);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}
	var panTo2 = (idx) => {
		placeOverlay.setMap(null);
		map2.setLevel(1);
	    var moveLatLon = new kakao.maps.LatLng(property[idx].latitude, property[idx].longitude);
	    map2.panTo(moveLatLon);            
	}
	
	// 지도가 확대 또는 축소되면 발동하는 이벤트
	kakao.maps.event.addListener(map, 'zoom_changed', function() {        
		placeOverlay.setMap(null);  
	});
	
	
    // 클러스터 내부에 삽입할 문자열 생성 함수입니다 
    function getTexts( count ) {
      // 한 클러스터 객체가 포함하는 마커의 개수에 따라 다른 텍스트 값을 표시합니다 
      return items[0].adongNm + ' ' + count + ' 개';        
    }
    
</script>
</body>

</html>