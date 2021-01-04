package service.water;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ShoppingUser;
import dao.ShoppingUserDao;

public class FindEmailProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			ShoppingUser shoppinguser=new ShoppingUser();
			String sname=request.getParameter("sname");
			System.out.println("FindEmailProAction Start...");
			
			
			if(request.getParameter("sname") != null) {
			ShoppingUserDao sd=ShoppingUserDao.getInstance();
			shoppinguser=sd.findem(sname);
			
			
			
			}


			request.setAttribute("result", shoppinguser.getSemail());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "findEmailPro.jsp";
	}
}
