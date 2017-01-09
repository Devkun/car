package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberDAO;
import member.db.MemberDTO;

public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("MemberJoinAction execute()");

		
		String mem_name = request.getParameter("nm");//이름
		String mem_id = request.getParameter("id");//id
		String mem_pass = request.getParameter("pwd");//비밀번호
		int mem_phone =Integer.parseInt(request.getParameter("cph"));//핸드폰번호
		String mem_email = request.getParameter("email");//메일
		String year = request.getParameter("brtd.year");//생년
		String month = request.getParameter("brtd.month");//생월
		String day = request.getParameter("brtd.day");//생일
		String sex = request.getParameter("sex");//성별
		int mem_fore = Integer.parseInt(request.getParameter("tp"));//국적
		
		
		System.out.println(mem_name);
		System.out.println(mem_id);
		System.out.println(mem_pass);
		System.out.println(mem_phone);
		System.out.println(mem_email);
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		System.out.println(sex);
		System.out.println(mem_fore);
		
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_name(mem_name);
		mdto.setMem_id(mem_id);
		mdto.setMem_pass(mem_pass);
		mdto.setMem_phone(mem_phone);
		mdto.setMem_email(mem_email);
		mdto.setMem_fore(mem_fore);

		MemberDAO mdao = new MemberDAO();
		
		mdao.insertMember(mdto); //회원가입!
		
		request.setAttribute("nm", mem_name);
		request.setAttribute("id", mem_id);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./step4.jsp");
		return forward;
	}

}
