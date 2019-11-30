package com.gzf.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.jasper.compiler.SmapStratum;

import com.gzf.bean.Dormbean;
import com.gzf.bean.StudentBean;
import com.gzf.dao.IStudentDao;
import com.gzf.util.DButil;

public class StudentDaoImpl implements IStudentDao {

	@Override
	public ArrayList<StudentBean> showStudentByPage(int status, int nowPage, int step) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM student where status = ? LIMIT ?,?";
		Object [] params = {status,nowPage*step-step,step};
		ResultSet resultSet = DButil.select(sql, params);
		ArrayList<StudentBean> studentBeans = new ArrayList<>();
		while (resultSet.next()) {
			StudentBean studentBean = new StudentBean();
			studentBean.setId(resultSet.getInt("id"));
			studentBean.setSid(resultSet.getInt("sid"));
			studentBean.setDormID(resultSet.getInt("dormID"));
			studentBean.setSname(resultSet.getString("sname"));
			studentBean.setSsex(resultSet.getString("ssex"));
			studentBean.setSbirthday(resultSet.getString("sbirthday"));
			studentBean.setSmajor(resultSet.getString("smajor"));
			studentBean.setScollege(resultSet.getString("scollege"));
			studentBean.setSentranceT(resultSet.getInt("sentranceT"));
			studentBean.setStelephone(resultSet.getString("stelephone"));
			studentBean.setImg(resultSet.getString("img"));
			studentBean.setStatus(resultSet.getInt("status"));
			studentBeans.add(studentBean);
		}
		DButil.closeAll();
		return studentBeans;
	}

	@Override
	public int studentTotalCount(int status,StudentBean studentBean) {
		// TODO Auto-generated method stub
		String sql = "select count(1) from student where status = ? ";
		if (studentBean.getSid()==0) {
			sql = sql + " and sid != ?";
		}
		else {
			sql = sql + " and sid like ?";
		}
		if (studentBean.getSname()=="") {
			sql = sql + " and sname != ?";
		}
		else {
			sql = sql + " and sname like ?";
		}
		if (studentBean.getSsex()=="") {
			sql = sql + " and ssex != ?";
		}
		else {
			sql = sql + " and ssex = ?";
		}
		if (studentBean.getSmajor()=="") {
			sql = sql + " and smajor != ?";
		}
		else {
			sql = sql + " and smajor like ?";
		}
		if (studentBean.getScollege()=="") {
			sql = sql + " and scollege != ?";
		}
		else {
			sql = sql + " and scollege like ?";
		}
		if (studentBean.getSentranceT()==0) {
			sql = sql + " and sentranceT != ?";
		}
		else {
			sql = sql + " and sentranceT like ?";
		}
		
		
		Object [] params = {status,"%"+studentBean.getSid()+"%","%"+studentBean.getSname()+"%",studentBean.getSsex(),
				"%"+studentBean.getSmajor()+"%","%"+studentBean.getScollege()+"%","%"+studentBean.getSentranceT()+"%",
				};
		
		return DButil.totalCount(sql, params);
	}

	@Override
	public ArrayList<StudentBean> selectStudents(int status,int nowPage, int step,StudentBean studentBean) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM student where status = ?";
		if (studentBean.getSid()==0) {
			sql = sql + " and sid != ?";
		}
		else {
			sql = sql + " and sid like ?";
		}
		if (studentBean.getSname()=="") {
			sql = sql + " and sname != ?";
		}
		else {
			sql = sql + " and sname like ?";
		}
		if (studentBean.getSsex()=="") {
			sql = sql + " and ssex != ?";
		}
		else {
			sql = sql + " and ssex = ?";
		}
		if (studentBean.getSmajor()=="") {
			sql = sql + " and smajor != ?";
		}
		else {
			sql = sql + " and smajor like ?";
		}
		if (studentBean.getScollege()=="") {
			sql = sql + " and scollege != ?";
		}
		else {
			sql = sql + " and scollege like ?";
		}
		if (studentBean.getSentranceT()==0) {
			sql = sql + " and sentranceT != ?";
		}
		else {
			sql = sql + " and sentranceT like ?";
		}
		sql = sql + " LIMIT ?,?";
		Object [] params = {status,"%"+studentBean.getSid()+"%","%"+studentBean.getSname()+"%",studentBean.getSsex(),
				"%"+studentBean.getSmajor()+"%","%"+studentBean.getScollege()+"%","%"+studentBean.getSentranceT()+"%",
				nowPage*step-step,step};
		
		ResultSet resultSet = DButil.select(sql, params);
		ArrayList<StudentBean> studentBeans = new ArrayList<>();
		while(resultSet.next()) {
			StudentBean studentBean2 = new StudentBean();
			studentBean2.setId(resultSet.getInt("id"));
			studentBean2.setSid(resultSet.getInt("sid"));
			studentBean2.setDormID(resultSet.getInt("dormID"));
			studentBean2.setSname(resultSet.getString("sname"));
			studentBean2.setSsex(resultSet.getString("ssex"));
			studentBean2.setSbirthday(resultSet.getString("sbirthday"));
			studentBean2.setSmajor(resultSet.getString("smajor"));
			studentBean2.setScollege(resultSet.getString("scollege"));
			studentBean2.setSentranceT(resultSet.getInt("sentranceT"));
			studentBean2.setStelephone(resultSet.getString("stelephone"));
			studentBean2.setImg(resultSet.getString("img"));
			studentBean2.setStatus(resultSet.getInt("status"));
			studentBeans.add(studentBean2);
		}
		return studentBeans;
	}

	@Override
	public boolean addStudent(StudentBean studentBean) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO `dormitory`.`student` (`sid`, `dormID`, `sname`, `ssex`, `sbirthday`, `smajor`, `scollege`, `sentranceT`, `stelephone`) VALUES (?,?,?,?,?,?,?,?,?);";
		Object [] params = {studentBean.getSid(),studentBean.getDormID(),studentBean.getSname(),studentBean.getSsex(),studentBean.getSbirthday(),
				studentBean.getSmajor(),studentBean.getScollege(),studentBean.getSentranceT(),studentBean.getStelephone()};
		return DButil.update(sql, params);
	}

	@Override
	public boolean isExistStudent(int sid) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `student` WHERE sid = ?";
		Object [] params = {sid};
		return DButil.isExist(sql, params);
	}

	@Override
	public StudentBean selectStudentById(int id) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `student` WHERE id = ?";
		Object [] params = {id};
		ResultSet resultSet = DButil.select(sql, params);
		StudentBean studentBean = new StudentBean();
		if (resultSet.next()) {
			studentBean.setId(resultSet.getInt("id"));
			studentBean.setSid(resultSet.getInt("sid"));
			studentBean.setDormID(resultSet.getInt("dormID"));
			studentBean.setSname(resultSet.getString("sname"));
			studentBean.setSsex(resultSet.getString("ssex"));
			studentBean.setSbirthday(resultSet.getString("sbirthday"));
			studentBean.setSmajor(resultSet.getString("smajor"));
			studentBean.setScollege(resultSet.getString("scollege"));
			studentBean.setSentranceT(resultSet.getInt("sentranceT"));
			studentBean.setStelephone(resultSet.getString("stelephone"));
			studentBean.setImg(resultSet.getString("img"));
			studentBean.setStatus(resultSet.getInt("status"));
			
		}
		DButil.closeAll();
		return studentBean;
	}

	@Override
	public boolean updateStudent(StudentBean studentBean) {
		// TODO Auto-generated method stub
		String sql = "UPDATE `student` SET `sname`=?,`sbirthday`=?,`smajor`=?,`scollege`=?,`sentranceT`=?,`stelephone`=? WHERE sid = ?";
		Object [] params = {studentBean.getSname(),studentBean.getSbirthday(),studentBean.getSmajor(),studentBean.getScollege(),studentBean.getSentranceT(),studentBean.getStelephone(),studentBean.getSid()};
		return DButil.update(sql, params);
	}

	@Override
	public boolean updateStatusStudent(int id,int status) {
		// TODO Auto-generated method stub
		String sql = "UPDATE `student` SET `status`= ? WHERE id = ?";
		Object [] params = {status,id};
		return DButil.update(sql, params);
	}

	@Override
	public boolean delStudent(int id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM `student` WHERE id = ?";
		Object [] params = {id};
		return DButil.update(sql, params);
	}

	@Override
	public boolean delAllStudent(String[] id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM `student` WHERE id = ?";
		for (int i = 0; i < id.length; i++) {
			Object [] params = {id[i]};
			DButil.update(sql, params);
		}
		return true;
		
	}

	@Override
	public boolean updateAllStudent(String[] id) {
		// TODO Auto-generated method stub
		String sql = "UPDATE `student` SET `status`= ? WHERE id = ?";
		for (int i = 0; i < id.length; i++) {
			Object [] params = {2,id[i]};
			DButil.update(sql, params);
		}
	
		return true;
	}

	@Override
	public ArrayList<StudentBean> selectByDormID(int dormID) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM student where dormID = ?";
		Object [] params = {dormID};
		ResultSet resultSet = DButil.select(sql, params);
		ArrayList<StudentBean> studentBeans = new ArrayList<>();
		while (resultSet.next()) {
			StudentBean studentBean = new StudentBean();
			studentBean.setId(resultSet.getInt("id"));
			studentBean.setSid(resultSet.getInt("sid"));
			studentBean.setDormID(resultSet.getInt("dormID"));
			studentBean.setSname(resultSet.getString("sname"));
			studentBean.setSsex(resultSet.getString("ssex"));
			studentBean.setSbirthday(resultSet.getString("sbirthday"));
			studentBean.setSmajor(resultSet.getString("smajor"));
			studentBean.setScollege(resultSet.getString("scollege"));
			studentBean.setSentranceT(resultSet.getInt("sentranceT"));
			studentBean.setStelephone(resultSet.getString("stelephone"));
			studentBean.setImg(resultSet.getString("img"));
			studentBean.setStatus(resultSet.getInt("status"));
			studentBeans.add(studentBean);
		}
		DButil.closeAll();
		return studentBeans;
	}
}
