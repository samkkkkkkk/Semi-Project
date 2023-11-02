package com.spring.semi.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.semi.user.dto.UserLoginRequestDTO;
import com.spring.semi.user.dto.UserRegisterRequestDTO;
import com.spring.semi.user.entity.Members;
import com.spring.semi.user.mapper.IMembersMapper;
import com.spring.semi.user.mapper.IMyPageMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

	private final IMembersMapper membersMapper;
	private final IMyPageMapper myPageMapper;

	private final BCryptPasswordEncoder encoder;
	
	public boolean loginCheck(HttpSession session, UserLoginRequestDTO dto) {
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

	public void register(UserRegisterRequestDTO dto) {
		Members member = Members.builder()
								.id(dto.getUserId())
								.password(encoder.encode(dto.getUserPw()))
								.userName(dto.getUserName())
								.email(dto.getUserEmail())
								.build();
		
		membersMapper.insertMember(member);
		
	}

	public int idCheck(String id) {
		Members member = membersMapper.getMember(id);
		
		if (member != null) {
			return 1;
		}
		
		return 0;
	}
}
