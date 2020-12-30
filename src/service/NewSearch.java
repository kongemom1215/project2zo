package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Search;
import dao.SearchDao;

public class NewSearch implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String search_text = request.getParameter("search_text");
		SearchDao searchdao = SearchDao.getInstance();
		
		String shopping_select = request.getParameter("shopping_select");
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
		
		List<Search> al = new ArrayList<Search>();
		al = searchdao.compare(search_text, shopping_select);
		
		request.setAttribute("search_text", search_text);
		request.setAttribute("al", al);
		
		int select_page = 0;
		try {
		select_page = Integer.parseInt(request.getParameter("page"))-1;
		System.out.println(select_page);
		} catch (Exception e) {
		select_page = 0;
		}
		request.setAttribute("select_page", select_page);
		
		int page_full_num = al.size();
		request.setAttribute("page_full_num", page_full_num);
		
		int page_num = page_full_num/12 - 1;
		
		if (page_num <= 0) {
			page_num = 0;
		} else if (page_num >=1) {
			Math.floor((double)page_num);
		}
		
		request.setAttribute("page_num", page_num);
		
		return "newsearch.jsp";
	}

}
