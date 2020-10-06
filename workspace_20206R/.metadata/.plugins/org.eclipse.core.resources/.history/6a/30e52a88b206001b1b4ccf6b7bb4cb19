package kpu.web.club.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kpu.web.club.domain.StudentVO;
import kpu.web.club.persistence.StudentDAO;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public StudentServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Get이 된다.");
		RequestDispatcher view = request.getRequestDispatcher("/register.html");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Post가 된다.");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String cmdReq="";
		cmdReq = request.getParameter("cmd");
		
		if(cmdReq.equals("join")) 
		{
			StudentVO studentVO = new StudentVO();
			
			studentVO.setId(request.getParameter("id"));
			studentVO.setPasswd(request.getParameter("passwd"));
			studentVO.setUsername(request.getParameter("username"));
			studentVO.setSnum(request.getParameter("snum"));
			studentVO.setDepart(request.getParameter("depart"));
			studentVO.setMobile(request.getParameter("mobile"));
			studentVO.setEmail(request.getParameter("email"));
			
			StudentDAO studentDAO = new StudentDAO();
			
			request.setAttribute("id", studentDAO.join(studentVO));	
		}
		
		RequestDispatcher view = request.getRequestDispatcher("result.jsp");
		view.forward(request, response);
		
	}

}
