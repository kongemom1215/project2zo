package service.water;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class ReviewWriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {

            
		} catch (Exception e) {
			
		}
		return "reviewWriteForm.jsp";
	}

}
