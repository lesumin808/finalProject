package com.haeyo.biz.reservation.impl;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.haeyo.biz.profession.ReviewsVO;
import com.haeyo.biz.reservation.ReservationCategoryVO;
import com.haeyo.biz.reservation.ReservationService;
import com.haeyo.biz.reservation.ReservationVO;
import com.haeyo.biz.reservation.alramVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("ReservationServiceImpl")
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	HttpSession session;

	@Autowired
	ReservationDAO reservationDAO;

	// 예약 인서트
	@Override
	public void insertReservaiton(ReservationVO vo) {
		log.info("insertReservaiton : " + vo);
		reservationDAO.insertReservation(vo);
		if (vo.getRsvCategory().equals("수리")) {
			reservationDAO.insertRepair(vo);
		}else if (vo.getRsvCategory().equals("이사")) {
			reservationDAO.insertMoving(vo);
		}else if (vo.getRsvCategory().equals("청소")){
			reservationDAO.insertCleaning(vo);
		}
	}

	// 신청서 출력
	@Override
	public String application(ReservationCategoryVO vo) {
		log.info("application : " + vo);
		if (session.getAttribute("user") != null)
			return "profession.application";
		else
			return "user.login";
	}
	
	//신청서 사진 파일 업로드
	public ReservationVO fileUpload(ReservationVO vo) {
		log.info("fileUpload" + vo);
		MultipartFile file1 = vo.getFile1();
		MultipartFile file2 = vo.getFile2();
		if(!file1.isEmpty() || !file2.isEmpty()) {
			String rsvPic1 = file1.getOriginalFilename();
			String rsvPic2 = file2.getOriginalFilename();
			String rootPath = session.getServletContext().getRealPath("/");
			log.info("rootPath : " + rootPath);
			String attachPath ="WEB-INF\\reservationImage\\";
			log.info("파일1 경로 : " + rootPath+attachPath+rsvPic1);
			log.info("파일2 경로 : " + rootPath+attachPath+rsvPic2);
			
			try {
				file1.transferTo(new File(rootPath+attachPath+rsvPic1));
				file2.transferTo(new File(rootPath+attachPath+rsvPic2)); //해당 경로에 받은 이름의 파일을 만들어 저장
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
            vo.setRsvPic1(rsvPic1);
			vo.setRsvPic2(rsvPic2);
		}
		return vo;
	}

	//결제알림 인서트
	@Override
	public void insertAlram(alramVO vo) {
		reservationDAO.insertAlram(vo);
	}

	//댓글 수정 셀렉트
	@Override
	public ReviewsVO ajaxReview(ReviewsVO vo) {
		reservationDAO.updateReview(vo);
		return reservationDAO.getReview(vo);
	}

}
