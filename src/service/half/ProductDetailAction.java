package service.half;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Product;
import dao.ProductDao;

public class ProductDetailAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductDao pdao = ProductDao.getInstance();
		Product prdt = new Product();

		try {

			int pid = Integer.parseInt(request.getParameter("pid"));
			String cate = request.getParameter("cate");
			System.out.println("pid test" + pid);
			prdt = pdao.getDetailInfo(pid);
			request.setAttribute("pobject", prdt);

		} catch (Exception e) {
			System.out.println("productdetailaction error :" + e.getMessage());
		}

		return "ProductDetail.jsp";
	}

}
