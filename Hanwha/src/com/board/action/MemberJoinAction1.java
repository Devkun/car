package com.board.action;

import javax.servlet.http.*;

public class MemberJoinAction1 implements Action { //

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoinAction execute()");

		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./step1.jsp");
		return forward;
	}

}
