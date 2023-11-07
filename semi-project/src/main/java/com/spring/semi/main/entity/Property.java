package com.spring.semi.main.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
// 부동산 엔티티
public class Property {
	
	private int rownum;
	private String siDO;
	private String siGunGu;
	private String adstrdNm;
	private int excheGtn;
	private int area;
	private double latitude;
	private double longitude;
	
	
	
	
}
