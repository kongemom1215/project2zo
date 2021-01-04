package service.red;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartnWishDao;
import oracle.net.aso.s;

import service.CommandProcess;

public class CartDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CartDeletAction Start!!");
		
		try {
			//전체삭제
			
			HttpSession session = request.getSession(true);
			String useremail = (String) session.getAttribute("session_semail");
			int sid = (int) session.getAttribute("session_sid");
			
			CartnWishDao cartw=CartnWishDao.getInstance();
			int result=cartw.delete(sid);
			
			request.setAttribute("result", result);
			
		}catch(Exception e) {
			System.out.println("CartDeletAction error!!!"+e.getMessage());
		}
		
		
		return "cartDelResult.jsp";
	}

}
