package com.homepage.gpcamp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homepage.gpcamp.model.Board;
import com.homepage.gpcamp.service.BoardFileService;
import com.homepage.gpcamp.service.BoardService;

@Controller
public class MainController {
	@Autowired
    BoardService boardService;
	@Autowired
    BoardFileService boardFileService;
	
		//궁평캠프 메인화면
		@RequestMapping(value = "/main") 
		public String main(){
			
			return "main/main";
			
		}
		
		//공지사항 리스트 TEST
		@RequestMapping(value = "/boardList", method=RequestMethod.POST)
		public String boardList(@RequestParam Map<String, Object> paramMap, Model model, Board board, HttpServletRequest request) {
			
			//조회 하려는 페이지
	        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);

	        //한페이지에 보여줄 리스트 수
	        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
	        //일단 전체 건수를 가져온다.
	        int totalCnt = boardService.board_cnt(paramMap);
	        
	        //아래 1,2는 실제 개발에서는 class로 빼준다. (여기서는 이해를 위해 직접 적음)
	        //1.하단 페이지 네비게이션에서 보여줄 리스트 수를 구한다.
	        BigDecimal decimal1 = new BigDecimal(totalCnt);
	        BigDecimal decimal2 = new BigDecimal(visiblePages);
	        BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);
	        
	        //int allCount = boardService.getallCount(paramMap);
	 
	        int startLimitPage = 0;
	        //2.mysql limit 범위를 구하기 위해 계산
	        if(startPage==1){
	            startLimitPage = 0;
	        }else{
	            startLimitPage = (startPage-1)*visiblePages;
	        }
	        
	        paramMap.put("start", startLimitPage);
	        paramMap.put("end", visiblePages);
	        
	        model.addAttribute("startPage", startPage+"");//현재 페이지      
	        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
	        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
	        model.addAttribute("sch_value", paramMap.get("sch_value"));
	        model.addAttribute("sch_type", paramMap.get("sch_type"));
	        
			model.addAttribute("boardList", boardService.board_list(paramMap));
			
			return "main/board/boardList";
		}
		
		//공통 CMS 게시판 다운로드 액션
		@RequestMapping("/boardFileDown")
	    private void boardFileDown(Board board, String file_name, String file_seq, String board_division, HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			request.setCharacterEncoding("UTF-8");
	   		
	   		try {
				 /*상대경로 */
	   			
	   			
//			!!!!!!필수!!!!!!!!!호스팅 업로드 경로로 맞춰줘야함 프로젝트 이름 cmsinterlink
//			↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	   			
//			String file_path = request.getSession().getServletContext().getRealPath("/");  <-----이건 해당 war안에 상대경로 구하는 소스
//	   		String file_path = "C://interlink/4.Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/cmsInterlink/";	
	   		String file_path = "/gpcamp1/tomcat/webapps/cmsInterlink/"; //tomcat cmsInterlink war경로!
	   		
//			↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑   		
	   		String attach_path = "";
	   		
	   		attach_path = "resources/uploadFile/"+board_division+"/";

	   		String savePath = file_path+attach_path;
	   		String fileName = file_name;
	   		//실제 내보낼 파일명
	   		String oriFileName = file_name;
	   		String oriFileNames = oriFileName.substring(oriFileName.indexOf("_")+1);
	   		
	   		InputStream in = null;
	   		OutputStream os = null;
	   		File file = null;
	   		boolean skip = false;
	   		String client = "";
	   		
	   		//파일을 읽어 스트림에 담기
	   		try {
					file = new File(savePath, fileName);
					in = new FileInputStream(file);
				} catch (FileNotFoundException fe) {
					skip = true;
				}
	   		
	   		client = request.getHeader("User-Agent");
	   		
	   		//파일 다운로드 헤더 지정 
	           response.reset();
	           response.setContentType("application/octet-stream");
	           response.setHeader("Content-Description", "JSP Generated Data");
	           
	           if (!skip) {
	               // IE
	               if (client.indexOf("MSIE") != -1) {
	                   response.setHeader("Content-Disposition", "attachment; filename=\""
	                           + java.net.URLEncoder.encode(oriFileNames, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
	                   
	                   // IE 11 이상.
	               } else if (client.indexOf("Trident") != -1) {
	                   response.setHeader("Content-Disposition", "attachment; filename=\""
	                           + java.net.URLEncoder.encode(oriFileNames, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
	               } else {
	                   // 한글 파일명 처리
	                   response.setHeader("Content-Disposition",
	                           "attachment; filename=\"" + new String(oriFileNames.getBytes("UTF-8"), "ISO8859_1") + "\"");
	                   response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
	               }
	               response.setHeader("Content-Length", "" + file.length());
	               os = response.getOutputStream();
	               byte b[] = new byte[(int) file.length()];
	               int leng = 0;
	               while ((leng = in.read(b)) > 0) {
	                   os.write(b, 0, leng);
	                   boardFileService.file_hit(file_seq);
	               }
	           } else {
	               response.setContentType("text/html;charset=UTF-8");
	               System.out.println("파일을 찾을 수 없습니다.");
	           }
	           in.close();
	           os.close();
	       } catch (Exception e) {
	           System.out.println("ERROR : " + e.getMessage());
	       }
	   		
	   	}
		
		//공지사항 조회 수 +1씩
		@RequestMapping(value = "/boardHit", method = RequestMethod.POST)
		@ResponseBody
		public int boardHit(int board_seq) {

			int result = boardService.board_hit(board_seq);
			
			return result;
		}
		
	}