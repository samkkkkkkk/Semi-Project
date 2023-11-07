package com.spring.semi.user.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.semi.user.dto.UserRequestLoginDTO;
import com.spring.semi.user.dto.UserRequestRegisterDTO;
import com.spring.semi.user.dto.UserRequstModifyDTO;
import com.spring.semi.user.dto.UserResponseMyPageInfoDTO;
import com.spring.semi.user.dto.UserResponseMyPageResultDTO;
import com.spring.semi.user.dto.page.Page;
import com.spring.semi.user.entity.Members;
import com.spring.semi.user.entity.MyPage;
import com.spring.semi.user.mapper.IMembersMapper;
import com.spring.semi.user.mapper.IMyPageMapper;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class UserService {

	private final IMembersMapper membersMapper;
	private final IMyPageMapper myPageMapper;

	private final BCryptPasswordEncoder encoder;
	
	// 로그인 체크
	public boolean loginCheck(HttpSession session, UserRequestLoginDTO dto) {
		Members member = membersMapper.getMember(dto.getUserId());
		
		if (member != null) {
			if (encoder.matches(dto.getUserPw(), member.getPassword())) {
				session.setAttribute("userId", member.getId());
				session.setAttribute("userName", member.getUserName());
				return true;
			}
		}
		
		return false;
	}

	// 유저 등록
	public void register(UserRequestRegisterDTO dto) {
		Members member = Members.builder()
								.id(dto.getUserId())
								.password(encoder.encode(dto.getUserPw()))
								.userName(dto.getUserName())
								.email(dto.getUserEmail1() + dto.getUserEmail2())
								.build();
		
		membersMapper.insertMember(member);
		
	}

	// 아이디 중복 체크
	public int idCheck(String id) {
		return membersMapper.idCheck(id);
		
	}
	
	// 유저 정보 가져오기
	public UserResponseMyPageInfoDTO getMemberInfo(String id) {
		Members member = membersMapper.getMember(id);
		String[] email = member.getEmail().split("@");
		String email1 = email[0];
		String email2 = "@" + email[1];
		
		UserResponseMyPageInfoDTO dto =
				UserResponseMyPageInfoDTO.builder()
				.userId(member.getId())
				.userName(member.getUserName())
				.userEmail1(email1)
				.userEmail2(email2)
				.build();
				
		return dto;
	}
	
	// 유저 정보 수정
	public void modifyMemberInfo(String userId, UserRequstModifyDTO dto) {
		
		Members.MembersBuilder member = Members.builder()
				.id(userId)
				.userName(dto.getUserName())
				.email(dto.getUserEmail1() + dto.getUserEmail2());
		
		// 비밀번호가 있다면 비밀번호도 변경
		if (dto.getUserPw() != null && !dto.getUserPw().equals("")) {
			member.password(encoder.encode(dto.getUserPw()));
		}
		
		membersMapper.updateMember(member.build());
		
	}
	
	// 조회결과 정보 리스트 가져오기
	public List<UserResponseMyPageResultDTO> getResultList(String userId, Page page) {
		List<UserResponseMyPageResultDTO> dto = new ArrayList<>();
		
		for ( MyPage myPage : myPageMapper.getMyPages(page)) {
			dto.add(UserResponseMyPageResultDTO.builder()
					.rn(myPage.getRn())
					.bno(myPage.getBno())
					.location(myPage.getLocation())
					.jobCategory3(myPage.getJobCategory3())
					.budget(myPage.getBudget())
					.build());	
		}
				
		return dto;
	}
	
	// 조회결과 정보 가져오기
	public UserResponseMyPageResultDTO getResultDetail(int bno) {
		MyPage page = myPageMapper.getMyPage(bno);
		
		UserResponseMyPageResultDTO dto = UserResponseMyPageResultDTO.builder()
				.bno(page.getBno())
				.location(page.getLocation())
				.jobCategory1(page.getJobCategory1())
				.jobCategory2(page.getJobCategory2())
				.jobCategory3(page.getJobCategory3())
				.budget(page.getBudget())
				.build();
		
		return dto;
	}
	
	// 조회결과 정보 지우기
	public void deleteResult(int bno) {
		myPageMapper.deleteMyPage(bno);
	}

	public int getTotal(String userId) {
		return myPageMapper.getTotal(userId);
	}	

}
