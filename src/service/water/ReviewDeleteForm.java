package service.water;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.water.Review;
import dao.water.ReviewDao;
import service.CommandProcess;


public class ReviewDeleteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int sid = Integer.parseInt(request.getParameter("sid"));
			String pageNum = request.getParameter("pageNum");
			
			ReviewDao rd = ReviewDao.getInstance();
			Review review = rd.select(sid);
			request.setAttribute("sid", sid);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("review", review);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "reviewDeleteForm.jsp";
	}
}
