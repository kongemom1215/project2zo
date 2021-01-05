package service.red;

import java.io.IOException; 
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.red.CartnWish;
import dao.red.CartnWishDao;
import dao.red.Coupon;
import dao.red.CouponDao;
import dao.red.ShoppingUser;
import dao.red.ShoppingUserDao;

import service.CommandProcess;

public class OrderAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("OrderAction Start !!");
		System.out.println("장바구니->주문하기 클릭시 발생Action");
		try {
			
			String useremail=(String)request.getSession().getAttribute("useremail");
			int sid=(int)request.getSession().getAttribute("sid");
			int sum=Integer.parseInt(request.getParameter("sum"));

			//회원정보 가져오기
			ShoppingUserDao userDao= ShoppingUserDao.getInstance();
			ShoppingUser user=userDao.select(sid);
			
			//장바구니 가져오기
			CartnWishDao cartw=CartnWishDao.getInstance();
			ArrayList<CartnWish> list = cartw.select(sid);
			//장바구니에 담긴 상품 개수
			int count=cartw.count(sid);
			//쿠폰불러오기
			CouponDao cuDao = CouponDao.getInstance();
			Coupon cu=cuDao.select(sid);
			//List<Coupon> coupon = cuDao.list(sid);		
			
			request.setAttribute("user", user);
			request.setAttribute("list", list);
			request.setAttribute("sum", sum);
			request.setAttribute("count", count);
			request.setAttribute("cu", cu);
			//request.setAttribute("coupon", coupon);
			
			System.out.println("user=>"+user);
			System.out.println("list=>"+list);
			System.out.println("sum=>"+sum);
			System.out.println("count=>"+count);
			System.out.println("cu=>"+cu);
			//System.out.println("coupon=>"+coupon);
			
		}catch(Exception e) {
			System.out.println("OrderAction error=>"+e.getMessage());
		}
		
		return "order.jsp";
	}

}
