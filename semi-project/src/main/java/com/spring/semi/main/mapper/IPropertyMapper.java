package com.spring.semi.main.mapper;

import java.util.List;

import com.spring.semi.main.entity.Property;

// 부동산 Mapper
public interface IPropertyMapper {
	// 동 이름에서 부동산 리스트 엔티티 얻기
	List<Property> getProperties(String adstrdNm);
}
