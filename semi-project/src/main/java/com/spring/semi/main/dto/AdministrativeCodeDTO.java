package com.spring.semi.main.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString @EqualsAndHashCode
public class AdministrativeCodeDTO {

	private String eupMyeongDong;
		
	public AdministrativeCodeDTO(String siGunGu) {
		this.eupMyeongDong = siGunGu;
	}
}
