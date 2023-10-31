package com.spring.semi.main.mapper;

//업종 소분류 Mapper
public interface IJobCategoryMapper {
	// 소분류 이름에서 소분류 코드 얻기
	String getCode(String name);
}
