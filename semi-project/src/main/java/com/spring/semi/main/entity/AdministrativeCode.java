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
// 행정명 코드 엔티티
public class AdministrativeCode {

	private int code;
	private String siDo;
	private String siGunGu;
	private String eupMyeongDong;
}
