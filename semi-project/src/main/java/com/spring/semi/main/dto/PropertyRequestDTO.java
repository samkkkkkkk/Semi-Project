package com.spring.semi.main.dto;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PropertyRequestDTO {
	
	
	private String adstrdNm; // 사용자 입력동
	private int excheGtn; //사용자 희망가격
	private int area;
}
