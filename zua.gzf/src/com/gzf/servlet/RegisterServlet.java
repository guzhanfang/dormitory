package com.gzf.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gzf.bean.UserBean;
import com.gzf.service.impl.UserServiceImpl;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String code = request.getParameter("code");
		HttpSession session = request.getSession();
		if (session.getAttribute("code")!=null) {
			if ((code.equals(session.getAttribute("code")))) {
				session.removeAttribute("code");
				UserBean userBean = new UserBean();
				userBean.setUsername(request.getParameter("username"));
				userBean.setPassword(request.getParameter("password"));
				userBean.setEmail(request.getParameter("email"));
				UserServiceImpl userServiceImpl = new UserServiceImpl();
				
				try {
					if (userServiceImpl.register(userBean)) {
						response.getWriter().print("注册成功");
					}
					else {
						response.getWriter().print("此用户名已存在，请更换用户名");
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			else {
				session.removeAttribute("code");
				response.getWriter().print("验证码错误");
			}
			
		}
		else {
			response.getWriter().print("还未获取验证码");
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
