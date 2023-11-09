package com.spring.semi.main;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.spring.semi.main.entity.AdministrativeCode;
import com.spring.semi.main.entity.Property;
import com.spring.semi.main.mapper.IAdministrativeCodeMapper;
import com.spring.semi.main.mapper.IJobCategoryMapper;
import com.spring.semi.main.mapper.IPropertyMapper;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Slf4j
public class MainMapperTest {

	@Autowired
	private IAdministrativeCodeMapper admCodeMapper;
	
	@Autowired
	private IJobCategoryMapper jobCategoryMapper;
	
	@Autowired
	private IPropertyMapper propertyMapper;
	
	@Test
	@DisplayName("읍면동이름을 주면 행정명 코드를 줄것이다.")
	public void getadmCodeTest1() {
		String eupMyeongDong = "사직동";
		
		int res = admCodeMapper.getCodeFromEupMyeongDong(eupMyeongDong);
		
		assertEquals(11110530, res);
	}
	
	@Test
	@DisplayName("전체이름을 주면 행정명 코드를 줄것이다.")
	public void getadmCodeTest2() {
		AdministrativeCode acode = new AdministrativeCode(0, "서울특별시", "종로구", "사직동");
		
		int res = admCodeMapper.getCodeFromAll(acode);
		
		assertEquals(11110530, res);
	}
	
	@Test
	@DisplayName("소분류 이름을 주면 소분류 코드를 줄것이다.")
	public void getJobCategoryTest() {
		String name = "모터사이클 및 부품 소매업";
		
		String res = jobCategoryMapper.getCode(name);
		
		assertEquals("G20301", res);
	}
	
	@Test
	@DisplayName("동이름을 주면 부동산 리스트를 줄것이다.")
	public void getPropertyTest() {
		String name = "방화동";
		
		List<Property> res = (List<Property>) propertyMapper.getProperties(name);
		
		log.info("결과({}): {}", res.size(), res);
		assertEquals(56, res.size());
	}
}
