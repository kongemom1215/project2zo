package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartnWish;
import dao.CartnWishDao;

public class CartAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("cart TB 불러오기");
		System.out.println("CartAction Start!!");
		
		try {
			
			HttpSession session = request.getSession(true);
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			//세션 로그인 유지
			//세션으로 로그인한 회원의 이메일과 회원번호
			String useremail = (String) session.getAttribute("session_semail");
			int sid = (int) session.getAttribute("session_sid");
			
			//pid는 어떻게 가져오지.??
			
			//int pid=Integer.parseInt(request.getParameter("pid"));
			//int pprice = Integer.parseInt(request.getParameter("pprice"));
			//int number = Integer.parseInt(request.getParameter("number"));
			int number=1;
			
			CartnWishDao cartw= CartnWishDao.getInstance();
			CartnWish cart = new CartnWish();
			//장바구니에 담긴 상품에 대한 정보
			
		
			ArrayList<CartnWish> list = cartw.select(sid);
			//장바구니에 담긴 상품 갯수
			

			int count = cartw.count(sid);		
			/*
			 *  int pprice = cartw.price(pid);
			 * 
			 * int result=0; // 장바구니에 담긴 상품 전체 총액 for(int i=0;i<=count;i++) { int amount =
			 * pprice*number; result=+amount; } //배송비까지 더한 총액 int sum=0; if(result > 30000){
			 * sum=result+2500; }else { sum=result+0; }
			 * 
			 */			
			
			request.setAttribute("list",list); //장바구니에 담긴 상품들 정보
			request.setAttribute("count",count);//장바구니에 담긴 상품 개수
			
			/*
			 * request.setAttribute("result",result);//총상품금액
			 * request.setAttribute("sum",sum);//배송비까지
			 * 
			 */						
			System.out.println("list 배열 =>"+list);
			
			/*
			 * System.out.println("result =>"+result); System.out.println("sum =>"+sum);
			 * System.out.println("count =>"+count);
			 */			 			
		}catch(Exception e) {
			System.out.println("CartAction Error !! "+e.getMessage());
		}
		return "cart.jsp";
	}

}
