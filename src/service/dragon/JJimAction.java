package service.dragon;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.dragon.ProductDao;
import service.CommandProcess;

public class JJimAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		System.out.println("씨발");
		
		int sid = (int) session.getAttribute("session_sid");
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		ProductDao productdao = ProductDao.getInstance();
		
		try {
			int same = productdao.jjim(sid, pid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String before_address = request.getHeader("referer");
		System.out.println(before_address);
		
		return "productDetail.do?pid="+pid;
	}

}
