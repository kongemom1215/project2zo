package service.dragon;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.dragon.Search;
import dao.dragon.SearchDao;
import service.CommandProcess;

public class SearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		session.setAttribute("session_sid", session.getAttribute("session_sid"));
		session.setAttribute("session_sname", session.getAttribute("session_sname"));
		session.setAttribute("session_stype", session.getAttribute("session_stype"));
		session.setAttribute("session_semail", session.getAttribute("session_semail"));
		
		String search_text = request.getParameter("search_text");
		SearchDao searchdao = SearchDao.getInstance();
		
		String shopping_select = request.getParameter("shopping_select");
		request.setAttribute("shopping_select", shopping_select);
		try {
		if (shopping_select.equals("sell_hit")) {
			request.setAttribute("selected1", "selected");
		} else if (shopping_select.equals("pregdate")) {
			request.setAttribute("selected2", "selected");
		} else if (shopping_select.equals("price_high")) {
			request.setAttribute("selected3", "selected");
		} else if (shopping_select.equals("price_low")) {
			request.setAttribute("selected4", "selected");
		} else {
		}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("select box : " + shopping_select);
		
		List<Search> main_img = new ArrayList<Search>();
		main_img = searchdao.compare(search_text, shopping_select);
		
		request.setAttribute("search_text", search_text);
		request.setAttribute("main_img", main_img);
		System.out.println(request.getParameter("page"));
		request.setAttribute("page", request.getParameter("page"));
		
		int select_page = 0;
		try {
		select_page = Integer.parseInt(request.getParameter("page"))-1;
		System.out.println(select_page);
		} catch (Exception e) {
		select_page = 0;
		}
		request.setAttribute("select_page", select_page);
		
		int page_full_num = main_img.size();
		request.setAttribute("page_full_num", page_full_num);
		
		double page_num = (double)page_full_num/16;
		
		if (page_num <= 0) {
			page_num = 0;
		} else if (page_num >0) {
			page_num = Math.ceil(page_num);
		}
		
		request.setAttribute("page_num", page_num);
		
		return "search.jsp";
	}

}
