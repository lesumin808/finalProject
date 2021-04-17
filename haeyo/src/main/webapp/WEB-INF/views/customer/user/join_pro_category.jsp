<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="com.haeyo.biz.profession.ProfessionVO"%>
<link href="image/icon.ico" rel="shortcut icon" type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="resources/css/join_pro_category.css" rel="stylesheet">
<link href="resources/css/common.css" rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script defer src="resources/js/join_pro_category.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52c7f3d664707319c1c8977f5f4a2421&libraries=services"></script>
<%
	session = request.getSession();
ProfessionVO profession = (ProfessionVO) session.getAttribute("profession");
%>
<!---------------------body--------------------->
<div id="join_pro-body">
	<div id="join_pro_title">
		<h1>전문가</h1>
		<span><img src="resources/image/logo2.png"></span>
	</div>
	<div id="join_pro_categiry1">
		<h2>어떤 서비스를 제공할 수 있나요?</h2>
	</div>
	<form action="insertProCate.do" name=form method="post"
		onsubmit="return joinprocategory_check();">
		<fieldset>
			<c:if test="${pCategory eq '이사'}">
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
			</c:if>
			<c:if test="${pCategory eq '청소'}">
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
			</c:if>
			<c:if test="${pCategory eq '수리'}">
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
			</c:if>


			<div class="box">
				<div id="join_pro-button">
					<button type="submit" class="btn-secondary">완 료</button>
				</div>
			</div>
		</fieldset>
	</form>
</div>