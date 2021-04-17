<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.haeyo.biz.user.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Join</title>
<link href="image/icon.ico" rel="shortcut icon" type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<link href="resources/css/join_pro_category.css" rel="stylesheet">
<!-- <link href="css/main.css" rel="stylesheet"> -->
<link href="resources/css/header.css" rel="stylesheet">
<script defer src="resources/js/common.js"></script>
<script defer src="resources/js/join_addr.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52c7f3d664707319c1c8977f5f4a2421&libraries=services"></script>
</head>
<body>
<%
	session = request.getSession();
	UserVO user = (UserVO)session.getAttribute("user");
%>
	<wrap> <!--modalStart-->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">어떤 서비스를
						원하시나요?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="modal-body">
					<form action="#" method="get">
						<button type="button" class="btn-secondary"
							onclick="location.href='#.jsp'">수 리</button>
						<button type="button" class="btn-secondary">이 사</button>
						<button type="button" class="btn-secondary">청 소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--modalEnd--> <!------- headerStart -------> <header id="header">
		<nav id="nav">
			<logo id="logo"> <a href="index.html"><img
				src="resources/image/logo2.png" alt="로고"></a> </logo>
			<ul>
				<li><a href="#">같이해요</a></li>
				<li><a href="#">혼자해요</a></li>
				<li><a href="#">전문가 신청</a></li>
				<li class="btn-group">
					<ul class="dropdown-toggle bell" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-bell"></i>
					</ul>
					<div class="dropdown-menu dropdown-menu-right alarm1">
						<p>알림</p>
						<div id="alarmTxt">회원님이 결제를 완료하셨습니다.</div>
						<span>23분전</span>
					</div>
				</li>
				<li class="btn-group">
					<div class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">회원님</div>
					<div class="dropdown-menu dropdown-menu-right" id="profile">
						<div id="profiteTxt">
							<span>반갑습니다! </span>회원님
						</div>
						<ul class="profileMenu">
							<li><i class="fas fa-user menuico"></i>마이페이지</li>
							<li><i class="fas fa-sign-out-alt menuico"></i>로그아웃</li>
							<li><i class="fas fa-exchange-alt menuico"></i>전문가로 전환</li>
						</ul>
					</div>
				</li>
			</ul>
		</nav>
	</header> <!------- headerEND -------> <!------- join_proStart ------->
	<div id="join_pro-body">
		<div id="join_pro_title">
			<h1>전문가</h1>
			<span><img src="resources/image/logo2.png"></span>
		</div>
		<div id="join_pro_categiry1">
			<h2>어떤 서비스를 제공할 수 있나요?</h2>
		</div>
		<form>
			<fieldset>
				<!--대 카테고리선택Start-->
				<!-- <label for="Pcategory">어떤 서비스를 제공할 수 있나요?</label> -->
				<div class="form-group">
					<div class="custom-control custom-radio" id="category-radio">
						<input type="radio" class="custom-control-input" id="customCheck1"
							name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck1">이사</label>
					</div>
					<div class="custom-control custom-radio" id="category-radio">
						<input type="radio" class="custom-control-input" id="customCheck2"
							name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck2">청소</label>
					</div>
					<div class="custom-control custom-radio" id="category-radio">
						<input type="radio" class="custom-control-input" id="customCheck3"
							name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck3">수리</label>
					</div>
				</div>
				<!--대 카테고리선택End-->

				<!--이사 카테고리선택Start-->
				<div class="form-group">
					<div class="custom-control custom-checkbox" id="category-checkbox1">
						<input type="checkbox" class="custom-control-input"
							id="customCheck1" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck1">용달화물운송</label>
					</div>
					<div class="custom-control custom-checkbox" id="category-checkbox1">
						<input type="checkbox" class="custom-control-input"
							id="customCheck2" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck2">소형원룸이사</label>
					</div>
					<div class="custom-control custom-checkbox" id="category-checkbox1">
						<input type="checkbox" class="custom-control-input"
							id="customCheck3" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck3">짐보관</label>
					</div>
				</div>
				<!--이사 카테고리선택End-->

				<!--수리 카테고리선택Start-->
				<div class="form-group">
					<div class="custom-control custom-checkbox" id="category-checkbox2">
						<input type="checkbox" class="custom-control-input"
							id="customCheck1" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck1">수도설치수리</label>
					</div>
					<div class="custom-control custom-checkbox" id="category-checkbox2">
						<input type="checkbox" class="custom-control-input"
							id="customCheck2" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck2">전기설치수리</label>
					</div>
					<div class="custom-control custom-checkbox" id="category-checkbox2">
						<input type="checkbox" class="custom-control-input"
							id="customCheck3" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck3">문설치수리</label>
					</div>
					<div class="custom-control custom-checkbox" id="category-checkbox2">
						<input type="checkbox" class="custom-control-input"
							id="customCheck4" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck4">생활수리</label>
					</div>
					<div class="custom-control custom-checkbox" id="category-checkbox2">
						<input type="checkbox" class="custom-control-input"
							id="customCheck5" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck5">철거정리</label>
					</div>
				</div>
				<!--수리 카테고리선택End-->

				<!--청소 카테고리선택Start-->
				<div class="form-group">
					<div class="custom-control custom-checkbox" id="category-checkbox3">
						<input type="checkbox" class="custom-control-input"
							id="customCheck1" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck1">화장실청소</label>
					</div>
					<div class="custom-control custom-checkbox" id="category-checkbox3">
						<input type="checkbox" class="custom-control-input"
							id="customCheck2" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck2">생활청소</label>
					</div>
					<div class="custom-control custom-checkbox" id="category-checkbox3">
						<input type="checkbox" class="custom-control-input"
							id="customCheck3" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck3">냉장고청소</label>
					</div>
					<div class="custom-control custom-checkbox" id="category-checkbox3">
						<input type="checkbox" class="custom-control-input"
							id="customCheck4" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck4">정리수납컨설팅</label>
					</div>
					<div class="custom-control custom-checkbox" id="category-checkbox3">
						<input type="checkbox" class="custom-control-input"
							id="customCheck5" name="Pcategory" checked=""> <label
							class="custom-control-label" for="customCheck5">입주이사청소</label>
					</div>
				</div>
				<!--청소 카테고리선택End-->


				<div class="box">
					<div id="join_pro-button">
						<!-- <form action="#" method="get"> -->
							<button type="button" class="btn-secondary"
								onclick="location.href='#.jsp'">다 음</button>
						<!-- </form> -->
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	<!------- join_proEnd -------> <!------- footerStart -------> <footer
		id="footer">
		<section id="bottom" class="clearfix">
			<div class="phone">
				<p>
					<span>1599-2121</span>
				</p>
				<p>평일 10:00 - 18:00</p>
				<p>(점심시간 13:00 - 14:00 제외·주말/공휴일 제외)</p>
				<ul class="sns">
					<li><i class="fab fa-facebook"></i></li>
					<li><i class="fab fa-instagram"></i></li>
					<li><i class="fab fa-youtube"></i></li>
				</ul>
			</div>
			<div class="service">
				<ul>
					<li class="sevName">해요소개</li>
					<li>회사소개</li>
					<li>채용안내</li>
				</ul>
				<ul>
					<li class="sevName">고객안내</li>
					<li>이용안내</li>
					<li>안전정책</li>
					<li>예상금액</li>
					<li>전문가소개</li>
				</ul>
				<ul>
					<li class="sevName">전문가안내</li>
					<li>이용안내</li>
					<li>전문가가이트</li>
					<li>전문가가입</li>
				</ul>
				<ul>
					<li class="sevName">고객센터</li>
					<li>공지사항</li>
					<li>자주묻는질문</li>
				</ul>
			</div>
		</section>
		<section id="bottomtxt">
			<p>(주)해요모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행,
				계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</p>
			<p>상호명:(주)해요모바일 · 대표이사:1조 · 개인정보책임관리자:1조 · 주소:서울특별시 마포구 거구장, 지하
				1층(커틀 타워)</p>
			<p>사업자등록번호:111-22-34323 · 통신판매업신고증:제 2015-서울강남-00567 호 · 직업정보제공사업
				신고번호:서울청 제 2019-21호</p>
			<p>고객센터:1599-2121 · 이메일:heayo@heayo.com</p>
			<p class="copy">Copyright heayo Web Inc. All Rights Reserved.</p>
		</section>
	</footer> <!------- footerEND -------> </wrap>
</body>

</html>