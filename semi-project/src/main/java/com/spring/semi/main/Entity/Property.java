package com.spring.semi.main.Entity;

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
// 부동산 엔티티
public class Property {

	private int realestateNo;
	private String adstrdNm;
	private int excheGtn;
	private int latitude;
	private int longitude;
}
