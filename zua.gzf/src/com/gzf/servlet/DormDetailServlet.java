package com.gzf.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gzf.bean.StudentBean;
import com.gzf.dao.IStudentDao;
import com.gzf.dao.impl.StudentDaoImpl;

/**
 * Servlet implementation class DormDetailServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/DormDetailServlet" })
public class DormDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DormDetailServlet() {
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
		int dormID = Integer.parseInt(request.getParameter("dormID"));
		IStudentDao iStudentDao = new StudentDaoImpl();
		ArrayList<StudentBean> studentBeans = new ArrayList<>();
		try {
			studentBeans = iStudentDao.selectByDormID(dormID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("studentBeans", studentBeans);
		request.getRequestDispatcher("dorm-detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
