package com.spring.semi.main.mapper;

import java.util.List;

import com.spring.semi.main.entity.AdministrativeCode;

//행정명 코드 Mapper
public interface IAdministrativeCodeMapper {
	// 전체이름에서 행정동 코드 얻기
	String getCodeFromAll(AdministrativeCode code);
	// 읍면동으로 행정동 코드 얻기
	String getCodeFromEupMyeongDong(AdministrativeCode code);
	// 구이름으로 동 이름 얻기
	List<String> getAdrList(String siGunGu);
	
	String getCodeFromEupMyeongDong(String siGunGu, String eupMyeongDong);
}
