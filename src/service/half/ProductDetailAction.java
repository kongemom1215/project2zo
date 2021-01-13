package service.half;

import java.awt.im.InputMethodRequests;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.half.Product;
import dao.half.ProductDao;
import dao.half.Qna;
import dao.half.QnaDao;
import dao.half.Review;
import dao.half.ReviewDao;
import service.CommandProcess;

public class ProductDetailAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductDao pdao = ProductDao.getInstance();
		Product prdt = new Product();

		try {
			// 보고 싶은 제품의 제품번호 읽어옴
			int pid = Integer.parseInt(request.getParameter("pid"));
			System.out.println("pid test" + pid);
			request.setAttribute("pid", pid);

			// 제품번호로 제품 정보 읽어서 객체에 담음
			prdt = pdao.getDetailInfo(pid);
			request.setAttribute("pobject", prdt);

			// 보려는 제품의 카테고리 읽어옴
			String cate = prdt.getPtype();
			System.out.println("cate: " + cate);

			// 같은 카테고리에 있는 제품 중 판매가 많은 4개 제품을 읽어옴
			List<Product> best4products = pdao.getbest4products(cate);
			request.setAttribute("BEST4PRODUCTS", best4products);
			System.out.println("BEST4 :" + best4products.size());

			// 보고 싶은 제품 관련 문의글을 읽어옴

			QnaDao qd = QnaDao.getInstance();
			try {
				String qpageNum = request.getParameter("qpageNum");
				if (qpageNum == null || qpageNum.equals("")) {
					qpageNum = "1";
				}
				int qcurrentPage = Integer.parseInt(qpageNum);
				int qpageSize = 5, qblockSize = 5;
				int qstartRow = (qcurrentPage - 1) * qpageSize + 1;
				int qendRow = qstartRow + qpageSize - 1;

				int qtotCnt = qd.getTotalCnt(pid);
				int qstartNum = qtotCnt - qstartRow + 1;
				List<Qna> qlist = qd.qlist(qstartRow, qendRow, pid);

				int qpageCnt = (int) Math.ceil((double) qtotCnt / qpageSize);
				int qstartPage = (int) (qcurrentPage - 1) / qblockSize * qblockSize + 1;
				int qendPage = qstartPage + qblockSize - 1;
				if (qendPage > qpageCnt)
					qendPage = qpageCnt;

				request.setAttribute("qlist", qlist);
				request.setAttribute("qtotCnt", qtotCnt);
				request.setAttribute("qpageNum", qpageNum);
				request.setAttribute("qcurrentPage", qcurrentPage);
				request.setAttribute("qstartNum", qstartNum);
				request.setAttribute("qblockSize", qblockSize);
				request.setAttribute("qpageCnt", qpageCnt);
				request.setAttribute("qstartPage", qstartPage);
				request.setAttribute("qendPage", qendPage);

				System.out.println("qstartNum-->" + qstartNum); // /och16/list.do
				System.out.println("qtotCnt-->" + qtotCnt); // /och16/list.do
				System.out.println("qcurrentPage-->" + qcurrentPage); // /och16/list.do
				System.out.println("qblockSize-->" + qblockSize); // /och16/list.do
				System.out.println("qpageSize-->" + qpageSize); // /och16/list.do
				System.out.println("qpageCnt-->" + qpageCnt); // /och16/list.do
				System.out.println("qstartPage-->" + qstartPage); // /och16/list.do
				System.out.println("qendPage-->" + qendPage); // /och16/list.do

			} catch (Exception e) {
				System.out.println("QnaDao 에러 발생 : " + e.getMessage());
			}

			// 보고 싶은 제품 관련 리뷰을 읽어옴

			ReviewDao rd = ReviewDao.getInstance();
			try {
				String rpageNum = request.getParameter("rpageNum");
				if (rpageNum == null || rpageNum.equals("")) {
					rpageNum = "1";
				}
				int rcurrentPage = Integer.parseInt(rpageNum);
				int rpageSize = 5, rblockSize = 5;
				int rstartRow = (rcurrentPage - 1) * rpageSize + 1;
				int rendRow = rstartRow + rpageSize - 1;

				int rtotCnt = rd.getTotalCnt(pid);
				int rstartNum = rtotCnt - rstartRow + 1;
				List<Review> rlist = rd.rlist(rstartRow, rendRow, pid);

				int rpageCnt = (int) Math.ceil((double) rtotCnt / rpageSize);
				int rstartPage = (int) (rcurrentPage - 1) / rblockSize * rblockSize + 1;
				int rendPage = rstartPage + rblockSize - 1;
				if (rendPage > rpageCnt)
					rendPage = rpageCnt;

				request.setAttribute("rlist", rlist);
				request.setAttribute("rtotCnt", rtotCnt);
				request.setAttribute("rpageNum", rpageNum);
				request.setAttribute("rcurrentPage", rcurrentPage);
				request.setAttribute("rstartNum", rstartNum);
				request.setAttribute("rblockSize", rblockSize);
				request.setAttribute("rpageCnt", rpageCnt);
				request.setAttribute("rstartPage", rstartPage);
				request.setAttribute("rendPage", rendPage);

			} catch (Exception e) {
				System.out.println("ReviewDao 에러 발생 : " + e.getMessage());
			}

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

			try {

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
				System.out.println("리모콘 옵션 에러 처리 : " + e.getMessage());
			}

		} catch (Exception e) {
			System.out.println("productdetailaction error :" + e.getMessage());
		}

		return "ProductDetail.jsp";
	}
}