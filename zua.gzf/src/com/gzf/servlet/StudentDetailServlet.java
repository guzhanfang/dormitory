package com.gzf.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gzf.bean.Dormbean;
import com.gzf.bean.StudentBean;
import com.gzf.dao.IDormDao;
import com.gzf.dao.IStudentDao;
import com.gzf.dao.impl.DormDAoImpl;
import com.gzf.dao.impl.StudentDaoImpl;

/**
 * Servlet implementation class StudentDetailServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/StudentDetailServlet" })
public class StudentDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		StudentBean studentBean = new StudentBean();
		IStudentDao iStudentDao = new StudentDaoImpl();
		System.out.println(id);
		try {
			studentBean = iStudentDao.selectStudentById(id);
			System.out.println(studentBean);
			session.setAttribute("studentBean", studentBean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		IDormDao iDormDao = new DormDAoImpl();
		Dormbean dormbean = new Dormbean();
		try {
			dormbean = iDormDao.selectDormById(studentBean.getDormID());
			
			System.out.println(dormbean);
			session.setAttribute("dormbean", dormbean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getWriter().print(true);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
