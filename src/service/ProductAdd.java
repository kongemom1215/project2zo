package service;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dao.ShoppingUserDao;

public class ProductAdd implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pname = request.getParameter("pname");
		String ptype = request.getParameter("ptype");
		int pprice = Integer.parseInt(request.getParameter("pprice"));
		int pinventory =  Integer.parseInt(request.getParameter("pinventory"));
		String poption = request.getParameter("poption");
		
		ProductDao bd = ProductDao.getInstance();
		
		int s = bd.productAdd(pname, ptype, pprice, pinventory, poption);
		
		if (s == 0) {
			
		} else if ( s >= 1 ) {
			
		}
		
		return "pproductAdd.jsp";
	}

}
