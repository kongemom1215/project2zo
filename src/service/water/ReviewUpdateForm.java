package service.water; 

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.water.Review;
import dao.water.ReviewDao;
import service.CommandProcess;


public class ReviewUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		session.setAttribute("session_sid", session.getAttribute("session_sid"));
		session.setAttribute("session_sname", session.getAttribute("session_sname"));
		session.setAttribute("session_stype", session.getAttribute("session_stype"));
		session.setAttribute("session_semail", session.getAttribute("session_semail"));

		  int sid = (int)session.getAttribute("session_sid");
		  String pageNum=request.getParameter("pageNum");
		 
		try {
			
			ReviewDao rd = ReviewDao.getInstance();
			Review review = rd.select(sid);
			

			  request.setAttribute("sid", sid);
			  request.setAttribute("pageNum", pageNum); 
			  request.setAttribute("review", review);
			  System.out.println("ReviewUpdateForm ->"+review.getRcontent());
			 
			 
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "reviewUpdateForm.jsp";
	}

}
