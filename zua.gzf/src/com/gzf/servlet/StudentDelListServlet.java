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
import com.gzf.service.IStudentService;
import com.gzf.service.impl.StudentServiceImpl;
import com.gzf.util.PageUtil;

/**
 * Servlet implementation class StudentDelListServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/StudentDelListServlet" })
public class StudentDelListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentDelListServlet() {
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
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		int step = 5;
		int status = 2;
		IStudentService iStudentService = new StudentServiceImpl();
		ArrayList<StudentBean> studentBeans = new ArrayList<>();
		try {
			studentBeans = iStudentService.showStudentByPage(status,nowPage, step);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int totalCount = iStudentService.StudentTotalCount(status,new StudentBean());
		PageUtil<StudentBean> pageUtil = new PageUtil<>();
		pageUtil.setList(studentBeans);
		
		pageUtil.setTotalCount(totalCount);
		pageUtil.setStep(step);
		pageUtil.setNowPage(nowPage);
		request.setAttribute("pageUtil", pageUtil);
		request.getRequestDispatcher("student-del-list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
