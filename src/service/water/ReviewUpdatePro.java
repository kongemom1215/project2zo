package service.water;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.water.Review;
import dao.water.ReviewDao;
import service.CommandProcess;


public class ReviewUpdatePro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("ReviewUpdatePro start...");
			request.setCharacterEncoding("utf-8");
			 String pageNum = request.getParameter("pageNum");
			 Review review = new Review();
			 
			 review.setSid(Integer.parseInt(request.getParameter("sid")));
			 review.setRtitle(request.getParameter("rtitle"));
			 review.setRcontent(request.getParameter("rcontent"));
			 
			 ReviewDao rd = ReviewDao.getInstance();
			 int result = rd.update(review);
			 
			 
			 request.setAttribute("result", result);
			 request.setAttribute("sid", review.getSid());
			 request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "reviewUpdatePro.jsp";
	}

}
