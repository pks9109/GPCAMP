<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<div class="title">
		<a>공지사항</a>
	</div>
	<input type="hidden" id="startPageList" name="startPageList" value="${startPage}">
	<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}">
	<input type="hidden" id="totalCnt" name="totalCnt" value="${totalCnt}">
	<div class="sch">
		<form name="board_form"  method="get">
		<input type="hidden" id="board_division" name="board_division" value="${board_division}">
		<input type="hidden" id="startPage" name="startPage" value="">
		<input type="hidden" id="visiblePages" name="visiblePages" value="">
		<input type="hidden" id="sch_type" name="sch_type" value="board_title"  />
		<input class="schBox" type="text" id="sch_value" name="sch_value" placeholder="Search" value="${sch_value}" />
		<img alt="검색" name="page_move" id="searchBtn" src="resources/main/bt_07.png" />
		</form>
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
		<!-- 게시글이 존재 하지 않으면 미 출력 -->
		<c:if test="${fn:length(boardList) == 0}">	
			<tr>
			<td colspan="4">
			조회 결과가 없습니다.
			</td>
			</tr>
		</c:if>
			<!-- 리스트 불러와서 for문 돌림 -->
			<c:forEach var="boardList" items="${boardList}" varStatus="status" >
			<tr>
				<c:if test="${boardList.board_notice == 0}">
				<td>
				<!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                <c:set var="startpage" value="${startPage-1}" />
                <c:set var="statuscount" value="${status.count }" />
                <a>${totalCnt+1-(startpage*10+statuscount)}</a></td>
                </c:if>
                <c:if test="${boardList.board_notice != 0}">
                <td class="groundGrean"><a>공지</a></td>
                </c:if>
				<td><a href="#signUp${status.index}" name="tSeq" id="${boardList.board_seq}" class="boardListTitleA" >${boardList.board_title}</a></td>
				<td>${boardList.board_register_date}</td>
				<td>${boardList.board_hit}</td>
			</tr>
			<a href="#x" class="overlay" id="signUp${status.index}"></a>
				<div class="popup">
					<div class="title2">
						<a>${boardList.board_title}</a>
					</div>
					<div class="flotRight">
						<a>관리자 &ensp;&vert;&ensp; ${boardList.board_register_date}&ensp; &vert;&ensp; ${boardList.board_hit} &ensp;</a>
					</div>
					<div class="text">
						<a>${boardList.board_content}</a>
					</div>
					<div class="img">
						<c:if test="${boardList.file_cnt != 0}">
						<c:set var="extName" value="${fn:split(boardList.file_ext_name,'|')}" />
						<c:set var="split_file" value="${fn:split(boardList.file_sub_name,'|')}" />
						<c:forEach items="${split_file}" var="boardlist">
						<c:set var="ext" value="${fn:substringAfter(boardlist, '**')}" />
						<br>
						<c:if test="${ext == '.jpg' || ext == '.bmp' || ext == '.gif' || ext == '.png' || ext == '.jpeg'}">
						<img alt="사진" src="http://gpcamp1.cafe24.com/cmsInterlink/resources/uploadFile/notice/${fn:substringBefore(boardlist, '*')}" />
						</c:if> 
						<br>									
						</c:forEach>
						</c:if>
					</div>
					<div class="down">
						<a>첨부파일</a>
						<c:if test="${boardList.file_cnt != 0}">												
						<c:set var="split_file" value="${fn:split(boardList.file_sub_name,'|')}" />
						<c:forEach items="${split_file}" var="boardlist">
						<img alt="다운이미지" src="resources/main/down.png">
						<a href="javascript:void(0);" onclick="downFile('${boardlist}', '${boardList.board_seq}');">
						<c:set var="oriName" value="${fn:substringAfter(boardlist, '_')}" />
						${fn:substringBefore(oriName, '*')}
						</a>									
						</c:forEach>
						</c:if>
					</div>
				<a class="close" href="#close"></a>
				</div>
			</c:forEach>
			
		</table>
	</div>
	<div>
		<c:if test="${fn:length(boardList) != 0}">
		<ul class="number" id="paging">
		</ul>
		</c:if>
	</div>
	<script>
		$(document).ready(function() {
						
			var totalData = $("#totalCnt").val();    // 총 데이터 수
		    var dataPerPage = 10;    // 한 페이지에 나타낼 데이터 수
		    var pageCount = "";        // 한 화면에 나타낼 페이지 수
		    if($("#totalPage").val() == "1"){
		    pageCount = 1;
		    }else if($("#totalPage").val() == "2"){
		    pageCount = 2;	
		    }else if($("#totalPage").val() == "3"){
			pageCount = 3;	
			}else if($("#totalPage").val() == "4"){
			pageCount = 4;	
			}else{
			pageCount = 5;	
			}
		    var next = "";
		    var prev = "";
		    function paging(totalData, dataPerPage, pageCount, currentPage){
		    	
		    	var startPage = $('#startPageList').val(); 			// 현재 페이지
		        console.log("currentPage : " + startPage);
		    	
		        var totalPage = Math.ceil(totalData / dataPerPage);   // 총 페이지 수
		        console.log("totalPage : " + totalPage);
		        
		        var pageGroup = Math.ceil(startPage / pageCount);    	// 페이지 그룹
		        console.log("pageGroup : " + pageGroup);
		        
		        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
		        if(last > totalPage){
		            last = totalPage;
		        }
		        
		        var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
		        
		        var next = last+1;
		        var prev = first-1;
		        
		        console.log("last : " + last);
		        console.log("first : " + first);
		        console.log("next : " + next);
		        console.log("prev : " + prev);
		 
		        var pingingView = $("#paging");
		        
		        var html = "";
		        
		        
				// 첫 페이지 | 이전 페이지
	        	if(prev == 0){
	        	html +=
	        		'<li>' +
	        		'<img alt="첫페이지" src="resources/main/bt_08.jpg" id="start" start_page="'+1+'">' +
	    			'</li>' +
	    			'<li>' +
	        		'<img alt="이전페이지" src="resources/main/bt_09.jpg" id="prev" start_page="'+prev+'">' +
	    			'</li>';
	        	}else{
	        	html +=
		        	'<li>' +
	        		'<img alt="첫페이지" src="resources/main/bt_08.jpg" name="page_move" id="start" start_page="'+1+'" style="cursor:pointer;">' +
	    			'</li>' +
	    			'<li>' +
	        		'<img alt="이전페이지" src="resources/main/bt_09.jpg" name="page_move" id="prev" start_page="'+prev+'" style="cursor:pointer;">' +
	    			'</li>';
				}
				
		        // 카운터 번호 출력	
		        for(var i=first; i <= last; i++){
		        	if (startPage == i) {
		        		html += '<li><a style="color:lightseagreen;" id="'+i+'" name="page_move" start_page="'+i+'" disabled>'+ i +'</a></li>';
		        	}else {
	        			html += '<li><a id="page_num" name="page_move" start_page="'+i+'" style="cursor:pointer;">'+ i +'</a></li>';	
	        		}
		        }
		        
		        //다음 페이지 | 맨 뒷 페이지
		    	if(last < totalPage){
		        	html +=
	        		'<li>' +
	        		'<img alt="첫페이지" src="resources/main/bt_11.jpg" name="page_move" id="next" start_page="'+next+'" style="cursor:pointer;">' + 
	    			'</li>' +
	        		'<li>' +
	        		'<img alt="이전페이지" src="resources/main/bt_10.jpg" name="page_move" id="end" start_page="'+totalPage+'" style="cursor:pointer;">' +
	    			'</li>';
		    	}else if(last == totalPage){
		    		html +=
	        		'<li>' +
	        		'<img alt="첫페이지" src="resources/main/bt_11.jpg" id="next" start_page="'+next+'">' + 
	    			'</li>' +
	        		'<li>' +
	        		'<img alt="이전페이지" src="resources/main/bt_10.jpg" id="end" start_page="'+totalPage+'">' +
	    			'</li>';
	    		}
		    	
		        $("#paging").append(html);    // 페이지 목록 생성
		        
// 		        -----------------------------------------------------
// 		        ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓필요 시 해제, ajax말고 일반 페이지 이동시 사용
		        
// 	            $("#paging a." + startPage).addClass("focus");    // 현재 페이지 표시
// 	            $("#paging a#" + startPage).addClass("focus");    // 현재 페이지 표시
		        
// 	            $("#paging a").click(function(){
		            
// 		            var item = $(this);
		            
// 		            var id = item.attr("id");
// 		            var selectedPage = item.text();
		            
// 		            if(id == "next")    selectedPage = next;
// 		            if(id == "prev")    selectedPage = prev;
// 		            if(id == "start")    selectedPage = 1;
// 		            if(id == "end")    selectedPage = totalPage;
		            
// 		            paging(totalData, dataPerPage, pageCount, selectedPage);
// 		        });
// 		        ----------------------------------------------------- 
		                                           
		    }
		    
		    $(document).ready(function(){        
		        paging(totalData, dataPerPage, pageCount, 1);		        
		    });
		    
		    
		    /* 모달창 띄었을때 body 스크롤 방지 */
		    $('.boardListTitleA').click(function(){
		       	var visibility = $( ".popup" ).css( "visibility" );
		       	if(visibility == "hidden") {
		       		console.log("hidden");
		       		$('body').css({overflow:'hidden'});
		       	}else{
		       		console.log("visibility");
		       		$('body').css({overflow:'visible'});
		       	}
		       });
		    $('.close').click(function(){
		    	$('body').css({overflow:'visible'});
		    });
		    $('.overlay').click(function(){
		    	$('body').css({overflow:'visible'});
		    });

		});
		
		//파일 다운로드
		function downFile(fileName){
			var conPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)); //contextpath 구함	
			var file_name = fileName.split('*');	//쿼리 구분자 날려서 필요 한 부분 get방식으로 뽑아서 씀
			if(file_name[1] == "notice"){
				location.href = conPath + "/boardFileDown?file_name="+encodeURI(file_name[0])+"&board_division="+file_name[1]+"&file_seq="+file_name[2];
			}
		}

		</script>