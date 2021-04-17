package com.haeyo.biz.user;

import java.text.ParseException;
import java.util.List;

import com.haeyo.biz.reservation.alramVO;

public interface UserService {
	//장현아 210323
	void insertUser(UserVO vo);
	
	UserVO getUser(UserVO vo);
	
	//이수민 알람
	public List<alramVO> selectAlram(String uEmail) throws ParseException;
}
