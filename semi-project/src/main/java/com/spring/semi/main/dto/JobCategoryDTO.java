package com.spring.semi.main.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString @EqualsAndHashCode
public class JobCategoryDTO {

	private String smallCategoryName;
	
	public JobCategoryDTO(String mediumCategoryName) {
		this.smallCategoryName = mediumCategoryName;
	}
	
}
