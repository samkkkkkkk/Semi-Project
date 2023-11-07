package com.spring.semi.user.mapper;

import java.util.List;

import com.spring.semi.user.dto.page.Page;
import com.spring.semi.user.entity.MyPage;

public interface IMyPageMapper {

	// mypage 추가
	void insertMyPage(MyPage myPage);
	
	// mypage 얻기
	MyPage getMyPage(int bno);
	
	// 아이디에 해당되는 mypage 리스트 얻기
	List<MyPage> getMyPages(Page page);
	
	// mypage 삭제
	void deleteMyPage(int bno);
	
	// 아이디에 해당되는 조회결과의 총 개수
	int getTotal(String userId);
}
