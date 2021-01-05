package service.god;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.god.ShoppingUser;
import dao.god.ShoppingUserDao;
import service.CommandProcess;

public class MemberInfoAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int sid=Integer.parseInt(request.getParameter("sid"));
			String pageNum=request.getParameter("pageNum");
			
			ShoppingUserDao sd=ShoppingUserDao.getInstance();
			ShoppingUser shoppinguser=new ShoppingUser();
			shoppinguser=sd.select(sid);
			
			request.setAttribute("sid", sid);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("shoppinguser", shoppinguser);
		} catch (Exception e) {
			System.out.println("MemberEditAction -> "+e.getMessage());
		}
		
		return "memberInfo.jsp";
	}

}
