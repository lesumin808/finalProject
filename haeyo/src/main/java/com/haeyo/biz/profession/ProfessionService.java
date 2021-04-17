package com.haeyo.biz.profession;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.haeyo.biz.reservation.ReservationVO;

public interface ProfessionService {
	
	//전문가 추천 리스트 출력
	List<ProfessionListVO> getProList(ProfessionListVO vo) throws Exception;
	//전문가 전체 리스트 출력
	List<ProfessionListVO> getAllList(ProfessionListVO vo) throws Exception;
	//전문가 리뷰 보기
	ProfessionListVO getDetail(ProfessionListVO vo) throws Exception;
	//전문가 상세보기
	List<ProfessionListVO> getReview(ProfessionListVO vo) throws Exception;
	//카테고리 별 소카테고리 분류
	ProfessionSubVO getSubCate(ProfessionListVO vo) throws Exception;
	//전문가 리스트 select 출력
	List<ProfessionListVO> getList(ProfessionListVO vo) throws Exception;
	//리뷰 인서트 및 셀렉트
	List<ReReviewsVO> insertReReview(ReReviewsVO vo) throws Exception;
	//북마크 인서트
	int checkBook(ProfessionBookmarksVO vo, HttpSession session) throws Exception;
	//예약 일정 셀렉트
	List<ReservationVO> getproReservation(ProfessionVO vo) throws Exception;
	//210407 장현아 전문가 회원가입
	void insertPro(ProfessionVO vo);
	//210408 장현아 전문가 세부내용 저장
	void insertProCate(ProfessionSubVO vo);
}	
