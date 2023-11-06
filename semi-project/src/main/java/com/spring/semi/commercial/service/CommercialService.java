package com.spring.semi.commercial.service;

import java.net.URI;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class CommercialService {

	//properties에 작성된 값을 읽어오는 아노테이션
	@Value("${commercial.serviceKey}")
	private String serviceKey;
	@Value("${commercial.reqUrl}")
	private String reqUrl;

	private Map<String, Object> responseData; // 전달 받은 데이터를 담을 객체

	public Map getShortTermForecast(String h1, String h2) {
		//요청 헤더 설정(api에서 원하는 헤더 설정이 있다면 사용하세요.)
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Accept", "*/*;q=0.9"); // HTTP_ERROR 방지

		//GET 방식의 요청에서 url에 쿼리파라미터를 묻혀서 보내는 방법.
		UriComponents builder = UriComponentsBuilder.fromHttpUrl(reqUrl)
				.queryParam("serviceKey", serviceKey)
				.queryParam("pageNo", "1")
				.queryParam("numOfRows", "200")
				.queryParam("divId", "adongCd")
				.queryParam("key", "11110640")
				.queryParam("indsSclsCd", "I21201")
				.queryParam("type", "json")
				.build();

		log.info("완성된 url: {}", builder.toString());

		//REST 방식의 통신을 보내줄 객체 생성.
		RestTemplate template = new RestTemplate();
		//위에서 세팅한 header 정보와 parameter를 하나의 엔터티로 포장.
		//GET방식의 경우에는 HttpEntity에 데이터를 포함시키지 않아도 됨. -> url에 묻어 있으니까
		//POST 등의 방식에서는 MultiValueMap을 HttpEntity에 담으면 됨.
		HttpEntity<Object> requestEntity = new HttpEntity<>(headers);

		try {
			//UriComponents 타입의 값을 URI 객체로 변환. (GET)
			URI uri = new URI(builder.toUriString());
			ResponseEntity<Map> responseEntity = template.exchange(uri, HttpMethod.GET, requestEntity, Map.class);


			responseData = (Map<String, Object>) responseEntity.getBody();
//			log.info("요청에 따른 응답 데이터: {}", responseData);
//			log.info("body까지 접근 : {}", ((Map) responseData).get("body"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responseData;
	}


}
