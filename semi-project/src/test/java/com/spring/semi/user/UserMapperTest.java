package com.spring.semi.user;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.spring.semi.user.entity.Members;
import com.spring.semi.user.entity.MyPage;
import com.spring.semi.user.mapper.IMembersMapper;
import com.spring.semi.user.mapper.IMyPageMapper;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/email-config.xml"
		})
@TestPropertySource("classpath:/properties/email.properties")
@Slf4j
public class UserMapperTest {

	@Autowired
	private IMembersMapper membersMapper;
	
	@Autowired
	private IMyPageMapper myPageMapper;
	
	// 테스트시 root-context.xml에 빈 등록 하기!
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	// MemersMapper
	@Test
	@DisplayName("유저 정보를 입력하면 추가가 될 것이다.")
	public void insertMemberTest() {
		Members user = Members.builder()
				.id("test1")
				.password(encoder.encode("test1234"))
				.userName("김춘식")
				.email("test1@naver.com")
				.build();
		
		membersMapper.insertMember(user);
	}
	
	@Test
	@DisplayName("아이디를 주면 아이디에 해당되는 유저 정보를 줄 것이다.")
	public void getMemberTest() {
		String id = "test1";

		Members res = membersMapper.getMember(id);

		log.info("계정 정보: {}", res);

		assertEquals("김춘식", res.getUserName());
	}

	@Test
	@DisplayName("수정할 유저의 정보를 주면 정보가 수정될 것이다.")
	public void updateMemberTest() {
		String id = "test3";
		Members user = membersMapper.getMember(id);

		user.setUserName("김스프링");
		user.setEmail("test3@naver.com");
		user.setPassword(null);

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
	@Test
	@DisplayName("mypage 정보를 입력하면 추가가 될 것이다.")
	public void insertMyPageTest() {
		MyPage user = MyPage.builder()
				.id("test1")
				.location("신내동")
				.jobCategory1("소매업")
				.jobCategory2("종합 소매업")
				.jobCategory3("편의점")
				.budget(50000000)
				.build();
		
		myPageMapper.insertMyPage(user);
	}

	@Test
	@DisplayName("bno를 주면 번호에 해당되는 mypage 정보를 줄 것이다.")
	public void getMyPageTest() {
		int bno = 1;
		
		MyPage res = myPageMapper.getMyPage(bno);
		
		assertEquals("test1", res.getId());
		assertEquals("신내동", res.getLocation());
		assertEquals("편의점", res.getJobCategory3());
		assertEquals(50000000, res.getBudget());
	}
	
	@Test
	@DisplayName("mypage 테이블에 있는 모든 데이터를 줄 것이다.")
	public void getMyPagesTest() {
		List<MyPage> res = myPageMapper.getMyPages();

		log.info("리스트 결과: {}", res);
	}
	
	@Test
	@DisplayName("bno를 주면 번호에 해당되는 mypage 정보를 삭제할 것이다.")
	public void deleteMyPageTest() {
		int bno = 1;
		
		myPageMapper.deleteMyPage(bno);
		
		MyPage res = myPageMapper.getMyPage(bno);
		assertNull(res);
	}
}
