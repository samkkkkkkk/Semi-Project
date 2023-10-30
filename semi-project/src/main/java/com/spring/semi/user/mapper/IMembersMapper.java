package com.spring.semi.user.mapper;

import com.spring.semi.user.entity.Members;

public interface IMembersMapper {

	// 유저 추가
	void insertMember(Members member);

	// 유저 얻기
	Members getMember(String id);
	
	// 유저 수정
	void updateMember(Members member);

	// 유저 삭제
	void deleteMember(String id);
}
