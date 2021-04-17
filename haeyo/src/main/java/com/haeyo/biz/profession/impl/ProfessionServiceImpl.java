package com.haeyo.biz.profession.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haeyo.biz.profession.ProfessionBookmarksVO;
import com.haeyo.biz.profession.ProfessionListVO;
import com.haeyo.biz.profession.ProfessionService;
import com.haeyo.biz.profession.ProfessionSubVO;
import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.profession.ReReviewsVO;
import com.haeyo.biz.reservation.ReservationVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("ProfessionService")
public class ProfessionServiceImpl implements ProfessionService {

	@Autowired
	HttpSession session;

	@Autowired
	private ProfessionDAO professionDAO;

	@Override
	public List<ProfessionListVO> getProList(ProfessionListVO vo) throws Exception {
		log.info("getProList 진입");
		log.info(getClass().getName() + vo);
		return professionDAO.getProList(vo);
	}

	@Override
	public List<ProfessionListVO> getAllList(ProfessionListVO vo) throws Exception {
		log.info(getClass().getName() + vo);
		return professionDAO.getAllList(vo);
	}

	@Override
	public ProfessionListVO getDetail(ProfessionListVO vo) throws Exception {
		log.info(getClass().getName() + vo);
		return professionDAO.getDetail(vo);
	}

	@Override
	public List<ProfessionListVO> getReview(ProfessionListVO vo) throws Exception {
		System.out.println("전문가 리뷰 페이지");
		return professionDAO.getReview(vo);
	}

	//전문가 서브 카테고리
	@Override
	public ProfessionSubVO getSubCate(ProfessionListVO vo) throws Exception {
		System.out.println("서브카테고리 가져오기");
		if (vo.getpCategory().equals("수리")) {
			return professionDAO.RepairCate(vo);
		} else if (vo.getpCategory().equals("이사")) {
			return professionDAO.MovingCate(vo);
		} else if (vo.getpCategory().equals("청소")) {
			return professionDAO.CleaningCate(vo);
		}
		return null;
	}

	// 전문가 select
	@Override
	public List<ProfessionListVO> getList(ProfessionListVO vo) throws Exception {
		log.info(getClass().getName() + vo);
		return professionDAO.getLList(vo);
	}
	
	//리뷰 인서트및 셀렉트
	@Override
	public List<ReReviewsVO> insertReReview(ReReviewsVO vo) throws Exception {
		log.info(getClass().getName() + vo);
		professionDAO.insertReReview(vo);
		return professionDAO.selectReReview(vo);
	}

	// 북마크
	@Override
	public int checkBook(ProfessionBookmarksVO vo, HttpSession session) throws Exception {
		if (session.getAttribute("user") != null) {
			log.info(getClass().getName() + vo);
			if (professionDAO.selectBook(vo) == null) {
				professionDAO.insertBook(vo);
				return 0;
			} else {
				professionDAO.deleteBook(vo);
				System.out.println(professionDAO.deleteBook(vo));
				return 1;
			}
		}else {
			return -1;
		}
	}

	// 전문가 예약일정 셀렉트
	@Override
	public List<ReservationVO> getproReservation(ProfessionVO vo) throws Exception {
		log.info(getClass().getName() + vo);
 		return professionDAO.selectProReservation(vo);
	}

	//210407 장현아 전문가 회원가입
	public void insertPro(ProfessionVO vo) {
		professionDAO.insertPro(vo);
	}
		
	//210408 장현아 전문가 세부내용 저장
	public void insertProCate(ProfessionSubVO vo) {
		professionDAO.insertProCate(vo);
	}
		
}
