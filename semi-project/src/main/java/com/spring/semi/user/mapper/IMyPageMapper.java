package com.spring.semi.user.mapper;

import java.util.List;

import com.spring.semi.user.entity.MyPage;

public interface IMyPageMapper {

	// mypage 추가
	void insertMyPage(MyPage myPage);
	
	// mypage 얻기
	MyPage getMyPage(int bno);
	
	// mypage 리스트 얻기
	List<MyPage> getMyPages(String userId);
	
	// mypage 삭제
	void deleteMyPage(int bno);
}
