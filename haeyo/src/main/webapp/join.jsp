<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link href="resources/image/icon.ico" rel="shortcut icon"
	type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src=https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js""></script>
<link href="resources/css/join.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/join.js" defer></script>
<script defer src="resources/js/join_addr.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52c7f3d664707319c1c8977f5f4a2421&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">	
</script>
<!---------------------body--------------------->
<div id="join-body">
	<div id="join_title">
		<h1>함께</h1>
		<span><img src="resources/image/logo2.png"></span>
	</div>
	<form name=form method="post" onsubmit="return join_check();">
		<!-- <form action="insertUser.do" method="post" enctype="text/plain" > -->
		<fieldset>
			<div class="form-group">
				<div id="userpic-wrapper">
					<img id="thumb-img"> <label class="click-icon" for="uPic"><i
						class="fas fa-camera"></i></label> <input type="file" name="uPic"
						id="uPic" class="upload-box upload-plus" accept="image/*"
						onchange="thumbnail(event)">
				</div>
			</div>
			<div class="form-group">
				<label for="uName">이 름</label> <input type="text" name="uName"
					class="form-control" id="uName" placeholder="이수민">
			</div>
			<div class="form-group">
				<label for="uNick">별 명</label> <input type="text" name="uNick"
					class="form-control" id="uNick" placeholder="Zn">
			</div>
			<div class="form-group">
				<label for="uPhone">전화번호</label> <input type="text" name="uPhone"
					class="form-control" id="uPhone" placeholder="010-0000-0000">
			</div>
			<div class="form-group">
				<label for="uEmail">이메일</label> <input type="text" name="uEmail"
					class="form-control" id="uEmail" placeholder="email@bit.com">
			</div>
			<div class="form-group">
				<div class="mail_wrap">
					<div class="mail_name">이메일</div>
					<div class="mail_input_box">
						<input class="mail_input" name="memberMail">
					</div>
					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" disabled="disabled">
						</div>
						<div class="mail_check_button">
							<span>인증번호 전송</span>
						</div>
						<!--<div class="mail_check_button">
                     <span>인증번호 전송</span>
                  </div>
                  
                  <div class="mail_check_button">인증번호</div> -->
						<div class="clearfix"></div>
						<span id="mail_check_input_box_warn"></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="uPwd">비밀번호</label> <input type="password" name="uPwd"
					class="form-control" id="uPwd" placeholder="영문+숫자 조합 8자리 이상 입력해주세요">
			</div>
			<div class="form-group">
				<label for="uPwd">비밀번호 확인</label> <input type="password"
					name="uPwd2" class="form-control" id="uPwd2" placeholder="">
			</div>
			<div class="form-group">
				<div id="address-group" class="clearfix">
					<label for="uAddress">주 소</label> <input type="text"
						name="uAddress" class="form-control" id="uAddress"
						placeholder="서울시 마포구"> <input type="button" id="searchBtn"
						class="button_adrr" onclick="sample5_execDaumPostcode()"
						value="주소 검색"><br>
					<div id="map"></div>
					<input type="hidden" id="uY" name="uLat" value="" /> <input
						type="hidden" id="uX" name="uLon" value="" />
				</div>
			</div>

			<div class="form-group">
				<div class="uAgreecheck">
					<input type="checkbox" class="uAgreecheck" id="uAgreecheck1"
						name="uAgreecheck" value="1"> <input type="hidden"
						class="uAgreecheck" id="uAgreecheck0" name="uAgreecheck" value="0"><label
						class="uAgreecheck-label" for="uAgreecheck">
						<p>
							'해요'의 <span>이용약관</span> 및 <span>개인정보 처리방침</span>에 동의합니다
						</p>
					</label> <a href="agree.jsp" target="_blank">자세히</a>
				</div>
			</div>
			<div class="box">
				<div id="join1-button">
					<input type="submit" name="join" class="btn-secondary"
						formaction="insertUser.do" value="회 원 가 입" />
				</div>
				<div id="join2-button">
					<input type="submit" name="join" class="btn-secondary"
						formaction="insertPass.do" value="전문가로 가입하기" />
				</div>
			</div>
		</fieldset>
	</form>
</div>