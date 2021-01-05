package service.god;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.god.Product;
import dao.god.ProductDao;
import service.CommandProcess;

public class ProductEditProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum=request.getParameter("pageNum");
			System.out.println("pageNum ->"+pageNum);
			int pid=Integer.parseInt(request.getParameter("pid"));
			System.out.println("pid -> "+pid);
			Product product=new Product();
			product.setPid(pid);
			product.setPname(request.getParameter("pname"));
			product.setPtype(request.getParameter("ptype"));
			product.setPprice(Integer.parseInt(request.getParameter("pprice")));
			product.setPinventory(Integer.parseInt(request.getParameter("pinventory")));
			product.setPdiscount(Integer.parseInt(request.getParameter("pdiscount")));
			product.setPpublic(Integer.parseInt(request.getParameter("ppublic")));
			
			ProductDao pd=ProductDao.getInstance();
			int result=pd.updateProduct(product);
			System.out.println("result -> "+result);
			request.setAttribute("result", result);
			request.setAttribute("pid", pid);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println("ProductEditProAction -> "+e.getMessage());
		}
		return "productEditPro.jsp";
	}

}
