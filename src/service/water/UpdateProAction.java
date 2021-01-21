package service.water;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.water.Qna;
import dao.water.QnaDao;
import service.CommandProcess;

public class UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			System.out.println("수정버튼 pro 시작...");
			
			 request.setCharacterEncoding("utf-8");
			   int maxSize=10*1024*1024;
			   String rootPath=request.getServletContext().getRealPath("/");
			   String savePath=rootPath+"qnafile/";
			   MultipartRequest multi=new MultipartRequest(request,savePath,maxSize,"utf-8", new DefaultFileRenamePolicy());
			   Enumeration en=multi.getFileNames();
			   List<String> filenames=new ArrayList<String>();
			   while(en.hasMoreElements()){
			   String filename1=(String)en.nextElement(); //파라미터명 ex) pthumbimg->col5->col4
			   System.out.println("filename1 ->"+filename1);
			   String filename=multi.getFilesystemName(filename1); //이미지명 ex)img1.png, img2.png
			   
			   
			   System.out.println("filename -> "+filename);
			   String original=multi.getOriginalFileName(filename1); //전송 전 원래 이름 ex) img1.png
			   String type=multi.getContentType(filename1); //전송 전 파일의 내용 타입 ex) image/png
			   System.out.println("type -> "+type);
			   File file=multi.getFile(filename1);  //전송된 파일 속성이 file인 태그의 name 속성값을 이용해 객체 생성
			   filenames.add(filename);
			   
			   
			   System.out.println("savePath->"+savePath);
			   System.out.println("filenames -> "+filename);
		}
			   
			
			
			
			
			
		 String pageNum = request.getParameter("pageNum");
		 Qna qna = new Qna();
		 
		 System.out.println("문의수정버튼 qid = "+multi.getParameter("qid"));
		 System.out.println("문의수정버튼 sid = "+multi.getParameter("sid"));
		 qna.setQid(Integer.parseInt(multi.getParameter("qid")));
		 qna.setSid(Integer.parseInt(multi.getParameter("sid")));
		 qna.setQcontent(multi.getParameter("qcontent"));
		 qna.setQctg(multi.getParameter("qctg"));
	     qna.setQfile("./qnafile/"+filenames.get(0));
	        
	        
		 QnaDao qd = QnaDao.getInstance();
		 int result = qd.update(qna);
		 
		 
		 System.out.println("수정 result ="+result);
		 
		 request.setAttribute("qna", qna);
		 request.setAttribute("result", result);
		 request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println("수정 오류 : " + e.getMessage() );
		}
		return "updatePro.jsp";
	}

}