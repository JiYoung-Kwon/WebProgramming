package kpu.web.club.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kpu.web.club.domain.MemberVO;
import kpu.web.club.domain.SchedulesVO;
import kpu.web.club.persistence.MemberDAO;
import kpu.web.club.persistence.SchedulesDAO;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String cmdReq="";
		cmdReq = request.getParameter("cmd");
		
		if(cmdReq.equals("join")) 
		{
			response.sendRedirect("register.html");			
		}
		else if(cmdReq.equals("list"))
		{
			MemberDAO dao = new MemberDAO();
			ArrayList<MemberVO> memberList = dao.getStudentList();
			request.setAttribute("memberList",memberList);
			RequestDispatcher view = request.getRequestDispatcher("student_list.jsp");
			view.forward(request, response);
		}
		else if(cmdReq.equals("update")) {
			MemberDAO dao = new MemberDAO();
			MemberVO student = dao.read(request.getParameter("id"));
			request.setAttribute("student", student);
			RequestDispatcher view = request.getRequestDispatcher("update.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String message = null;
		String cmdReq="";
		cmdReq = request.getParameter("cmd");
		
		if (cmdReq.equals("join"))
		{
			MemberVO memberVO = new MemberVO();
			
			memberVO.setId(request.getParameter("id"));
			memberVO.setPasswd(request.getParameter("passwd"));
			memberVO.setUsername(request.getParameter("username"));
			memberVO.setSnum(request.getParameter("snum"));
			memberVO.setDepart(request.getParameter("depart"));
			memberVO.setMobile(request.getParameter("mobile"));
			memberVO.setEmail(request.getParameter("email"));
			
			MemberDAO memberDao = new MemberDAO();
				
			if(memberDao.add(memberVO)) message="가입 축하합니다";
			else message = "가입 실패입니다";
			
			request.setAttribute("message", message);
			request.setAttribute("student", memberVO);
			
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		}
		else if(cmdReq.equals("update")) {
			MemberVO memberVO = new MemberVO();
			
			memberVO.setId(request.getParameter("id"));
			memberVO.setPasswd(request.getParameter("passwd"));
			memberVO.setUsername(request.getParameter("username"));
			memberVO.setSnum(request.getParameter("snum"));
			memberVO.setDepart(request.getParameter("depart"));
			memberVO.setMobile(request.getParameter("mobile"));
			memberVO.setEmail(request.getParameter("email"));
			
			MemberDAO dao = new MemberDAO();
				
			if(dao.update(memberVO)) message="수정이 완료되었습니다.";
			else message = "수정 실패입니다.";
			
			request.setAttribute("message", message);
			request.setAttribute("student", memberVO);
			
			RequestDispatcher view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
			
		}
		else if(cmdReq.equals("login")) {
			HttpSession session = request.getSession();
			
			MemberVO memberVO = new MemberVO();
			memberVO.setId(request.getParameter("id"));
			memberVO.setPasswd(request.getParameter("passwd"));
			
			String id = request.getParameter("id");
			session.setAttribute("sessionID", id);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.login(memberVO.getId(),memberVO.getPasswd());
			if(result == 1) { //로그인 성공
				message = memberVO.getId();
				request.setAttribute("message", message);
				
				SchedulesDAO sdao = new SchedulesDAO();
				ArrayList<SchedulesVO> todoList = sdao.getTodoList(message);
				request.setAttribute("todoList",todoList);
				
				RequestDispatcher view = request.getRequestDispatcher("welcome.jsp");
				view.forward(request, response);
			}
			else {
				if(result == 0) message = "로그인 실패";
				if (result == -1) message = "아이디 없음";
				if (result == -1) message = "DB 오류";
				
				request.setAttribute("message", message);
				RequestDispatcher view = request.getRequestDispatcher("login.jsp");
				view.forward(request, response);
			}			

		}
	}

}
