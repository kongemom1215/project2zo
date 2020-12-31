package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ShoppingUser;
import dao.ShoppingUserDao;

public class MemberAdminPageAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null || pageNum.equals(""))
				pageNum="1";
			int currentPage = Integer.parseInt(pageNum);
			int pageSize=10; //한페이지당 보일 게시글 수
			int blockSize=10; //페이지수
			int startRow=(currentPage-1)*pageSize+1; //시작 번호
			int endRow=startRow+pageSize-1; //끝 번호
			
			ShoppingUserDao sd=ShoppingUserDao.getInstance();
			int totalUser=sd.getTotalUser(); //회원 수
			List<ShoppingUser> userlist=sd.list(startRow, endRow);
			System.out.println(userlist.get(1).getSid());
			int pageCnt=(int)Math.ceil((double)totalUser/pageSize);
			int startPage=(int)(currentPage-1)/blockSize*blockSize+1;
			int endPage=startPage+blockSize-1;
			if(endPage>pageCnt)
				endPage=pageCnt;
			
			request.setAttribute("pageNum", pageNum); //현 페이지 번호
			request.setAttribute("currentPage", currentPage); //현 페이지 번호
			request.setAttribute("totalUser", totalUser); //회원 수
			request.setAttribute("userlist", userlist); //유저목록
			request.setAttribute("blockSize", blockSize); //페이지제한수
			request.setAttribute("pageCnt", pageCnt); //페이지개수
			request.setAttribute("startPage", startPage); //시작 페이지
			request.setAttribute("endPage", endPage); //끝페이지
		}catch (Exception e) {
			System.out.println("memberAdmin -> "+e.getMessage());
		}
		return "memberAdminPage.jsp";
	}

}
