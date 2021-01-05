package service.red;

import java.io.IOException; 
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.red.CartnWish;
import dao.red.CartnWishDao;
import dao.red.Order;
import dao.red.Order_tbDao;
import service.CommandProcess;

public class OrderResultAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("결제창에서 입력한 내용 주문DB에 insert");
		System.out.println("OrderResultAction Start!!");
		
		try {
			request.setCharacterEncoding("utf-8");
			//주문자정보
			String buyerName= request.getParameter("buyerName");
			int buyerPost= Integer.parseInt(request.getParameter("buyerPost"));
			String buyerAddress= request.getParameter("buyerAddress");
			String buyerTel= request.getParameter("buyerTel");
			String buyerEmail =(String)request.getSession().getAttribute("useremail");
			int sid = (int) request.getSession().getAttribute("sid");
			//신용카드정보
			String credit = request.getParameter("credit_chk");
			int creditNum = Integer.parseInt(request.getParameter("creditNum"));
			String creditPass = request.getParameter("creditPass");	
			int sum=Integer.parseInt(request.getParameter("sum"));
			//무통장입금
			String bank = request.getParameter("bank");
			int backNum = Integer.parseInt(request.getParameter("backNum"));
			
			int sumPost =0;
			if(sum>3000) {
				sumPost = 0;
			}else {
				sumPost = 3000;
			}
			
			
			Order_tbDao orderTb = Order_tbDao.getInstance();
			Order order = new Order();
			//주문자정보
			order.setSid(sid);
			//쿠폰일련번호 받아오기
			order.setCid(1);
			order.setOname(buyerName);
			order.setOpost(buyerPost);
			order.setOaddress(buyerAddress);
			order.setOcontact(buyerTel);
			order.setOamount(sum);//주문총액
			order.setOdeliverey(sumPost);//택배비
			if(credit != null) {
				order.setOpay(2);
				order.setOstate(2);
			}else {
				order.setOpay(1);
				order.setOstate(1);
			}
			
			//주문상품정보
			CartnWishDao cartw = CartnWishDao.getInstance();
			ArrayList<CartnWish>list = cartw.select(sid);
			//Order DB에 넣기
			int result = orderTb.insert(order);
			//orderDetail... pid 어떻게 넣지..??
			
			
		}catch(Exception e) {
			System.out.println("OrderResultAction error!!"+e.getMessage());
		}
		
		return "orderResult.jsp";
	}

}
