package com.gzf.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import com.gzf.bean.Dormbean;
import com.gzf.bean.StudentBean;
import com.gzf.dao.IDormDao;
import com.gzf.dao.IStudentDao;
import com.gzf.dao.impl.DormDAoImpl;
import com.gzf.dao.impl.StudentDaoImpl;
import com.gzf.service.IStudentService;
import com.gzf.util.DButil;

public class StudentServiceImpl implements IStudentService {

	@Override
	public ArrayList<StudentBean> showStudentByPage(int status,int nowPage, int step) throws SQLException {
		// TODO Auto-generated method stub
		IStudentDao iStudentDao = new StudentDaoImpl();
		return iStudentDao.showStudentByPage(status,nowPage, step);
	}

	@Override
	public int StudentTotalCount(int status,StudentBean studentBean) {
		// TODO Auto-generated method stub
		IStudentDao iStudentDao = new StudentDaoImpl();
		
		return iStudentDao.studentTotalCount(status,studentBean);
	}

	@Override
	public ArrayList<StudentBean> selectStudents(int status,int nowPage, int step, StudentBean studentBean) throws SQLException {
		// TODO Auto-generated method stub
		IStudentDao iStudentDao = new StudentDaoImpl();
		return iStudentDao.selectStudents(status,nowPage, step, studentBean);
	}

	@Override
	public boolean addStudent(StudentBean studentBean) throws SQLException {
		// TODO Auto-generated method stub
		int id = studentBean.getDormID();
		IDormDao iDormDao = new DormDAoImpl();
		int quantity = iDormDao.selectDormById(id).getQuantity();
		iDormDao.updateDormQuantity(id, quantity+1);
		IStudentDao iStudentDao = new StudentDaoImpl();
		return iStudentDao.addStudent(studentBean);
	}

	@Override
	public boolean updateStudent(StudentBean studentBean) {
		// TODO Auto-generated method stub
		IStudentDao iStudentDao = new StudentDaoImpl();
		return iStudentDao.updateStudent(studentBean);
	}

	@Override
	public boolean updateStatusStudent(int id,int status) {
		// TODO Auto-generated method stub
		IStudentDao iStudentDao = new StudentDaoImpl();
		return iStudentDao.updateStatusStudent(id,status);
	}

	@Override
	public boolean delStudent(int id) {
		// TODO Auto-generated method stub
		IStudentDao iStudentDao = new StudentDaoImpl();
		StudentBean studentBean = new StudentBean();
		try {
			studentBean = iStudentDao.selectStudentById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Dormbean dormbean = new Dormbean();
		IDormDao iDormDao = new DormDAoImpl();
		try {
			dormbean = iDormDao.selectDormById(studentBean.getDormID());
			iDormDao.updateDormQuantity(dormbean.getId(), dormbean.getQuantity()-1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return iStudentDao.delStudent(id);
	}

	@Override
	public boolean delAllStudent(String[] id) {
		// TODO Auto-generated method stub
		IStudentDao iStudentDao = new StudentDaoImpl();
		for (int i = 0; i < id.length; i++) {
			StudentBean studentBean = new StudentBean();
			try {
				studentBean = iStudentDao.selectStudentById(Integer.parseInt(id[i]));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Dormbean dormbean = new Dormbean();
			IDormDao iDormDao = new DormDAoImpl();
			try {
				dormbean = iDormDao.selectDormById(studentBean.getDormID());
				iDormDao.updateDormQuantity(dormbean.getId(), dormbean.getQuantity()-1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		return iStudentDao.delAllStudent(id);
	}

	@Override
	public boolean updateAllStudent(String[] id) {
		// TODO Auto-generated method stub
		IStudentDao iStudentDao = new StudentDaoImpl();
		return iStudentDao.updateAllStudent(id);
	}

}
