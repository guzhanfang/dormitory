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
 * Servlet implementation class DormAddServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/DormAddServlet" })
public class DormAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DormAddServlet() {
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
		String build = request.getParameter("build");
		String house = request.getParameter("house");
		String number = request.getParameter("number");
		int status = Integer.parseInt(request.getParameter("status"));
		Dormbean dormbean = new Dormbean();
		dormbean.setHouse(house);
		dormbean.setBuild(build);
		dormbean.setNumber(number);
		dormbean.setStatus(status);
		IDormService iDormService = new DormServiceImpl();
		try {
			response.getWriter().print(iDormService.addDorm(dormbean));
			
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
