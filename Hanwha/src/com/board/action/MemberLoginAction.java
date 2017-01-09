package com.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.action.ActionForward;

import member.db.MemberDAO;


public class MemberLoginAction implements Action { //로그인처리

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginAction execute()");
		
		String id=request.getParameter("username");
		String pass=request.getParameter("password");
		int check = -1;
		
		MemberDAO mdao = new MemberDAO();
		check = mdao.userCheck(id, pass);
		
		if(check==0){//비밀번호 틀린경우 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 확인하세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}else if(check==-1){// 아이디가 틀린경우
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('아이디를 확인하세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		//아이디, 비밀번호 맞는경우
		HttpSession session=request.getSession();
		session.setAttribute("id", id);// 세션영역에 담기
		
	/*	if(id.equals("hyebin1902") && pass.equals("hyebin1902")) {
			session.setAttribute("id", id);
		}*/
		
		//  占쎌뵠占쎈짗  ./Main.me
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/Hanwha_0106view/index.do");
		return forward;
	}

}
