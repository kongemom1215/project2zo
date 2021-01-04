package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartnWish;
import dao.CartnWishDao;

public class CartAddAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CartAddAction Start!!!");
		System.out.println("장바구니에 넣기 버튼을 누르면 장바구니DB로 insert");
		
		try {
			
			HttpSession session = request.getSession(true);
			
			int pid = Integer.parseInt(request.getParameter("pid"));
			String option = request.getParameter("option");
			int number = Integer.parseInt(request.getParameter("howmany"));
			// 반야의 howmany를 홍주의 number로 바꿈 
			
			System.out.println("cart pid check ->" + pid );
			System.out.println("cart howmany(number) check ->" + number );
			System.out.println("cart option->" + option );

			
			//세션으로 로그인한 회원의 이메일과 회원번호
			String useremail = (String) session.getAttribute("session_semail");
			int sid = (int) session.getAttribute("session_sid");
		//	String useremail=(String)request.getSession().getAttribute("useremail");
		//	int sid=(int)request.getSession().getAttribute("sid");
			//라디오버튼으로 선택된 상품번호와 수량
			
			//상품개수 선택 가져오는건 고민
			//int number = Integer.parseInt(request.getParameter("number"));
			
			CartnWishDao cartw = CartnWishDao.getInstance();
			CartnWish cart = new CartnWish();
			//로그인한 회원의 자기 장바구니에 넣기
			//ArrayList<CartnWish> list= cartw.select(sid);
			int result=result  = cartw.insert(pid,sid,number);
					
			
			
			System.out.println("useremail=>"+useremail);
			System.out.println("sid=>"+sid);
			System.out.println("pid=>"+pid);
			
			System.out.println("cartAddAction의 result=>"+result);
			
			System.out.println("pid=>"+pid);
			
			
	
			request.setAttribute("result", result);
			request.setAttribute("pid", pid);
			
			//request.getSession().setAttribute("list",list );
			
			
			
		}catch(Exception e) {
			System.out.println("CartAddAction 에러!!=>"+e.getMessage());
			
		
		}
		
		return "cartAddResult.jsp";
	}

}
