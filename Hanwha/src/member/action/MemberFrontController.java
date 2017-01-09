package member.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Action;
import com.board.action.ActionForward;
import com.board.action.MainAction;

/**
 * Servlet implementation class MemberFrontController
 */
@WebServlet("/MemberFrontController.do")
public class MemberFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	
	
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		System.out.println(RequestURI);

		// /Hanwha 
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		//System.out.println(contextPath.length());

		//  /index.do
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		
		
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/member/login.do")) {
			// 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/login.jsp");
		} 			
		
	}

}
