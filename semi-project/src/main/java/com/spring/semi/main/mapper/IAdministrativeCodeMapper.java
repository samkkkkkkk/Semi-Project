package com.spring.semi.main.mapper;

import com.spring.semi.main.Entity.AdministrativeCode;

//행정명 코드 Mapper
public interface IAdministrativeCodeMapper {
	int getCode(AdministrativeCode code);
	int getCode(String eupMyeongDong);
}
