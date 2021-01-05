package service.heart;

import java.io.IOException;  
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.heart.Coupon;
import dao.heart.CouponDao;
import service.CommandProcess;

public class MypageCouponAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			HttpSession session = request.getSession(true);
			
			int sid = (int) session.getAttribute("session_sid");
			
			System.out.println("sid ->"+sid);
			CouponDao cp = CouponDao.getInstance();
			Coupon coupon = new Coupon();
			coupon = cp.select(sid); 
			System.out.println("MypageCouponAction coupon.getcid->"+coupon.getCid());
			List<Coupon> listC = cp.list(sid);
			System.out.println("MypageCouponAction coupon.getCenddate->"+coupon.getCenddate());
			
			request.setAttribute("sid", sid);
			request.setAttribute("coupon", coupon);
			request.setAttribute("listC", listC);			 
		} catch (Exception e) {
			System.out.println("MypageCouponAction error=> "+e.getMessage());
		} 
		return "mypageCoupon.jsp";
	}

}
