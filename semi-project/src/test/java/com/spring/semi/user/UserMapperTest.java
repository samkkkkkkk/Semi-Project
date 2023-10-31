package com.spring.semi.user;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

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
	@DisplayName("아이디를 주면 유저 정보를 줄 것이다.")
	public void getMemberTest() {
		String id = "test1";

		Members res = membersMapper.getMember(id);

		log.info("계정 정보: {}", res);

		assertEquals("김춘식", res.getUserName());
	}

	@Test
	@DisplayName("수정할 유저의 정보를 주면 정보가 수정될 것이다.")
	public void updateMemberTest() {
		String id = "test1";
		Members user = membersMapper.getMember(id);

		user.setUserName("김스프링");
		user.setEmail("test2@naver.com");

		membersMapper.updateMember(user);

		user = null;
		user = membersMapper.getMember(id);

		log.info("계정 정보: {}", user);
		assertEquals("김스프링", user.getUserName());
	}

	@Test
	@DisplayName("아이디를 주면 유저를 삭제할 것이다.")
	public void deleteMemberTest() {
		String id = "test1";

		membersMapper.deleteMember(id);

		Members res = membersMapper.getMember(id);
		assertNull(res);
	}
	
	
	// MyPageMapper
	
}
