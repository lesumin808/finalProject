package com.haeyo.biz.profession.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haeyo.biz.profession.ProfessionBookmarksVO;
import com.haeyo.biz.profession.ProfessionListVO;
import com.haeyo.biz.profession.ProfessionSubVO;
import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.profession.ReReviewsVO;
import com.haeyo.biz.reservation.ReservationVO;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;
@Log4j
@Repository
public class ProfessionDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProfessionListVO> getProList(ProfessionListVO vo) throws Exception {
		System.out.println("DAO로 경로 이동");
		return mybatis.selectList("ProListResultDAO.getProList", vo);
	};
	
	public List<ProfessionListVO> getAllList(ProfessionListVO vo) throws Exception {
		System.out.println("DAO로 경로 이동");
		return mybatis.selectList("ProListResultDAO.getAllList", vo);
	};
	
	public ProfessionListVO getDetail(ProfessionListVO vo) throws Exception {
		log.info("getDetail : " + vo);
		return (ProfessionListVO)mybatis.selectOne("ProListResultDAO.proDetail", vo);
	}
	
	public List<ProfessionListVO> getReview(ProfessionListVO vo) throws Exception {
		System.out.println("getReview DAO이동");
		return mybatis.selectList("ProListResultDAO.proReview", vo);
	}
	//대댓글 인서트
	public void insertReReview(ReReviewsVO vo) {
		System.out.println("insertReReview DAO이동");
		mybatis.insert("ProListResultDAO.insertReReview", vo);
	}
	//대댓글 셀렉트
	public List<ReReviewsVO> selectReReview(ReReviewsVO vo) {
		System.out.println("insertReReview DAO이동");
		return mybatis.selectList("ProListResultDAO.selectReReview", vo);
	}
	//서브 카테고리
	public ProfessionSubVO RepairCate(ProfessionListVO vo) {
		System.out.println("수리서브카테고리");
		return (ProfessionSubVO)mybatis.selectOne("ProSubResultDAO.RepairCate", vo);
	}
	public ProfessionSubVO MovingCate(ProfessionListVO vo) {
		System.out.println("이사서브카테고리");
		return (ProfessionSubVO)mybatis.selectOne("ProSubResultDAO.MovingCate", vo);
	}
	public ProfessionSubVO CleaningCate(ProfessionListVO vo) {
		System.out.println("청소서브카테고리");
		return (ProfessionSubVO)mybatis.selectOne("ProSubResultDAO.CleaningCate", vo);
	}
	
	//전문가 select 리스트 테스트
	public List<ProfessionListVO> getLList(ProfessionListVO vo) {
		System.out.println("전문가 select리스트");
		return mybatis.selectList("ProListResultDAO.getList", vo);
	}
	
	//북마크 인서트
	public int insertBook(ProfessionBookmarksVO vo){
		return mybatis.insert("professionDAO.insertBook", vo);
	}
		
	//북마크 삭제
	public int deleteBook(ProfessionBookmarksVO vo) {
		return mybatis.delete("professionDAO.deleteBook", vo);
	}
	
	//북마크 카운트
	public ProfessionBookmarksVO selectBook(ProfessionBookmarksVO vo) {
		return mybatis.selectOne("professionDAO.selectBook", vo);
	}
	
	public List<ReservationVO> selectProReservation(ProfessionVO vo){
		return mybatis.selectList("ReservationResultDAO.selectReservation", vo);
	}
	
	//210407 장현아 전문가 회원가입
	public int insertPro(ProfessionVO vo) {
		System.out.println("Mybatis로 insertPro() 기능처리");
		mybatis.insert("professionDAO.insertPro", vo);
		int uNo = vo.getuNo();
		System.out.println("uNo = " + uNo);
		return uNo;
	}
	
	// 210408 장현아 전문가 세부내용 저장
		public void insertProCate(ProfessionSubVO vo) {
			System.out.println("Mybatis로 insertPro() 기능처리");
			mybatis.insert("professionDAO.insertProCate", vo);
		}
}
