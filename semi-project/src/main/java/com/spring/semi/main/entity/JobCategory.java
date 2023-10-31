package com.spring.semi.main.entity;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
// 업종 소분류 엔티티
public class JobCategory {
	
	private String smallCategoryCode;
	private String smallCategoryName;
}
