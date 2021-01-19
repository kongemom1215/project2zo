package service.dragon;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.dragon.Board;
import dao.dragon.BoardDao;
import dao.water.Qna;
import dao.water.QnaDao;
import dao.water.Review;
import dao.water.ReviewDao;
import service.CommandProcess;

public class BoardAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("-- service.dragon.BoardAction --");
		
		try {
		HttpSession session = request.getSession(true);
		session.setAttribute("session_sid", session.getAttribute("session_sid"));
		session.setAttribute("session_sname", session.getAttribute("session_sname"));
		session.setAttribute("session_stype", session.getAttribute("session_stype"));
		session.setAttribute("session_semail", session.getAttribute("session_semail"));
		} catch (Exception e) {
			System.out.println("오류 : "+ e.getMessage());
		}
		
		String pageNum = "";	
		int currentPage = 0;
		int pageSize = 0, blockSize = 0;
		int startRow = 0;
		int endRow = 0;
		int totCnt = 0;
		int startNum = 0;
		int pageCnt = 0;
		int startPage = 0;
		int endPage = 0;	
		
		String type = request.getParameter("type");
		
		BoardDao boarddao = BoardDao.getInstance();
		
		QnaDao qna = QnaDao.getInstance();
		ReviewDao rd = ReviewDao.getInstance();
		
		List<Board> list = new ArrayList<Board>();
		
		try {
		if (request.getParameter("nid") != null) {
			
		}
		
		} catch (Exception e) {
			System.out.println("오류 : "+ e.getMessage());
		}
		
		try {
		if (type.equals("notice")) {
			
		} else if (type.equals("review")) {
			try {
				pageNum = request.getParameter("pageNum");	
				if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
				currentPage = Integer.parseInt(pageNum);	
				pageSize  = 10;
				blockSize = 10;
				startRow = (currentPage - 1) * pageSize + 1;
				endRow =  startRow + pageSize - 1;
				totCnt = rd.getTotalCnt();
				startNum = totCnt - startRow + 1;   // 38
				List<Review> list_review = rd.list(startRow , endRow); 
				System.out.println("ListAction list.size()-->" + list_review.size());        // /och16/list.do
				 System.out.println("ListAction list.get(0).getContent()-->" + list_review.get(0).getRcontent()); // /och16/list.do
				pageCnt = (int)Math.ceil((double)totCnt/pageSize);
				startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
				endPage = startPage + blockSize -1;	
				if (endPage > pageCnt) endPage = pageCnt;	
				
				request.setAttribute("list",  list_review);
				
				request.setAttribute("sid", request.getParameter("sid"));
				request.setAttribute("rid", request.getParameter("rid"));
				request.setAttribute("rwriter", request.getParameter("rwriter"));
				request.setAttribute("rtitle", request.getParameter("rtitle"));
				request.setAttribute("rcontent", request.getParameter("rcontent"));
				request.setAttribute("rimg", request.getParameter("rimg"));
				request.setAttribute("rdate", request.getParameter("rdate"));
				request.setAttribute("rhit", request.getParameter("rhit"));
				request.setAttribute("rcmt", request.getParameter("rcmt"));
				request.setAttribute("rcmtwriter", request.getParameter("rcmtwriter"));
				request.setAttribute("odate", request.getParameter("odate"));
				request.setAttribute("pid", request.getParameter("pid"));
				
			} catch (Exception e) {
				
			}
		} else if (type.equals("qna")) {
			try {
				pageNum = request.getParameter("pageNum");	
				if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
				currentPage = Integer.parseInt(pageNum);	
				pageSize  = 10;
				blockSize = 10;
				startRow = (currentPage - 1) * pageSize + 1;
				endRow =  startRow + pageSize - 1;
				totCnt = qna.getTotalCnt();
				startNum = totCnt - startRow + 1;   // 38
				List<Qna> list_qna = qna.list(startRow , endRow); 
				System.out.println("ListAction list.size()-->" + list_qna.size());        // /och16/list.do
				System.out.println("ListAction list.get(0).getContent()-->" + list_qna.get(0).getQcontent());        // /och16/list.do
				pageCnt = (int)Math.ceil((double)totCnt/pageSize);
				startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
				endPage = startPage + blockSize -1;	
				if (endPage > pageCnt) endPage = pageCnt;	
				
				request.setAttribute("list",  list_qna);
				
				request.setAttribute("sid", request.getParameter("sid"));
				request.setAttribute("qid", request.getParameter("qid"));
				request.setAttribute("sname", request.getParameter("sname"));
				request.setAttribute("qdate", request.getParameter("qdate"));
				request.setAttribute("qctg", request.getParameter("qctg"));
				request.setAttribute("qcontent", request.getParameter("qcontent"));
				request.setAttribute("qcmt", request.getParameter("qcmt"));
				request.setAttribute("qcmtdate", request.getParameter("qcmtdate"));
			} catch (Exception e) {
				
			}
		}
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("type", request.getParameter("type"));
		
		request.setAttribute("totCnt",   totCnt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startNum", startNum);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		return "board.jsp";
	}

}
