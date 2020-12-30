package service;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ShoppingUser;
import dao.ShoppingUserDao;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String semail = request.getParameter("semail");
		String spwd = request.getParameter("spwd");
		
		HttpSession session = request.getSession();
		session.setAttribute("seesion_semail", semail);
		session.setAttribute("seesion_spwd", spwd);
		
		ShoppingUserDao bd = ShoppingUserDao.getInstance();
		int login_num = 0;
		
		try {
			login_num = bd.login(semail, spwd);
			if (login_num != 3) {
				
				return "loginForm.jsp";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			request.setAttribute("login_num", login_num);
			session.setAttribute("seesion_login_num", login_num);
		}
		
		
		List<ShoppingUser> shoppingUser_semail;
		
		try {
			shoppingUser_semail = bd.shoppingUser_semail(semail);
			session.setAttribute("session_shoppingUser_semail", shoppingUser_semail);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "main.jsp";

	}

}
