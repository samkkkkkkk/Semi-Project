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
// 상권 조회 내용을 담아둘 엔터티
public class CommercialEntity {
    private String siGunGu;
    private String eupMyeongDong;
    private String smallCategoryName;
    private String excheGtn;
}
