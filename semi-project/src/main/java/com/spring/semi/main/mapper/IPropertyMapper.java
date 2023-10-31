package com.spring.semi.main.mapper;

import com.spring.semi.main.entity.Property;

// 부동산 Mapper
public interface IPropertyMapper {
	// 동 이름에서 부동산 엔티티 얻기
	Property getPropery(String adstrdNm);
}
