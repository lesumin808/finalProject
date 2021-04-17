<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<link href="image/icon.ico" rel="shortcut icon" type="image/x-icon">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<link href="resources/css/togetherBoard.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
<script src="resources/js/togetherBoard.js?v=<%=System.currentTimeMillis()%>"></script>

	<div id="t_upper_contents">
		<div id="t_upper_content1">${board.tHeader}</div>
	</div>
	<!------- contents start --------->
	<div id="t_contents">
		<table >
			<tr>
				<th id="t_title" >${board.tTitle}</th>
				<c:choose>
					<c:when test="${board.tBookmarkVO.tNo != null}">
						<td class="tBookmark select" onclick="checkBookmark(${board.tNo})">1</td>
					</c:when>
					<c:otherwise>
						<td class="tBookmark" onclick="checkBookmark(${board.tNo})">0</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		<div>
			<table class="table table-striped" id="t_content">
				<tr>
					<td rowspan="5"><img src="/WEB-INF/boardImages/${board.tPic1}" height="200" width="200"></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>${board.userVO.uNick}</td>
					<td>조회수 ${board.tHits}</td>
				</tr>
				<tr>
					<th >날짜</th>
					<td>${board.tJoinDate}</td>
					<td><button class="btn btn-primary">달력보기</button></td>
				</tr>
				<tr>
					<th>모임 장소</th>
					<td>${board.tAddress}</td>
					<td><button class="btn btn-primary">지도보기</button></td>
				</tr>
				<c:if test="${board.tHeader == '함께출퇴근해요'}">
					<tr>
					<th>도착 장소</th>
					<td>${board.tDestinationVO.dAddress}</td> <!-- 여기부터 다시하자 -->
					<td><button class="btn btn-primary">지도보기</button></td>
				</tr>
				</c:if>
				<tr>
					<th>인원</th>
					<td><span id="tJoinNow">${board.tJoinNow}</span>/${board.tJoinMax}</td>
					<td><button class="btn btn-primary" id="tJoinButton"
							onclick="checkJoin(${board.tNo},${board.tJoinNow},${board.tJoinMax})">참여하기</button></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td colspan="2">${board.tContent}</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th>사진</th>
					<td colspan="3"><img src="/WEB-INF/boardImages/${board.tPic2}" height="230"
						width="300"></td>
					<td></td>
				</tr>
			</table>
			<div id="map" style="width:100%;height:350px;"></div>
			<div id="middlebuttons">
				<c:if test="${board.hNo == userVO.uNo}">
					<div class="middlebutton">
						<a href="t_getUpdateBoard.do?tNo=${board.tNo}"><button
								class="btn btn-primary">수정하기</button></a>
					</div>
					<div class="middlebutton">
						<a href="t_deleteBoard.do?tNo=${board.tNo}"><button
								class="btn btn-primary">삭제하기</button></a>
					</div>
				</c:if>
				<div class="middlebutton">
					<a href="t_openBoardList.do?tHeader=${board.tHeader}"><button
					 	class="btn btn-primary">목록으로</button></a>
				</div>
			</div>
		</div>
		<div id="t_reply">
			<div>COMMENT</div>
			<table class="table" id="t_replyTable">
				<tr>
					<!-- 접속중인 user정보 가져와야함 -->
					<td>${userVO.uPic}</td>
					<th>${userVO.uNick}</th>
					<td>
						<form id="t_replyForm" method="GET">
							<input type="text" id="trContent" name="trContent"> <input
								type="hidden" id="uNo" name="uNo" value="${userVO.uNo}">
							<input type="hidden" id="tNo" name="tNo" value="${board.tNo}">
						</form>
					</td>
					<td><button class="heayo_btn" onclick="insertReply();">등록</button></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr id="t_reply_content">
					<c:forEach var="Reply" items="${ReplyList}">
						<tr id="trNo${Reply.trNo}">
							<td>${Reply.userVO.uPic}</td>
							<th>${Reply.userVO.uNick}</th>
							<td>${Reply.trContent}</td>
							<td>${Reply.trCredate}</td>
							<c:if test="${Reply.uNo == userVO.uNo}">
								<td><button class="heayo_btn"
										onclick="editReply(${Reply.trNo},${Reply.tNo});">수정</button></td>
								<td><button class="heayo_btn" 
										onclick="deleteReply(${Reply.trNo});">삭제</button></td>
							</c:if>
						</tr>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>

	<!------- contents end --------->


<!-- 
<script src="resources/js/togetherMap.js?v=<%=System.currentTimeMillis()%>"></script>
-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a53c0b810ce1d051d15c474f3785be1d"></script>
<script>

	var tHeader = '${board.tHeader}';
	var tLocX = '${board.tLocX}';
	var tLocY = '${board.tLocY}';
	var dLocX = '${board.tDestinationVO.dLocX}';
	var dLocY = '${board.tDestinationVO.dLocY}';
	console.log(tHeader+","+tLocX+","+tLocY+","+dLocX+","+dLocY);
	
	if(tHeader == '함께출퇴근해요'){
		getCommuteMap();
	}else{
		getMap();
	}
	
	function getMap(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(tLocX, tLocY), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(tLocX, tLocY); 
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	}	
	
	function getCommuteMap(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(tLocX,tLocY),
		        level: 9 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
		    startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
		    startOption = { 
		        offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		    };
		
		// 출발 마커 이미지를 생성합니다
		var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);
		
		var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다    
		    startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다 
		    startDragOption = { 
		        offset: new kakao.maps.Point(tLocX, tLocY) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		    };
		
		// 출발 마커의 드래그 이미지를 생성합니다
		var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);
		
		// 출발 마커가 표시될 위치입니다 ***
		var startPosition = new kakao.maps.LatLng(tLocX, tLocY); 
		
		// 출발 마커를 생성합니다
		var startMarker = new kakao.maps.Marker({
		    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
		    position: startPosition,
		    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
		    image: startImage // 출발 마커이미지를 설정합니다
		});
		
		// 출발 마커에 dragstart 이벤트를 등록합니다
		kakao.maps.event.addListener(startMarker, 'dragstart', function() {
		    // 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
		    startMarker.setImage(startDragImage);
		});
		
		// 출발 마커에 dragend 이벤트를 등록합니다
		kakao.maps.event.addListener(startMarker, 'dragend', function() {
		     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
		    startMarker.setImage(startImage);
		});
		
		var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
		arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
		arriveOption = { 
		    offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		};
		
		// 도착 마커 이미지를 생성합니다
		var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
		
		var arriveDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다    
		    arriveDragSize = new kakao.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다 
		    arriveDragOption = { 
		        offset: new kakao.maps.Point(dLocX, dLocY) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		    };
		 
		// 도착 마커의 드래그 이미지를 생성합니다
		var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);
		
		// 도착 마커가 표시될 위치입니다 **
		var arrivePosition = new kakao.maps.LatLng(dLocX, dLocY);    
		 
		// 도착 마커를 생성합니다 
		var arriveMarker = new kakao.maps.Marker({  
		    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
		    position: arrivePosition,
		    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
		    image: arriveImage // 도착 마커이미지를 설정합니다
		});
		
		// 도착 마커에 dragstart 이벤트를 등록합니다
		kakao.maps.event.addListener(arriveMarker, 'dragstart', function() {
		    // 도착 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
		    arriveMarker.setImage(arriveDragImage);
		});
		
		// 도착 마커에 dragend 이벤트를 등록합니다
		kakao.maps.event.addListener(arriveMarker, 'dragend', function() {
		     // 도착 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
		    arriveMarker.setImage(arriveImage);  
		});
	}
</script>
