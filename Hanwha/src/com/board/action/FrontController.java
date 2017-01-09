package com.board.action;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Action;
import com.board.action.ActionForward;
//import com.board.action.BoardListAction;

import com.board.action.MemberLoginAction;

public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// http://localhost:8080/Hanwha/index.do
		// /Hanwha/index.do
		String RequestURI = request.getRequestURI();
		//System.out.println(RequestURI);

		// /Hanwha 
		String contextPath = request.getContextPath();
		//System.out.println(contextPath);
		//System.out.println(contextPath.length());

		//  /index.do
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		

		

/*		
 * 아무 의미 없는 짓이다. .. . . . 
 * 그냥 개발자가 보기 편하기 위해 하는 병신짓임
 * 어짜피 이프문 안에 코맨드를 다시 써줘야함.
 * if(command.indexOf("/hanwha")!=-1){//gnb한화일경우
			
			System.out.println(command.indexOf("/hanwha"));
			
		}else if(command.indexOf("/dream")!=-1){//gnb 드림경우
			
		}else if(command.indexOf("/meet")!=-1){//gnb meet일경우

		}else if(command.indexOf("/apply")!=-1){//gnb apply일경우
			
		}else if(command.indexOf("/member")!=-1){//gnb member일경우
			
		}else{///gnb안에 있는 요청이 아닌 경우 ex) index.do
			
		}*/
		
	
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/index.do")) {
			// MainAction
			action = new MainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/member/login.do")) {// 로그인 페이지 이동
				// 
	
		forward = new ActionForward();
		forward.setRedirect(false);
			forward.setPath("/member/login.jsp");
		} 			
		else if(command.equals("/member/loginAction.do")) { //로그인버튼 클릭시 데이터 처리
			//  MemberLoginAction  
			action=new MemberLoginAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/apply/resume/personal_info.do")) {
			// 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/apply/resume/personal_info.jsp");
		} 
		else if(command.equals("/member/logoutAction.do")) {
			//  MemberLogoutAction  
			action=new MemberLogoutAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		else if(command.equals("/member/join/step1.do")) {//회원가입버튼눌렀을 경우
			action=new MemberJoinAction1();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		else if(command.equals("/member/join/step2.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/join/step2.jsp");		
		}
		else if(command.equals("/member/join/step3.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/join/step3.jsp");			
		
		}
		else if(command.equals("/member/join/MemberJoinAction.do")) {
			
			
			action=new MemberJoinAction();
			
			//action=new MemberJoinAction3();
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
