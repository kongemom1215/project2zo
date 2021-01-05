package service.red;

import java.io.IOException; 
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.red.CartnWish;
import dao.red.CartnWishDao;
import service.CommandProcess;

public class CartAddAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CartAddAction Start!!!");
		System.out.println("장바구니에 넣기 버튼을 누르면 장바구니DB로 insert");
		
		try {
			
			int pid = Integer.parseInt(request.getParameter("pid"));
			//선택한 옵션값 받기
			String option = request.getParameter("option");
			//선택한 수량값 받기==>반야의 howmany를 홍주의 number로 바꿈 
			//int number = Integer.parseInt(request.getParameter("howmany"));
			int number=1; 
			
			System.out.println("cart pid check ->" + pid );
			System.out.println("cart howmany(number) check ->" + number );
			System.out.println("cart option->" + option );

			HttpSession session = request.getSession(true);
			session.setAttribute("session_sid", session.getAttribute("session_sid"));
			session.setAttribute("session_sname", session.getAttribute("session_sname"));
			session.setAttribute("session_stype", session.getAttribute("session_stype"));
			session.setAttribute("session_semail", session.getAttribute("session_semail"));
			//세션 로그인 유지
			
			//세션으로 로그인한 회원의 이메일과 회원번호
			String useremail = (String) session.getAttribute("session_semail");
			int sid = (int) session.getAttribute("session_sid");
			
			CartnWishDao cartw = CartnWishDao.getInstance();
			CartnWish cart = new CartnWish();
			//로그인한 회원의 자기 장바구니에 넣기
			int result=result  = cartw.insert(pid,sid,number,option);
					
			System.out.println("--------CartAddAction 파라미터 확인--------------");
			System.out.println("cart pid check ->" + pid );
			System.out.println("cart howmany(number) check ->" + number );
			System.out.println("cart option->" + option );
			System.out.println("useremail=>"+useremail);
			System.out.println("sid=>"+sid);
			System.out.println("pid=>"+pid);
			System.out.println("cartAddAction의 result=>"+result);
			System.out.println("pid=>"+pid);
			//값 보내기
			request.setAttribute("result", result);
			request.setAttribute("pid", pid);
			
			
		}catch(Exception e) {
			System.out.println("CartAddAction 에러!!=>"+e.getMessage());
			
		
		}
		
		return "cartAddResult.jsp";
	}

}
