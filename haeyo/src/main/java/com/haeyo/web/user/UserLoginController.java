package com.haeyo.web.user;

import java.text.ParseException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.haeyo.biz.reservation.alramVO;
import com.haeyo.biz.user.UserVO;
import com.haeyo.biz.user.impl.UserServiceImpl;

@Controller
@SessionAttributes("user")
public class UserLoginController {
	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);

	@Autowired
	public UserServiceImpl userServiceImpl;

	@PostMapping("/insertUser.do")
	public String insertUser(@ModelAttribute UserVO vo) throws Exception {
		logger.info("UserVO : " + vo);
		userServiceImpl.insertUser(vo); //
		return "user.login";
	}
	@PostMapping("/insertPass.do")
	public String insertPass(@ModelAttribute UserVO vo) throws Exception {
		logger.info("UserVO : " + vo);
		userServiceImpl.insertUser(vo); //
		return "user.join_pro";
	}

	// 로그인이 실행되는 컨트롤
	@PostMapping("/login.do")
	public String login(UserVO vo, Model model) {
		logger.info("UserVO : " + vo);
		model.addAttribute("user", userServiceImpl.getUser(vo));
		return "haeyo.index";
	}
	
	//로그인 시 불러오는 알림 - 이수민 210408
	@GetMapping("/selectAlram.do")
	@ResponseBody
	public List<alramVO> selectAlram(@RequestParam String uEmail) throws ParseException{
		logger.info("selectAlram컨트롤러 진입 uEmail : " + uEmail);
		logger.info("userServiceImpl.selectAlram(uEmail) 결과 : " + userServiceImpl.selectAlram(uEmail));
		return userServiceImpl.selectAlram(uEmail);
	}
}
