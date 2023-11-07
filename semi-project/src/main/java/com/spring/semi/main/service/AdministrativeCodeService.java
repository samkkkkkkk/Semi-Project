package com.spring.semi.main.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.semi.main.dto.AdministrativeCodeDTO;
import com.spring.semi.main.dto.JobCategoryDTO;
import com.spring.semi.main.mapper.IAdministrativeCodeMapper;
import com.spring.semi.main.mapper.IJobCategoryMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdministrativeCodeService {

private final IAdministrativeCodeMapper administrativeCodeMapper;
	
	public List<AdministrativeCodeDTO> getAdrList(String siGunGu) {
		List<AdministrativeCodeDTO> dtoList = new ArrayList<>();
		List<String> list = administrativeCodeMapper.getAdrList(siGunGu);
		for(String Adr : list) {			
			dtoList.add(new AdministrativeCodeDTO(Adr));
		}
		return dtoList;
	}
	
}
