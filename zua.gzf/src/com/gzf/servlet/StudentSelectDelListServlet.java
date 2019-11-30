package com.gzf.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gzf.bean.StudentBean;
import com.gzf.service.IStudentService;
import com.gzf.service.impl.StudentServiceImpl;
import com.gzf.util.PageUtil;

/**
 * Servlet implementation class StudentSelectDelListServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/StudentSelectDelListServlet" })
public class StudentSelectDelListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentSelectDelListServlet() {
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
		StudentBean studentBean = new StudentBean();
		
		int nowPage;
		int step = 5;
		int status = 2 ;
		if (request.getParameter("nowPage")==null) {//为null说明是通过按钮提交
			nowPage = 1;
			int sid = 0;
			if (request.getParameter("sid")!="") {
				sid = Integer.parseInt(request.getParameter("sid"));
			}
			String sname = request.getParameter("sname");
			String ssex = request.getParameter("ssex");
			String smajor = request.getParameter("smajor");
			String scollege = request.getParameter("scollege");
			int sentranceT = 0;
			if (request.getParameter("sentranceT")!="") {
				sentranceT = Integer.parseInt(request.getParameter("sentranceT"));
			}
			studentBean.setSid(sid);
			studentBean.setSname(sname);
			studentBean.setSsex(ssex);
			studentBean.setSmajor(smajor);
			studentBean.setScollege(scollege);
			studentBean.setSentranceT(sentranceT);
			session.setAttribute("studentBean", studentBean);
		}
		else {										//不为空说明为通过页码提交搜索
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			if(session.getAttribute("studentBean")!=null) {
				
				studentBean = (StudentBean) session.getAttribute("studentBean");
			}
		}
		IStudentService iStudentService = new StudentServiceImpl();
		int totalCount = iStudentService.StudentTotalCount(status,studentBean);
		ArrayList<StudentBean> studentBeans = new ArrayList<>();
		try {
			studentBeans = iStudentService.selectStudents(status,nowPage,step, studentBean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PageUtil<StudentBean> pageUtil = new PageUtil<>();
		pageUtil.setList(studentBeans);
		pageUtil.setTotalCount(totalCount);
		pageUtil.setStep(step);
		pageUtil.setNowPage(nowPage);
		request.setAttribute("pageUtil", pageUtil);
		request.getRequestDispatcher("student-del-select.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
