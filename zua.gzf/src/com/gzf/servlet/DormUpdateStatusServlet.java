package com.gzf.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gzf.bean.Dormbean;
import com.gzf.service.IDormService;
import com.gzf.service.impl.DormServiceImpl;

/**
 * Servlet implementation class DormUpdateStatusServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/DormUpdateStatusServlet" })
public class DormUpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DormUpdateStatusServlet() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		int status = Integer.parseInt(request.getParameter("status"));
		
		String house=null;
		String attribute = null;
		
		if (request.getParameter("house")!=null) {//说明是通过表单提交更改性别
			
			
			house = request.getParameter("house");
			attribute = request.getParameter("attribute");
			
		}
		
		Dormbean dormbean = new Dormbean();
		dormbean.setId(id);
		dormbean.setStatus(status);
		dormbean.setHouse(house);
		dormbean.setAttribute(attribute);
		
		IDormService iDormService = new DormServiceImpl();
		try {
			response.getWriter().println(iDormService.updateDorm(dormbean));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
