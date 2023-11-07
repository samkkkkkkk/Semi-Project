package com.spring.semi.main.dto;

import com.spring.semi.main.entity.Property;

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
public class PropertyResponseDTO {
	private int rownum;
	private String siDO;
	private String siGunGu;
	private String adstrdNm;
	private int excheGtn;
	private double latitude;
	private double longitude;
	
	
	public PropertyResponseDTO(Property proper) {
		this.rownum = proper.getRownum();
		this.siDO = proper.getSiDO();
		this.siGunGu = proper.getSiGunGu();
		this.adstrdNm = proper.getAdstrdNm();
		this.excheGtn = proper.getExcheGtn();
		this.latitude = proper.getLatitude();
		this.longitude = proper.getLongitude();
	
	}
	

}
