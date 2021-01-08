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
			//response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("utf-8");
			//주문자정보
			String buyerName= request.getParameter("buyerName");
			int buyerPost= Integer.parseInt(request.getParameter("buyerPost"));
			String buyerAddress= request.getParameter("buyerAddress");
			String buyerTel= request.getParameter("buyerTel");
			String buyerEmail =(String)request.getSession().getAttribute("session_semail");
			int session_sid = (int) request.getSession().getAttribute("session_sid");
			//신용카드정보
			String credit = request.getParameter("credit_chk");
			String creditNum = request.getParameter("creditNum");
			String creditPass =request.getParameter("creditPass");	

			//은행
			String bank = request.getParameter("bank"); 
			String backNum = request.getParameter("backNum");

			int sum=Integer.parseInt(request.getParameter("sum"));
			 			
			int sumPost =0;
			if(sum>3000) {
				sumPost = 0;
			}else {
				sumPost = 3000;
			}
			
			
			Order_tbDao orderTb = Order_tbDao.getInstance();
			Order order = new Order();
			//주문자정보
			order.setSid(session_sid);
			//쿠폰일련번호 받아오기
			order.setCid(1);
			order.setOname(buyerName);
			order.setOpost(buyerPost);
			order.setOaddress(buyerAddress);
			order.setOcontact(buyerTel);
			order.setOamount(sum);//주문총액
			order.setOdeliverey(sumPost);//택배비
			if(backNum == null || bank.equals("")) {
				order.setOpay(2);
				order.setOstate(2);
			}else if(credit.equals("") || creditNum != null || creditPass != null  ) {
				order.setOpay(1);
				order.setOstate(1);
			}
			
			//주문상품정보
			CartnWishDao cartw = CartnWishDao.getInstance();
			ArrayList<CartnWish>list = cartw.select(session_sid);
			//Order DB에 넣기
			int result = orderTb.insert(order);
			//넣은 주문의 주문번호와 주문일시 가져옴
			Order order_selct = orderTb.select(session_sid);
			//orderDetail... pid 어떻게 넣지..??
			
			//주문성공 후 장바구니에 담긴 물건 지우기
			int del = cartw.delete(session_sid);
			
			
			
			
			
			request.setAttribute("list", list);
			request.setAttribute("result",result );
			request.setAttribute("order_selct",order_selct );
			request.setAttribute("sum", sum);
			request.setAttribute("del", del);
			
			System.out.println("-----------------");
			System.out.println("list=>"+list);
			System.out.println("result=>"+result);
			System.out.println("order_selct=>"+order_selct);
			System.out.println("sum=>"+sum);
			System.out.println("del=>"+del);
			
			
			
			
		}catch(Exception e) {
			System.out.println("OrderResultAction error!!"+e.getMessage());
		}
		
		return "orderResult.jsp";
	}

}
