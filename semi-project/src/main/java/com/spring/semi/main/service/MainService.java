package com.spring.semi.main.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.semi.main.dto.PropertyRequestDTO;
import com.spring.semi.main.dto.PropertyResponseDTO;
import com.spring.semi.main.entity.Property;
import com.spring.semi.main.mapper.IAdministrativeCodeMapper;
import com.spring.semi.main.mapper.IJobCategoryMapper;
import com.spring.semi.main.mapper.IPropertyMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainService {

	
	private final IAdministrativeCodeMapper administrativeCodeMapper;
	private final IJobCategoryMapper jobCategoryMapper;
	private final IPropertyMapper propertyMapper;
	
	//매물 가져오기(엔터티에게 동과 희망가격 전달)
	public List<PropertyResponseDTO> getProperty(PropertyRequestDTO dto) {
		//dto를 엔터티로 변환
		Property property = Property.builder()
				.adstrdNm(dto.getAdstrdNm())
				.excheGtn(dto.getExcheGtn())
				.area(dto.getArea())
				.build();
		List<PropertyResponseDTO> dtoList = new ArrayList<>();
		//매물 리스트를 dto로 변환
		List<Property> list = propertyMapper.getProperties(property);
		for(Property proper : list) {
			dtoList.add(new PropertyResponseDTO(proper));
		}
		return dtoList;
	}
	
}
