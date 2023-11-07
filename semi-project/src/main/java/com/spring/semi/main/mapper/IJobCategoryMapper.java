package com.spring.semi.main.mapper;

import java.util.List;


//업종 소분류 Mapper
public interface IJobCategoryMapper {
	// 소분류 이름에서 소분류 코드 얻기
	String getCode(String name);
	
	// 중분류 이름에서 소분류 이름 목록 얻기
	List<String> getJobList(String mediumCategoryName);
}
