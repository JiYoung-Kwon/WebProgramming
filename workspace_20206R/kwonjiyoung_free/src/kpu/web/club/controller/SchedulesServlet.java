package kpu.web.club.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
 * Servlet implementation class SchedulesServlet
 */
@WebServlet("/SchedulesServlet")
public class SchedulesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SchedulesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String cmdReq = "";
		cmdReq = request.getParameter("cmd");

		if (cmdReq.equals("scheduler")) {

			HttpSession session = request.getSession();

			String user_id = (String) session.getAttribute("sessionID");

			SchedulesDAO sdao = new SchedulesDAO();
			ArrayList<SchedulesVO> todoList = sdao.getTodoList(user_id);
			request.setAttribute("todoList", todoList);

			RequestDispatcher view = request.getRequestDispatcher("scheduler.jsp");
			view.forward(request, response);
		} else if (cmdReq.equals("list")) {
			HttpSession session = request.getSession();

			String user_id = (String) session.getAttribute("sessionID");

			SchedulesDAO sdao = new SchedulesDAO();
			ArrayList<SchedulesVO> todoList = sdao.getTodoList(user_id);
			request.setAttribute("todoList", todoList);

			String uid = request.getParameter("uid");
			System.out.println(uid);
			session.setAttribute("sessionUID", uid);
			request.setAttribute("uid", uid);

			SchedulesVO schedulesVO = new SchedulesVO();

			schedulesVO.setUid(Integer.parseInt(request.getParameter("uid")));
			schedulesVO.setId(request.getParameter("id"));
			schedulesVO.setTitle(request.getParameter("title"));
			schedulesVO.setSc_year(request.getParameter("sc_year"));
			schedulesVO.setSc_month(request.getParameter("sc_month"));
			schedulesVO.setSc_day(request.getParameter("sc_day"));
			schedulesVO.setStart_time(request.getParameter("start_time"));
			schedulesVO.setEnd_time(request.getParameter("end_time"));

			request.setAttribute("list", schedulesVO);

			RequestDispatcher view = request.getRequestDispatcher("schedule_list.jsp");
			view.forward(request, response);
		} 
		else if (cmdReq.equals("updatelist")) {
			HttpSession session = request.getSession();

			String user_id = (String) session.getAttribute("sessionID");

			SchedulesDAO sdao = new SchedulesDAO();
			ArrayList<SchedulesVO> todoList = sdao.getTodoList(user_id);
			request.setAttribute("todoList", todoList);

			String uid = request.getParameter("uid");
			System.out.println(uid);
			session.setAttribute("sessionUID", uid);
			request.setAttribute("uid", uid);

			SchedulesVO schedulesVO = new SchedulesVO();

			schedulesVO.setUid(Integer.parseInt(request.getParameter("uid")));
			schedulesVO.setId(request.getParameter("id"));
			schedulesVO.setTitle(request.getParameter("title"));
			schedulesVO.setSc_year(request.getParameter("sc_year"));
			schedulesVO.setSc_month(request.getParameter("sc_month"));
			schedulesVO.setSc_day(request.getParameter("sc_day"));
			schedulesVO.setStart_time(request.getParameter("start_time"));
			schedulesVO.setEnd_time(request.getParameter("end_time"));

			request.setAttribute("list", schedulesVO);

			RequestDispatcher view = request.getRequestDispatcher("update.jsp");
			view.forward(request, response);
		}
		
		else if (cmdReq.equals("update")) {
			HttpSession session = request.getSession();

			String user_id = (String) session.getAttribute("sessionID");
			System.out.println(user_id);

			SchedulesDAO sdao = new SchedulesDAO();
			ArrayList<SchedulesVO> todoList = sdao.getTodoList(user_id);
			request.setAttribute("todoList", todoList);

			String uid = session.getAttribute("sessionUID").toString();
			request.setAttribute("uid", uid);
			System.out.println(uid);
			
			SchedulesVO schedulesVO = new SchedulesVO();
			
			schedulesVO.setUid(Integer.parseInt(uid));
			schedulesVO.setTitle(request.getParameter("title"));
			schedulesVO.setSc_year(request.getParameter("sc_year"));
			schedulesVO.setSc_month(request.getParameter("sc_month"));
			schedulesVO.setSc_day(request.getParameter("sc_day"));
			schedulesVO.setStart_time(request.getParameter("start_time"));
			schedulesVO.setEnd_time(request.getParameter("end_time"));

			String message;
			if (sdao.update(schedulesVO)) {
				
				System.out.println("완료");
				message = "수정이 완료되었습니다.";
			} else {
				System.out.println("실패");
				message = "수정 실패입니다.";
			}

			request.setAttribute("message", message);
			request.setAttribute("list", schedulesVO);

			RequestDispatcher view = request.getRequestDispatcher("welcome.jsp");
			view.forward(request, response);
		}
		else if (cmdReq.equals("delete")) {
			HttpSession session = request.getSession();

			String user_id = (String) session.getAttribute("sessionID");
			System.out.println(user_id);

			SchedulesDAO sdao = new SchedulesDAO();
			ArrayList<SchedulesVO> todoList = sdao.getTodoList(user_id);
			request.setAttribute("todoList", todoList);

			String uid = session.getAttribute("sessionUID").toString();
			request.setAttribute("uid", uid);
			System.out.println(uid);
			
			SchedulesVO schedulesVO = new SchedulesVO();
			
			schedulesVO.setUid(Integer.parseInt(uid));
			schedulesVO.setTitle(request.getParameter("title"));
			schedulesVO.setSc_year(request.getParameter("sc_year"));
			schedulesVO.setSc_month(request.getParameter("sc_month"));
			schedulesVO.setSc_day(request.getParameter("sc_day"));
			schedulesVO.setStart_time(request.getParameter("start_time"));
			schedulesVO.setEnd_time(request.getParameter("end_time"));

			String message;
			if (sdao.delete(schedulesVO)) {
				
				System.out.println("완료");
				message = "수정이 완료되었습니다.";
			} else {
				System.out.println("실패");
				message = "수정 실패입니다.";
			}

			request.setAttribute("message", message);
			request.setAttribute("list", schedulesVO);

			RequestDispatcher view = request.getRequestDispatcher("welcome.jsp");
			view.forward(request, response);
		}
	}

}
