package service.dragon;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class BoardAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String type = request.getParameter("type");
		BoardDao boarddao = BoardDao.getInstance();
		List<Board> list = new ArrayList<Board>();
		
		try {
		if (request.getParameter("nid") != null) {
			boarddao.notice_nhit(Integer.parseInt(request.getParameter("nid")));
			request.setAttribute("nid", request.getParameter("nid"));
			request.setAttribute("ntitle", request.getParameter("ntitle"));
			request.setAttribute("ncontent", request.getParameter("ncontent"));
			request.setAttribute("npublic", request.getParameter("npublic"));
			request.setAttribute("ndate", request.getParameter("ndate"));
			request.setAttribute("nfile", request.getParameter("nfile"));
			request.setAttribute("nhit", request.getParameter("nhit"));
		}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		try {
		if (type.equals("notice")) {
			list = boarddao.notice_list();
		} else if (type.equals("review")) {
			
		} else if (type.equals("qna")) {
			list = boarddao.qna_list();
		}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		int select_page = 0;
		try {
		select_page = Integer.parseInt(request.getParameter("page"))-1;
		} catch (Exception e) {
		select_page = 0;
		}
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("select_page", select_page);
		
		int page_full_num = list.size();
		
		double page_num = (double)page_full_num/20;
		
		if (page_num <= 0) {
			page_num = 0;
		} else if (page_num >0) {
			page_num = Math.ceil(page_num);
		}
		
		request.setAttribute("page_num", page_num);
		request.setAttribute("type", type);
		request.setAttribute("list", list);
		return "board.jsp";
	}

}
