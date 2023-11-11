package com.spring.semi.main.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.semi.main.entity.Property;
import com.spring.semi.main.mapper.IPropertyMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PropertyService {
	private final IPropertyMapper mapper;
	
	// 동 이름으로 데이터베이스 부동산리스트 조회
	public String getProperties(String h1) {
		List<Property> list = mapper.getProperties(h1);
	    //자바 스크립트에서 바로 사용할 수 있는 json 문자열 형태로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    try {
	        return objectMapper.writeValueAsString(list); // map 전체를 JSON으로 변환
	    } catch (Exception e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	        return null;
	    }
	}
}
