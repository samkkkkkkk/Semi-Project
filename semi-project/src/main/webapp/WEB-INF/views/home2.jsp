<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="${pageContext.request.contextPath}/css/side.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/search.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/mainFooter.css"
	rel="stylesheet" type="text/css" />
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>사용자 조회페이지</title>

<style>
.score-table {
	border-spacing: 10px;
	border-collapse: separate;
	width: 100%;
	height: auto;
	padding: 0;
}

.score-table tr, td {
	border: 1px solid black;
}

.text-result {
	height: 20%;
}

/* .canvas {
	width: 100%;
	height: 100%;
	font-size: 1px;
} */

.table-div {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.score-table td {
	text-align: center;
}

.score-table tr td:nth-child(1) {
	background-color: rgb(106, 133, 173);
}
</style>
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
				당신을 좋은 곳으로 <br /> 이끌어 줄 지도, 비즈니스맵
				<p id="app">
					<공지> businessMap앱 설치하고 <strong>혜택 알람</strong>받기! 
				</p>
			</h2>
			<div class="caption">
				<h2>로그인하시면 더 많은 혜택을 경험할 수 있습니다.</h2>
			</div>
		</section>
		<!--중간 세션 시작-->

      <section id="result_content2">
        <h2 id="dream">
          고객님의<br />
          상권 조회 내역입니다.
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
              <div>
	              <input type="submit" id="chkForm" class="btn" value="조회" />
	              <input type="submit" id="saveForm" class="btn" value="저장" />
              </div>
            </form>
        </aside>

			<div id="fix">
				<div id="btn">
					<button type="button" id="btnId1" class="btn1">상권 현황</button>
					<button type="button" id="btnId2" class="btn1">매물</button>
					<button type="button" id="btnId3" class="btn1">점수</button>
				</div>

				<!--컨텐츠 시작1 -  상권 현황-->
				<div id="shopList">
					<article id="article3">
						<div id="article3_map">지도</div>
					</article>

					<article id="article2" class="ottdiv ottif">
						<div id="shopList2">
							<div id="foodList">
								<div id="search">상권 조회</div>
								<strong id="foodTitle">한식 가맹점 총 수</strong>
								<!--상권 조회시 푸드 리스트 반복문 자바스크립트로 돌릴 곳-->
								<div id="foodListSpan">
									<div id="">
										국수 / 칼국수 --<span> 28개</span>
									</div>
								</div>
							</div>
						</div>
					</article>
				</div>
				<!--컨텐츠 끝1-->

          <!--컨텐츠2 시작 기본값 : display none임-->
          <article id="saleList">
            <div id="saleList2">
              <div id="saleStatus">
                매물 현황 보고서
                <ul class="tabnav">
                  <li>매물 </li>
                  <li>평균 </li>
                </ul>
              </div>
              <!--자바스크립트로 반복문 돌릴 곳-->`
              <div id="ListContents">
                <div>매물 조회 결과가 없습니다.</div>
              </div>
            </div>
          </article>

				<article id="map">
					<div id="map_map">지도</div>
				</article>
				<!--컨텐츠2 끝-->

				<!--컨텐츠3 시작 - 매물점수-->
				<article id="score">

					<div id="article_score">
						<div class="text-result" style="border: 1px black solid;">
							<p>상권 분석 결과</p>
						</div>

						<table class="score-table">
							<tbody>
							<colgroup>
								<col style="width: 10%;" />
								<col style="width: 40%;" />
								<col style="width: 50%;" />

							</colgroup>
							<tr>
								<td>상권</td>
								<td>총 가맹점 수</td>
								<td>
									<div class="table-div">
										<canvas id="commercial-canvas" class="canvas" width="400px" height="200px"></canvas>
									</div>

								</td>

							</tr>
							<tr>
								<td>매물</td>
								<td>평균 임대 비용</td>
								<td>
									<div class="table-div table-div-realestate">
										<canvas id="realestate-commercial-canvas"
											class="canvas realastate-canvas" width="400px" height="200px"></canvas>
									</div>
								</td>

							</tr>
							</tbody>
						</table>

						<!-- <h2 id="h2_score">매물 점수</h2>
              <div id="div_score">매물 점수 34점</div>
              <h2 id="h2_score2">상권 점수</h2>
              <div id="div_score2">상권 점수 34점</div>
              <h2 id="h2_score3">businessMap 분석 결과 보고서</h2>
              <div id="div_score3">비즈니스맵 분석 결과 보고서 입니다.</div>
          <!--컨텐츠3 끝-->
          <%@ include file="./include/modal.jsp" %>
        </div><!--fix id끝-->
      </section>
      <%@ include file="./include/footer.jsp"%>


	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script>
		
	
        //매물 버튼에 따라 페이지 전환하기
        document.getElementById('btnId2').addEventListener('click', (e) => {
          document.getElementById('saleList').style.visibility = 'visible';
          document.getElementById('map').style.visibility = 'visible';
          document.getElementById('shopList').style.visibility = 'hidden';
             document.getElementById('score').style.visibility = 'hidden';
        });

        document.getElementById('btnId1').addEventListener('click', (e) => {
          document.getElementById('saleList').style.visibility = 'hidden';
          document.getElementById('map').style.visibility = 'hidden';
          document.getElementById('shopList').style.visibility = 'visible';
             document.getElementById('score').style.visibility = 'hidden';
        });

        document.getElementById('btnId3').addEventListener('click', (e) => {
          document.getElementById('saleList').style.visibility = 'hidden';
          document.getElementById('shopList').style.visibility = 'hidden';
              document.getElementById('map').style.visibility = 'hidden';
          document.getElementById('score').style.visibility = 'visible';
        });
      
        const body_check = '${body}';
		let items = {};
		let body = {};
		let property_check = '${property}';
		if (!property_check) {
			property_check = '{}';
		}
		const property = JSON.parse(property_check);

        //console.log(body_check);
        if(body_check !== "NODATA_ERROR"){
			body = JSON.parse('${body}'); // 서버 kakaoController에서 이미 자바스크립트에서 바로 사용할 수 있는 json 형태로 변환해서 사용가능
			items = body.items;
			console.log(items[0].adongNm);
			console.log(property);
			
			var mapContainer = document.getElementById('article3_map'), // 지도를 표시할 div 
				mapOption = {
				center: new kakao.maps.LatLng(items[0].lat, items[0].lon), // 지도의 중심좌표 // 전달받은 첫번째 json을 가공해서 중심이 어디 있는지 표시하고
				level: 1 // 지도의 확대 레벨
				};
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 지도가 확대 또는 축소되면 발동하는 이벤트
			kakao.maps.event.addListener(map, 'zoom_changed', function() {        
				placeOverlay.setMap(null);
			});
		}else if(body_check == "NODATA_ERROR"){

			var mapContainer = document.getElementById('article3_map'), // 지도를 표시할 div 
			
			mapOption = {
			center: new kakao.maps.LatLng(property[0].latitude, property[0].longitude), // 지도의 중심좌표 // 전달받은 첫번째 json을 가공해서 중심이 어디 있는지 표시하고
			level: 1 // 지도의 확대 레벨
			};
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			document.querySelector('#search').innerText = property[0].adstrdNm + ' 상권 조회';
		}

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

			var mapContainer2 = document.getElementById('map_map'),
			mapOption2 = {
			center: new kakao.maps.LatLng(property[0].latitude, property[0].longitude),
			level: 1 // 지도의 확대 레벨
			};
			var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
			
			
			// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
			var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), contentNode = document.createElement('div'); // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
			
			var sprite = new kakao.maps.Point(40, 40); // 초기값 설정
			// places_category.png 스프라이트 이미지
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커이미지의 주소입니다 //스프라이트 이미지
			imageSize = new kakao.maps.Size(36, 36); // 마커이미지의 크기입니다

			var markers = [];
			// 지도가 확대 또는 축소되면 발동하는 이벤트
			kakao.maps.event.addListener(map2, 'zoom_changed', function() {        
				placeOverlay.setMap(null);
			});
    	  
    	// 페이지를 열자마자 바로 실행할 영역
    	window.onload = function () {
    		saleListSetUp();  

			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();
    	
			if(body_check !== "NODATA_ERROR"){
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

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOP RIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
				
				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	
			}
			
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
			
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map2.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	
			
    		// 부동산 데이터베이스에서 뽑아온 위도, 경도를 이용한 마커 반복문 끝
    		
    		// 클러스터러에 마커들을 추가합니다
    	    clusterer.addMarkers(markers);
    		
    		
    	}; // window.onload() 끝


    	// 조회 결과 대입
    	var saleListSetUp = () => {
			if(body_check !== "NODATA_ERROR"){
				document.querySelector('#search').innerText = items[0].adongNm + ' 상권 조회';
				document.querySelector('#foodTitle').innerText = items[0].indsSclsNm+'가맹점 총 : '+body.totalCount+' 개';
				// foodListSpan 내부를 비웁니다
				const listContents = document.querySelector('#foodListSpan');
				listContents.innerHTML = '';
			
				// items 배열의 각 요소에 대해 div 생성 후 추가
				items.forEach((item, idx) => {
					const div = document.createElement('div');
					div.innerHTML = (idx+1)+'. '+ item.bizesNm + '<button onclick="panTo(' + idx + ')">위치보기</button>';
					listContents.appendChild(div);
				});
			}
    	    
    		// ListContents 내부를 비웁니다
    	    const listProperty = document.querySelector('#ListContents');
    	    listProperty.innerHTML = '';
    	
    	    var propertyAverage = 0;
    	    var totalCount = 0;
    	    // Property 배열의 각 요소에 대해 div 생성 후 추가
    	    property.forEach((property, idx) => {
    	        const div = document.createElement('div');
    	        div.innerHTML = (idx+1) + '. 서울특별시 '+ property.adstrdNm +' '+ resultPrice(property.excheGtn) + '<button onclick="panTo2(' + idx + ')">위치보기</button>';
    	        listProperty.appendChild(div);
    	        propertyAverage +=property.excheGtn;
    	        totalCount=idx;
    	    });
    	    
          	document.querySelector('.tabnav li:first-child').innerText = '매물 '+(totalCount+1)+ '개';
    	    document.querySelector('.tabnav li:nth-child(2)').innerText = '평균가 ' + resultPrice(propertyAverage/(totalCount+1));
    	    
    	};// 조회 결과 대입 끝
    	
    	
    	
    	// 값 표현식
    	function resultPrice(number) {
    		var avgBillion = Math.floor(number / 100000000);
    	    var avgMillion = Math.floor((number % 100000000) / 10000);
    	    var result = '';
    	    if(avgBillion > 0){
    	        result += avgBillion.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '억 ';
    	    }
    	    if(avgMillion > 0){
    	        result += avgMillion.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '만원';
    	    }
    	    return result;
    	}
    	
    	
    	
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
    	                    '<span title="' + property.excheGtn + '">' + resultPrice(property.excheGtn) + '</span>' +
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
    	
    	
        // 클러스터 내부에 삽입할 문자열 생성 함수입니다 
        function getTexts( count ) {
          // 한 클러스터 객체가 포함하는 마커의 개수에 따라 다른 텍스트 값을 표시합니다 
          return items[0].adongNm + ' ' + count + ' 개';        
        }
        
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
        
        new Chart(document.getElementById("commercial-canvas"), {
    	    type: 'horizontalBar',
    	    data: {
    	        labels: ['평균 상권 개수', '조회 상권 개수'],
    	        datasets: [{
    	            
    	          label: {
    	                  display: false,
    	                },
    	            data: [5000000, 8000000],
    	            borderColor: "rgba(255, 201, 14, 1)",
    	            backgroundColor: ["rgba(32, 102, 207, 0.8)", "rgba(137, 14, 14, 0.75)"], 
    	            fill: false,
    	        }]
    	    },
    	    options: {
    	    
    	      legend: {
    	        display: false
    	    },
    	        responsive: false,
    	        title: {
    	            display: true,
    	            text: '상권 비교'
    	        },
    	        tooltips: {
    	            mode: 'index',
    	            intersect: false,
    	        },
    	        hover: {
    	            mode: 'nearest',
    	            intersect: true
    	        },
    	        scales: {
    	            xAxes: [{
    	                display: true,
    	                ticks: {
    	                  fontSize: 11,
    	                  fontColor: 'rgb(0,0,0)',
    	                  beginAtZero : true,
    	                   
    	                },
    	                scaleLabel: {
    	                    display: true,
    	                },
    	            }],
    	            yAxes: [{
    	                display: true,
    	                ticks: {
    	                  fontSize: 11,
    	                  fontColor: 'rgb(0,0,0)',
    	                    autoSkip: false,
    	                },
    	                scaleLabel: {
    	                    display: true,
    	                    
    	                }
    	            }]
    	        }
    	    }
    	});

    	new Chart(document.getElementById("realestate-commercial-canvas"), {
    	    type: 'horizontalBar',
    	    data: {
    	        labels: ['평균 임대비용', '희망 임대 비용'],
    	        datasets: [{
    	            
    	          label: {
    	                  display: false,
    	                },
    	            data: [50, 80],
    	            borderColor: "rgba(255, 201, 14, 1)",
    	            backgroundColor: ["rgba(32, 102, 207, 0.8)", "rgba(137, 14, 14, 0.75)"], 
    	            fill: false,
    	        }]
    	    },
    	    options: {
    	    	
    	      legend: {
    	        display: false
    	    },
    	        responsive: false,
    	        title: {
    	            display: true,
    	            text: '임대 비용 비교'
    	        },
    	        tooltips: {
    	            mode: 'index',
    	            intersect: false,
    	        },
    	        hover: {
    	            mode: 'nearest',
    	            intersect: true
    	        },
    	        scales: {
    	            xAxes: [{
    	                display: true,
    	                ticks: {
    	                  fontSize: 11,
    	                  fontColor: 'rgb(0,0,0)',
    	                    beginAtZero : true,
    	                },
    	                scaleLabel: {
    	                    display: true,
    	                    
    	                },
    	            }],
    	            yAxes: [{
    	                display: true,
    	                ticks: {
    	                  fontSize: 11,
    	                  fontColor: 'rgb(0,0,0)',
    	                    autoSkip: false,
    	                },
    	                scaleLabel: {
    	                    display: true,
    	                    
    	                }
    	            }]
    	        }
    	    }
    	});
    	document.querySelector('.canvas').style.removeProperty(['width']);
    	document.querySelector('.realastate-canvas').style.removeProperty(['width']);
    	document.querySelector('.canvas').style.removeProperty(['height']);
    	document.querySelector('.realastate-canvas').style.removeProperty(['height']);

       
</script>

</body>
</html>