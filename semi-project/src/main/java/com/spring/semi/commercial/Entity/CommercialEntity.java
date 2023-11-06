package com.spring.semi.commercial.Entity;

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
//상권 조회 후 담아 둘 엔터티
public class CommercialEntity {
	private String bizesNm; // bizesNm : 서울커피
	private String indsSclsNm; // indsSclsNm : 카페
	private String lnoAdr; // lnoAdr : 서울특별시 종로구 연건동 84-1
	private double lon;  // lon : 127.001703910434 경도
	private double lat; // lat : 37.5785669164007  위도
}
