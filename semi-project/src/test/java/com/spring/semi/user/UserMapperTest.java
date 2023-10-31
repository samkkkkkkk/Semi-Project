package com.spring.semi.user;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.spring.semi.user.entity.Members;
import com.spring.semi.user.mapper.IMembersMapper;
import com.spring.semi.user.mapper.IMyPageMapper;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Slf4j
public class UserMapperTest {

	@Autowired
	private IMembersMapper membersMapper;
	
	@Autowired
	private IMyPageMapper myPageMapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	// MemersMapper
	
	// 테스트시 root-context.xml에 빈 등록 하기!
	@Test
	@DisplayName("유저 정보를 입력하면 추가가 될 것이다.")
	public void insertMemberTest() {
		Members user = Members.builder()
				.id("test1")
				.password(encoder.encode("test1"))
				.userName("김춘식")
				.email("test1@naver.com")
				.build();
		
		membersMapper.insertMember(user);
	}
	
	@Test
	@DisplayName("아이디를 주면 계정 정보를 줄 것이다.")
	public void getMemberTest() {
	}
	
	
	// MyPageMapper
	
}
