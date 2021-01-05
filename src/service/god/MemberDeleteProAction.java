package service.god;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.god.ShoppingUserDao;
import service.CommandProcess;

public class MemberDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int sid=Integer.parseInt(request.getParameter("sid"));
			
			ShoppingUserDao sd=ShoppingUserDao.getInstance();
			int result=sd.deleteUser(sid);
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println("MemberDeleteProAction -> "+e.getMessage());
		}
		return "memberDeletePro.jsp";
	}

}
