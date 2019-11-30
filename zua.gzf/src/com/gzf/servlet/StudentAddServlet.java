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
import com.gzf.bean.StudentBean;
import com.gzf.dao.IDormDao;
import com.gzf.dao.IStudentDao;
import com.gzf.dao.impl.DormDAoImpl;
import com.gzf.dao.impl.StudentDaoImpl;
import com.gzf.service.IStudentService;
import com.gzf.service.impl.StudentServiceImpl;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/StudentAddServlet" })
public class StudentAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentAddServlet() {
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
		//获取学生信息，attribute为性别，学号表和宿舍表共用
         int sid = Integer.parseInt(request.getParameter("sid"));
         int sentranceT = Integer.parseInt(request.getParameter("sentranceT"));
         String sname = request.getParameter("sname");
         
         String sbirthday = request.getParameter("sbirthday");
         String smajor = request.getParameter("smajor");
         String scollege = request.getParameter("scollege");
         String stelephone = request.getParameter("stelephone");
         
         String house = request.getParameter("house");
         String build = request.getParameter("build");
         String number = request.getParameter("number");
         String attribute = request.getParameter("attribute");
         int status = Integer.parseInt(request.getParameter("status"));
//         查询验证输入的宿舍是否可以入住，验证包括宿舍是否存在，性别，以及入住状态
         Dormbean dormbean = new Dormbean();
         dormbean.setHouse(house);
         dormbean.setBuild(build);
         dormbean.setNumber(number);
         dormbean.setAttribute(attribute);
         dormbean.setStatus(status);
         IDormDao iDormDao = new DormDAoImpl();
         
         //检测学生是否存在
         IStudentDao iStudentDao = new StudentDaoImpl();
         try {
			if (iStudentDao.isExistStudent(sid)) {
				
				response.getWriter().print("此学生学号已存在，无法添加");
			}
			else {
				
			
         try {
			if (iDormDao.isExitDorm(dormbean)) {//当宿舍存在时
				Dormbean dormbean2 = iDormDao.selectDormByDormbean(dormbean);
				if (dormbean2.getQuantity()==6) {
					
					response.getWriter().print("当前宿舍人数已满，请为此学生更换宿舍");
				}
				else {
					if (!(dormbean2.getAttribute().equals(attribute))) {
						response.getWriter().print("当前宿舍不能入住此性别学生");
					}
					
					else {
						if (dormbean2.getStatus()==0) {
							
							response.getWriter().print("当前宿舍未启用，请更换或先启用此宿舍");
						}
						else {
							StudentBean studentBean = new StudentBean();
							studentBean.setSid(sid);
							studentBean.setDormID(dormbean2.getId());
							studentBean.setSname(sname);
							studentBean.setSsex(attribute);
							studentBean.setSbirthday(sbirthday);
							studentBean.setSmajor(smajor);
							studentBean.setScollege(scollege);
							studentBean.setSentranceT(sentranceT);
							studentBean.setStelephone(stelephone);
							IStudentService iStudentService = new StudentServiceImpl();
							iStudentService.addStudent(studentBean);
							response.getWriter().print("已为您创建此学生信息，并入住宿舍");
						}
					}
				}
			}
			else {//当宿舍不存在的时候，先创建宿舍，再入住学生
				iDormDao.addDorm(dormbean);
				Dormbean dormbean2 = iDormDao.selectDormByDormbean(dormbean);
				if (!(dormbean2.getAttribute().equals(attribute))) {
					response.getWriter().print("以为您创建此宿舍，但当前宿舍不能入住此性别学生");
				}
				else {
					StudentBean studentBean = new StudentBean();
					studentBean.setSid(sid);
					studentBean.setDormID(dormbean2.getId());
					studentBean.setSname(sname);
					studentBean.setSsex(attribute);
					studentBean.setSbirthday(sbirthday);
					studentBean.setSmajor(smajor);
					studentBean.setScollege(scollege);
					studentBean.setSentranceT(sentranceT);
					studentBean.setStelephone(stelephone);
					IStudentService iStudentService = new StudentServiceImpl();
					iStudentService.addStudent(studentBean);
					response.getWriter().print("已为您创建此宿舍，并入住此学生");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			}
 		} catch (SQLException e1) {
 			// TODO Auto-generated catch block
 			e1.printStackTrace();
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
