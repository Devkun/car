package apply;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Action;
import com.board.action.ActionForward;
import com.board.action.MainAction;
import com.board.action.MemberLoginAction;

/**
 * Servlet implementation class ApplyFrontController
 */
@WebServlet("/ApplyFrontController.do")
public class ApplyFrontController extends HttpServlet {
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
		System.out.println("apply"+command);
		
		
		ActionForward forward = null;
		Action action = null;

	if (command.equals("/member/login.do")) {
			// 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/login.jsp");
			
		}else if(command.equals("/member/loginAction.do")) { //로그인버튼 클릭시 데이터 처리
			//  MemberLoginAction  
			action=new MemberLoginAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		

	// 占쎌뵠占쎈짗
			if (forward != null) {
				if (forward.isRedirect()) {// true
					response.sendRedirect(forward.getPath());
				} else {// false
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
	
	
	
	}
}