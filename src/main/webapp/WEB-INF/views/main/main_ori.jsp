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
			<li><a href="">로그인</a></li>
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
	<a href="#"><img src="resources/main/bt_01.png" alt="내마필조회"></a>
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
				<img src="resources/main/gp_02.jpg">
				<div class="busiColor01">
					<a>휴양</a>
				</div>
				<div class="li80">
					<p>마필의 적산과 예민성 및 소화불량이 감소되며 경주마의 체력 증가와 혈액 순환 및 유연성 향상에 도움이 됩니다.</p>
				</div>
			</li>
			<li>
				<img src="resources/main/gp_03.jpg">
				<div class="busiColor02">
					<a>체계적인 전문관리</a>
				</div>
				<div class="li80">
					<p>오랜 경험에서 추출된 마필개체의 특성에 따른 개별 맞춤급식으로 균형 잡힌 영양식과 탁월한 조교들의 체력훈련을 통하여 최고의 컨디션을 만들어 갑니다.</p>
				</div>
			</li>
			<li>
				<img src="resources/main/gp_04.jpg">
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
			<li><img src="resources/main/gp_16.jpg">
			<a>정기 건강검진</a></li>
			<li><img src="resources/main/gp_17.jpg">
			<a>매주 장체 및 말굽 관리</a></li>
			<li><img src="resources/main/gp_18.jpg">
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
					<a>방목장</a><br />
					<a>자유로운 방목장 안에서 경주마들이 휴식을 취하며 힐링을 합니다. </a>
				</div>
			</li>
			<li>
				<img src="resources/main/gp_20.jpg" alt="기승 훈련">
				<div class="text">
					<a>기승 훈련</a><br />
					<a>숙련된 트레이너의 직접 기승 훈련을 통하여 주법훈련을 강화하고 있습니다.</a>
				</div>
			<li>
				<img src="resources/main/gp_21.jpg" alt="특화된 급식">
				<div class="text">
					<a>특화된 급식</a><br />
					<a>각 개체의 특성 및 부족한 분에 대한 집중적인 보양을 통한 배식으로 균형적인 체격 및 체력형성·유지를 위하여 노력하고 있습니다.</a>
				</div>
			</li>
		</ul>
	</div>
</div>

<div class="depth" id="depth">
	<div class="title">
		<a>공지사항</a>
	</div>
	
	<div class="sch">
		<input class="schBox" type="text" placeholder="Search" />
		<img alt="검색" src="resources/main/bt_07.png">
	</div>
	
	<div class="board">
		<table class="boardList">
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 60%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
			</colgroup>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td class="groundGrean"><a>공지</a></td>
				<td><a href="#signUp">2019년 설 휴무 알림</a></td>
				<td>2019-04-04</td>
				<td>100</td>
			</tr>
			<tr>
				<td class="groundGrean"><a>공지</a></td>
				<td><a href="#signUp">2018년 월 회원 이벤트</a></td>
				<td>2018-12-16</td>
				<td>264</td>
			</tr>
			
			<c:forEach var="i" begin="1" end="8" step="1">
			<tr>
				<td>${i }</td>
				<td><a href="#signUp">야간 승마 운영 안내</a></td>
				<td>2018-01-16</td>
				<td>35</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>
	<div>
		<ul class="number">
			<li><img alt="첫페이지" src="resources/main/bt_08.jpg"></li>
			<li><img alt="이전페이지" src="resources/main/bt_09.jpg"></li>
			<li>1</li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
			<li>5</li>
			<li><img alt="첫페이지" src="resources/main/bt_11.jpg"></li>
			<li><img alt="이전페이지" src="resources/main/bt_10.jpg"></li>
		</ul>
	</div>
</div>

<a href="#x" class="overlay" id="signUp"></a>
<div class="popup">
	<div class="title2">
		<a>2019년 설 휴무 알림</a>
	</div>
	<div class="flotRight">
		<a>관리자 &ensp;&vert;&ensp; 2019.01.04&ensp; &vert;&ensp; 90 &ensp;</a>
	</div>
	<div class="text">
		<a>2019년 새해가 밝았습니다.<br />
		원하시는 모든 것들 이루시고 웃을 수 있는 한해 보내시기 바랍니다 ^^</a>
	</div>
	<div class="img">
		<img alt="이미지" src="resources/main/ex1.jpg">
	</div>
	<div class="down">
		<a>첨부파일</a>
		<img alt="다운이미지" src="resources/main/down.png"><a>첨부파일.txt</a>
		<img alt="다운이미지" src="resources/main/down.png"><a>첨부파일.txt</a>
	</div>
<a class="close" href="#close"></a>
</div>

<div class="location" id="location">
	<div class="title">
		<a>오시는 길</a>
	</div>
	<div class="map">
		<img src="resources/main/gp_26.jpg">
	</div>
	<ul>
		<li><img src="resources/main/gp_22.jpg"><a class="bold">경기도 화성시 서신면 궁평항로 128 (궁평리 376-6)</a></li>
	</ul>
	<ul class="width03">
		<li><img src="resources/main/gp_23.jpg"><a>1588-1111(미정)</a></li>
		<li><img src="resources/main/gp_24.jpg"><a>031-357-7191</a></li>
		<li><img src="resources/main/gp_25.jpg"><a>gpcamp@gpcamp.com</a></li>
	</ul>
</div>

<div class="footer">
	<img src="resources/main/logo_bt.png" alt="궁평캠프">
	<a class="text">대표자 : 곽홍석  ｜  회사주소 : 경기도 화성시 서신면 궁평리 376-6  우.18556  ｜   대표번호: 1588-1111(미정)  ｜   팩스 : 031-357-7191  </a>
	<br /><a>Copyright © 2019 GP CAMP. All rights reserved.</a>
</div>

</body>
</html>