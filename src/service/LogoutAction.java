package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("seesion_semail"); 
		session.removeAttribute("seesion_spwd"); 
		session.removeAttribute("seesion_login_num"); 
		session.removeAttribute("session_shoppingUser_semail"); 

		return "main.jsp";
	}

}
