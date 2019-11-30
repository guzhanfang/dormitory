package com.gzf.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gzf.bean.StudentBean;
import com.gzf.service.IStudentService;
import com.gzf.service.impl.StudentServiceImpl;

/**
 * Servlet implementation class StudentUpdateServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/StudentUpdateServlet" })
public class StudentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentUpdateServlet() {
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
		
        
        int sid = Integer.parseInt(request.getParameter("sid"));
        String sname = request.getParameter("sname");
        String smajor = request.getParameter("smajor");
        String scollege = request.getParameter("scollege");
        String sbirthday = request.getParameter("sbirthday");
        int sentranceT = Integer.parseInt(request.getParameter("sentranceT"));
        String stelephone = request.getParameter("stelephone");
        StudentBean studentBean = new StudentBean();
        studentBean.setSid(sid);
        studentBean.setSname(sname);
        studentBean.setSmajor(smajor);
        studentBean.setScollege(scollege);
        studentBean.setSbirthday(sbirthday);
        studentBean.setSentranceT(sentranceT);
        studentBean.setStelephone(stelephone);
        IStudentService iStudentService = new StudentServiceImpl();
        response.getWriter().println(iStudentService.updateStudent(studentBean));
        
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
