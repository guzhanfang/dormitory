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

import com.gzf.bean.Dormbean;
import com.gzf.dao.impl.DormDAoImpl;
import com.gzf.service.IDormService;
import com.gzf.service.impl.DormServiceImpl;

/**
 * Servlet implementation class DormListServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/DormListServlet" })
public class DormListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DormListServlet() {
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
		IDormService iDormService = new DormServiceImpl();
		Dormbean dormbean = new Dormbean();
		int dormTotalCount = iDormService.dormTotalCount(dormbean);
		ArrayList<Dormbean> dormbeans = new ArrayList<>();
		try {
			dormbeans = iDormService.showAllDorm();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("dormTotalCount", dormTotalCount);
		request.setAttribute("dormbeans", dormbeans);
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
