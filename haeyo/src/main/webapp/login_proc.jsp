<%@ page import="com.haeyo.biz.user.impl.UserDAOMybatis"%>
<%@ page import="com.haeyo.biz.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String uEmail = request.getParameter("uEmail");
	String uPwd = request.getParameter("uPwd");
	
	UserVO vo = new UserVO();
	vo.setuEmail(uEmail);
	vo.setuPwd(uPwd);
	
	UserDAOMybatis dao = new UserDAOMybatis();
	UserVO UserVO = dao.getUser(vo);
	
	if(UserVO != null) {
		session.setAttribute("uEmail", uEmail);
		response.sendRedirect("index.jsp");
	} else {
		session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
		response.sendRedirect("login.jsp");
	}
%>