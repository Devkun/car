package com.board.action;

//import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import com.sun.jndi.url.corbaname.corbanameURLContextFactory;

//import net.board.db.BoardBean;
//import net.board.db.BoardDAO;

public class MainAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MainAction execute()");
		// ?占쏙옙占�? 媛앹껜 ?占쏙옙?占쏙옙 BoardDAO  bdao
		//BoardDAO bdao=new BoardDAO();
		// int count =  硫붿꽌?占쏙옙?占쏙옙占�?  getBoardCount()   count(*)
		//int count=bdao.getBoardCount();
		//String pageNum="1";
		//List<BoardBean> boardList=null;
		//if(count!=0){
		//	boardList=bdao.getBoardList(1, 5);
		//}
		// ???占쏙옙 count   boardList   pageNum
		//request.setAttribute("count", count);
		//request.setAttribute("boardList", boardList);
		//request.setAttribute("pageNum", pageNum);
		// ?占쏙옙?占쏙옙 ./main/main.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/index.jsp");
		return forward;
	}
}
