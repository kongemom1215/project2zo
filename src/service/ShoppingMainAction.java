package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Product;
import dao.ProductDao;

public class ShoppingMainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ProductDao pd = ProductDao.getInstance();
		ProductDao pd2 = ProductDao.getInstance();
		
		try {
			List<Product> bestproducts = pd.bestproducts();
			request.setAttribute("BESTPRODUCTS", bestproducts);	
			
			List<Product> defaultproducts = pd2.defaultdisplay();
			request.setAttribute("DPRODUCTS", defaultproducts);
		} catch (Exception e) {
			
		}
		return "ShoppingMain.jsp";
	}

}
