package com.gzf.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.gzf.bean.StudentBean;

public interface IStudentDao {
	public ArrayList<StudentBean> showStudentByPage(int status,int nowPage,int step) throws SQLException ;//学生信息分页
	public int studentTotalCount(int status,StudentBean studentBean) ;//返回学生总数
	public ArrayList<StudentBean> selectStudents(int status,int nowPage, int step,StudentBean studentBean) throws SQLException;//根据查询条件实现学生信息分页
	public boolean addStudent(StudentBean studentBean);//增加学生信息
	public boolean isExistStudent(int sid) throws SQLException ;//根据学生学号判断学生是否存在
	public StudentBean selectStudentById(int id) throws SQLException;//根据学生主键查询相对应学生信息
	public boolean updateStudent(StudentBean studentBean);//更新学生信息
	public boolean updateStatusStudent(int id,int status);//根据学生主键更新学生状态
	public boolean delStudent(int id); //根据主键删除单个学生
	public boolean delAllStudent(String[] id); //根据主键数组批量删除学生
	public boolean updateAllStudent(String[] id); //根据主键恢复被删除的学生
	public ArrayList<StudentBean> selectByDormID(int dormID) throws SQLException;
	
}
