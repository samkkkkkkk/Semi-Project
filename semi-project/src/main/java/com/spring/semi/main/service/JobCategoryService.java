package com.spring.semi.main.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.semi.main.dto.JobCategoryDTO;
import com.spring.semi.main.entity.JobCategory;
import com.spring.semi.main.mapper.IJobCategoryMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JobCategoryService {

	private final IJobCategoryMapper jobCategoryMapper;
	
	public List<JobCategoryDTO> getJobList(String mediumCategoryName) {
		List<JobCategoryDTO> dtoList = new ArrayList<>();
		List<String> list = jobCategoryMapper.getJobList(mediumCategoryName);
		for(String job : list) {			
			dtoList.add(new JobCategoryDTO(job));
		}
		return dtoList;
	}
	
}
