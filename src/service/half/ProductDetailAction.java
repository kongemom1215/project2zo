package service.half;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.half.Product;
import dao.half.ProductDao;
import service.CommandProcess;

public class ProductDetailAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductDao pdao = ProductDao.getInstance();
		Product prdt = new Product();

		try {

			int pid = Integer.parseInt(request.getParameter("pid"));
			System.out.println("pid test" + pid);

			prdt = pdao.getDetailInfo(pid);
			request.setAttribute("pobject", prdt);
			String cate = prdt.getPtype();
			System.out.println("cate: "+cate);

			List<Product> best4products = pdao.getbest4products(cate);
			request.setAttribute("BEST4PRODUCTS", best4products);
			System.out.println("BEST4 :" + best4products.size());

			HttpSession session = request.getSession(true);
			String new_session_pid = (String) session.getAttribute("new_session_pid");
			new_session_pid = pid + "," + new_session_pid;
			System.out.println("클릭했던 제품 번호(최신순): " + new_session_pid);
			String[] parray = new_session_pid.split(",");
			session.setAttribute("new_session_pid", new_session_pid);

			ArrayList<String> parraylist = new ArrayList<>();
			for (String pidlist : parray) {
				if (!parraylist.contains(pidlist))
					parraylist.add(pidlist);
			}

			System.out.println(parraylist.get(0));
			System.out.println(parraylist.get(1));
			System.out.println(parraylist.get(2));

			Product nprdt = new Product();
			nprdt = pdao.getDetailInfo(Integer.parseInt(parraylist.get(0)));

			Product oprdt = new Product();
			oprdt = pdao.getDetailInfo(Integer.parseInt(parraylist.get(1)));

			Product pprdt = new Product();
			pprdt = pdao.getDetailInfo(Integer.parseInt(parraylist.get(2)));

			System.out.println("remotelength: " + parraylist.size());
			session.setAttribute("remotelength", parraylist.size());
			session.setAttribute("nprdt", nprdt);
			session.setAttribute("oprdt", oprdt);
			session.setAttribute("pprdt", pprdt);

			String poptionsdata = prdt.getPoption();
			String[] poptions = poptionsdata.split(",");
			System.out.println("poptions수: " + poptions.length);
			request.setAttribute("poptions", poptions);

		} catch (Exception e) {
			System.out.println("productdetailaction error :" + e.getMessage());
		}

		return "ProductDetail.jsp";
	}

}