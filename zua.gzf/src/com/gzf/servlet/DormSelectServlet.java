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
 * Servlet implementation class DormSelectServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/DormSelectServlet" })
public class DormSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DormSelectServlet() {
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
		String house = null;
		String number =null;
		String build = null;
		String attribute = null;
		int quantity = 0;
		if (request.getParameter("house")!="") {
			house = request.getParameter("house");
		}
		if (request.getParameter("number")!="") {
			number = request.getParameter("number");
		}
		if (request.getParameter("build")!="") {
			build = request.getParameter("build");
		}
		if (request.getParameter("quantity")!="") {
			quantity = Integer.parseInt(request.getParameter("quantity"));
		}
		else {
			quantity = -1;
		}
		if (request.getParameter("attribute")!="") {
			attribute = request.getParameter("attribute");
		}
		
		Dormbean dormbean = new Dormbean();
		dormbean.setHouse(house);
		dormbean.setNumber(number);
		dormbean.setBuild(build);
		dormbean.setAttribute(attribute);
		dormbean.setQuantity(quantity);
		IDormService iDormService = new DormServiceImpl();
		int dormTotalCount = iDormService.dormTotalCount(dormbean);
		request.setAttribute("dormTotalCount", dormTotalCount);
		try {
			request.setAttribute("dormbeans", iDormService.selectDorm(dormbean));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("dorm-list.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
