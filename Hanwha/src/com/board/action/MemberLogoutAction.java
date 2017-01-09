package com.board.action;

import java.io.*;

import javax.servlet.http.*;

public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLogoutAction execute()");
		//세션값 초기화
		HttpSession session=request.getSession();
		session.invalidate();
		//이동 ./Main.me
//		ActionForward forward=new ActionForward();
//		forward.setRedirect(true);
//		forward.setPath("./Main.bo");
//		return forward;
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃');");
		out.println("location.href='/Hanwha_0106view/index.do'");
		out.println("</script>");
		out.close();
		return null;
	}

}
