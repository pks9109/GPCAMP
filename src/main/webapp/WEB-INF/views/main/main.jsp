<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<script src="js/bxslider/jquery.bxslider.js"></script>
<script type="text/javascript">
$(function(){
	$('.bxslider').bxSlider({
	mode: 'fade',
	captions: true
	});
});

/* 권수 추가 2019-02-27 */
jQuery(document).ready(function() {
	var conPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)); //contextpath 구함
	$.ajax({ 
		type: 'post' , 
		url: conPath + '/boardList?board_division=notice',
		cache : false,
		dataType : 'html' ,
		success: function(data) {
			$('#noticeList').html(data).trigger("create");
		} 
	});
	
    
   $(document).off("click", "[name='page_move']").on("click","[name='page_move']",function() {
    	var conPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)); //contextpath 구함
		var id_check = $(this).attr("id"); //해당 seq값을 가져오기위해 새로 추가
		var sch_type = $("#sch_type").val();
		var sch_value = $("#sch_value").val();
		var totalPage = $('#totalPage').val(); //다운로드 목록 전체 페이지 수
		var visiblePages = 10;//리스트 보여줄 페이지
		$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
		var startPageList = $('#startPage').val();
		$('#startPageList').val(startPageList);
		var startPage = $('#startPageList').val(); 
		$('#visiblePages').val(visiblePages);
			if(id_check == "page_num"){
			$.ajax({ 
				type: 'post' , 
				url: conPath + '/boardList?board_division=notice&startPage='+ startPage +'&visiblePages='+visiblePages+'&sch_type='+sch_type+'&sch_value='+sch_value ,
				async : false,
				cache : false,
				dataType : 'html' ,
				success: function(data) { 
					$('#noticeList').empty();
					$('#noticeList').html(data).trigger("create");
				} 
			});
			}else if(id_check == "start"){
				$.ajax({ 
					type: 'post' , 
					url: conPath + '/boardList?board_division=notice&startPage=1&visiblePages=10&sch_value='+sch_value+'&sch_type='+sch_type,
					async : false,
					cache : false,
					dataType : 'html' , 
					success: function(data) { 
						$('#noticeList').empty();
						$('#noticeList').html(data).trigger("create");
					} 
				});

			}else if(id_check == "end"){
				$.ajax({ 
					type: 'post' , 
					url: conPath + '/boardList?board_division=notice&startPage='+totalPage+'&visiblePages=10&sch_value='+sch_value+'&sch_type='+sch_type,
					async : false,
					cache : false,
					dataType : 'html' , 
					success: function(data) {
						$('#noticeList').empty();
						$('#noticeList').html(data).trigger("create"); 
					} 
				});

			}else if(id_check == "next"){
				$.ajax({ 
					type: 'post' ,
					url: conPath + '/boardList?board_division=notice&startPage='+startPage+'&visiblePages=10&sch_value='+sch_value+'&sch_type='+sch_type,
					async : false,
					cache : false,
					dataType : 'html' , 
					success: function(data) {
						$('#noticeList').empty();
						$('#noticeList').html(data).trigger("create"); 
					} 
				});

			}else if(id_check == "prev"){
				$.ajax({ 
					type: 'post' ,
					url: conPath + '/boardList?board_division=notice&startPage='+startPage+'&visiblePages=10&sch_value='+sch_value+'&sch_type='+sch_type,
					async : false,
					cache : false,
					dataType : 'html' , 
					success: function(data) {
						$('#noticeList').empty();
						$('#noticeList').html(data).trigger("create"); 
					} 
				});

			}else if(id_check == "searchBtn"){
				$.ajax({ 
					type: 'post' ,
					url: conPath + '/boardList?board_division=notice&startPage=&visiblePages=&sch_value='+sch_value+'&sch_type='+sch_type,
					async : false,
					cache : false,
					dataType : 'html' , 
					success: function(data) {
						$('#noticeList').empty();
						$('#noticeList').html(data).trigger("create"); 
					} 
				});

			}
	});
   
   $(document).off("click", "[name='tSeq']").on("click","[name='tSeq']",function() {
	   var tSeq = $(this).attr("id"); //해당 seq값을 가져오기위해 새로 추가
	   var conPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)); //contextpath 구함
	   var startPage = $('#startPageList').val(); 
	   var visiblePages = 10;//리스트 보여줄 페이지
	   var sch_type = $("#sch_type").val();
	   var sch_value = $("#sch_value").val();

		   //클릭시 조회 수 1씩 증가
		   $.ajax({
		   		type : "POST",
		   		url : conPath + "/boardHit",
		   		data : {board_seq : tSeq} ,
		   		dataType : "json",
		   		async : false,
		   		cache: false,
		   		success: function(data){ 
		   		}  
		   	});
		   
 		   $.ajax({ 
				type: 'POST' , 
				url: conPath + '/boardList?board_division=notice&startPage='+ startPage +'&visiblePages='+visiblePages+'&sch_value='+sch_value+'&sch_type='+sch_type ,
				async : false,
				cache : false,
				dataType : 'html' ,
				success: function(data) { 
					$('#noticeList').empty();
					$('#noticeList').html(data).trigger("create");
				} 
			});
	   });
   
}); 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>궁평캠프</title>
</head>
<body>
<div class="gpcamp">
	<div class="menu">
		<div class="logo"><img src="resources/main/logo.png" alt="궁평캠프"></div>
		<ul class="nav">
			<li><a href="#intro" class="nav_lins">소개</a></li>
			<li><a href="#insta" class="nav_lins">시설물</a></li>
			<li><a href="#section" class="nav_lins">운동방향</a></li>
			<li><a href="#depth" class="nav_lins">공지사항</a></li>
			<li><a href="#location" class="nav_lins">오시는 길</a></li>
			<li><a href="http://www.gpcamp.kr/cmsInterlink" target="_blank">로그인</a></li>
		</ul>
	</div>
	
	<div class="imgSiler">
		<ul class="bxslider">
			<li><img src="resources/main/banner_01.jpg" alt="Healthy&Run"></li>
			<li><img src="resources/main/banner_02.jpg" alt="Healthy&Run"></li>
		</ul>
	</div>
</div>

<div class="c-quick">
	<a href="void(0);" onclick="alert('준비 중 입니다.');return false;"><img src="resources/main/bt_01.png" alt="내마필조회"></a>
</div>
<div class="topBut">
	<img src="resources/main/bt_06.png" alt="맨위로">
</div>

<div class="intro" id="intro">
	<div class="title">
	<a>소개</a>
	</div>
	
	<div class="about">
		<ul class="width02">
			<!-- <li><img src="resources/main/gp_01.jpg" alt="대표 곽홍석"></li> -->
			<li>
				<div class="title2">
				<a>인사말</a>
				</div>
				<p>(주)궁평캠프는 힐링을 통하여 우승을 향한 열정을 다듭어 갑니다. <br> 우승은 작은 정성들이 모여서 이루어 집니다. <br> 맑은 공기, 환한 태양, 부드러운 모래의 쉼터에서 뛰놉니다. <br> 엄마의 마음, 사랑으로 돌봅니다. <br> 균형 잡힌 영양식과 체력훈련으로 우승을 준비합니다. <br> 우승을 향한 모든 과정을 계획하고 정성껏 채워 갑니다. <br> 한폭의 수묵화처럼 아름다운 곳에서 우승을 향한 열정을 다듬어 갑니다. </p>
			</li>
			<li><img src="resources/main/gp_01.jpg" alt="대표 곽홍석"></li>
		</ul>
	</div>
	<div class="busi">
		<div class="title2">
			<a>운영전략</a>
		</div>
		<ul class="width03">
			<li>
				<img src="resources/main/gp_02.png">
				<div class="busiColor01">
					<a>휴양</a>
				</div>
				<div class="li80">
					<p>마필의 적산과 예민성 및 소화불량이 감소되며 경주마의 체력 증가와 혈액 순환 및 유연성 향상에 도움이 됩니다.</p>
				</div>
			</li>
			<li>
				<img src="resources/main/gp_03.png">
				<div class="busiColor02">
					<a>체계적인 전문관리</a>
				</div>
				<div class="li80">
					<p>오랜 경험에서 추출된 마필개체의 특성에 따른 개별 맞춤급식으로 균형 잡힌 영양식과 탁월한 조교들의 체력훈련을 통하여 최고의 컨디션을 만들어 갑니다.</p>
				</div>
			</li>
			<li>
				<img src="resources/main/gp_04.png">
				<div class="busiColor03">
					<a>차별화</a>
				</div>
				<div class="li80">
					<p>한국 마사회와 지속적이고 유기적인 협력업체로 자리매김하여 한국말산업의 첨병으로 혁신적인 발전에 함께하는 기업이 되겠습니다.</p>
				</div>
			</li>
		</ul>
	</div>
</div>

 
<div class="insta" id="insta">
	<div class="title">
		<a>시설물</a>
	</div>
	<ul class="width03">
		<li>
			<img src="resources/main/gp_05.jpg" alt="관리동"> <br> <strong>관리동</strong>
		</li>
		<li>
			<img src="resources/main/gp_06.jpg" alt="관리동"> <br> <strong>방목장</strong>
		</li>
		<li>
			<img src="resources/main/gp_07.jpg" alt="관리동"> <br> <strong>실내마장</strong>
		</li>
	</ul>
	<ul class="width03">
		<li>
			<img src="resources/main/gp_08.jpg" alt="관리동"> <br> <strong>마방</strong>
		</li>
		<li>
			<img src="resources/main/gp_09.jpg" alt="관리동"> <br> <strong>주로</strong>
		</li>
		<li>
			<img src="resources/main/gp_10.jpg" alt="관리동"> <br> <strong>워킹머신</strong>
		</li>
	</ul>
	<ul class="width03">
		<li>
			<img src="resources/main/gp_11.jpg" alt="관리동"> <br> <strong>배식실</strong>
		</li>
		<li>
			<img src="resources/main/gp_12.jpg" alt="관리동"> <br> <strong>원형마장</strong>
		</li>
		<li>
			<img src="resources/main/gp_13.jpg" alt="관리동"> <br> <strong>수영장</strong>
		</li>
	</ul>
</div>

<div class="sectio" id="section">
	<div class="title">
		<a>운동방향</a>
	</div>
	
	<div class="basic">
		<div class="title2">
			<a>기본관리</a>
		</div>
		<ul class="width02">
			<li><img src="resources/main/gp_14.jpg" alt="저울"></li>
			<li><img src="resources/main/gp_15.jpg" alt="방목장"></li>
		</ul>
		
		<ul class="width03">
			<li><img src="resources/main/gp_16.png">
			<a>정기 건강검진</a></li>
			<li><img src="resources/main/gp_17.png">
			<a>매주 장체 및 말굽 관리</a></li>
			<li><img src="resources/main/gp_18.png">
			<a>즐거운 힐링</a></li>
		</ul>
	</div>
	
	<div class="spec">
		<div class="title2">
			<a>전문관리</a>
		</div>
		<ul class="width03">
			<li>
				<img src="resources/main/gp_19.jpg" alt="방목장">
				<div class="text">
					<a>방목장</a>
					<a>자유로운 방목장 안에서 경주마들이 휴식을 취하며 힐링을 합니다. </a>
				</div>
			</li>
			<li>
				<img src="resources/main/gp_20.jpg" alt="기승 훈련">
				<div class="text">
					<a>기승 훈련</a>
					<a>숙련된 트레이너의 직접 기승 훈련을 통하여 주법훈련을 강화하고 있습니다.</a>
				</div>
			<li>
				<img src="resources/main/gp_21.jpg" alt="특화된 급식">
				<div class="text">
					<a>특화된 급식</a>
					<a>각 개체의 특성 및 부족한 분에 대한 집중적인 보양을 통한 배식으로 균형적인 체격 및 체력형성·유지를 위하여 노력하고 있습니다.</a>
				</div>
			</li>
		</ul>
	</div>
</div>

<div class="depth" id="depth">
<div class="container" id="noticeList">
</div>
</div>

<div class="location" id="location">
	<div class="title">
		<a>오시는 길</a>
	</div>
	<div class="map" id="map">
		<img src="">
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d82b4891a59728c973a033fb7e33bb6e"></script>
				
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new daum.maps.LatLng(37.1262001, 126.6891238),
						level: 3
					};
					
					var map = new daum.maps.Map(container, options);

					
					// 마커가 표시될 위치입니다 
					var markerPosition  = new daum.maps.LatLng(37.1262001, 126.6891238); 

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);

					var iwContent = '<div style="padding:5px;">궁평캠프 <br><a href="http://map.daum.net/link/map/궁평캠프,37.1262001, 126.6891238" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/궁평캠프,37.1262001, 126.6891238" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    iwPosition = new daum.maps.LatLng(37.1262001, 126.6891238); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new daum.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker); 
				</script>
	<ul>
		<li><img src="resources/main/gp_22.png"><a class="bold">경기도 화성시 서신면 궁평항로 128 (궁평리 376-6)</a></li>
	</ul>
	<ul class="width03">
		<li><img src="resources/main/gp_23.png"><a>1588-1111(미정)</a></li>
		<li><img src="resources/main/gp_24.png"><a>031-357-7191</a></li>
		<li><img src="resources/main/gp_25.png"><a>gpcamp@gpcamp.com</a></li>
	</ul>
</div>

<div class="footer">
	<img src="resources/main/logo_bt.png" alt="궁평캠프">
	<a class="text">대표자 : 곽홍석&nbsp｜&nbsp회사주소 : 경기도 화성시 서신면 궁평리 376-6  우.18556&nbsp</a><a class="text">｜&nbsp대표번호: 1588-1111(미정)&nbsp｜&nbsp팩스 : 031-357-7191</a>
	<a>Copyright © 2019 GP CAMP. All rights reserved.</a>
</div>

</body>
</html>