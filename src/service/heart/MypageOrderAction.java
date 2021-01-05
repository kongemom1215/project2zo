package service.heart;

import java.io.IOException; 
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.heart.Order_Join;

import dao.heart.Order_tbDao;
import service.CommandProcess;

public class MypageOrderAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	try {
			
		HttpSession session = request.getSession(true);
		
		int sid = (int) session.getAttribute("session_sid");
		
			System.out.println("sid ->"+sid);
			Order_tbDao oddao = Order_tbDao.getInstance();
			Order_Join orderjoin = new Order_Join();
			
			orderjoin = oddao.select(sid);
			List<Order_Join> list = oddao.list(sid);
			
			
			request.setAttribute("sid", sid);
			request.setAttribute("orderjoin", orderjoin);
			request.setAttribute("list", list);		 

		} catch (Exception e) {
			System.out.println("MypageOrderAction error=> "+e.getMessage());
		} 
		
		return "mypageOrder.jsp";
	}

}
