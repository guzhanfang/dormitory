package com.gzf.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.gzf.bean.StudentBean;

public interface IStudentService {
	public ArrayList<StudentBean> showStudentByPage(int status,int nowPage,int step) throws SQLException;//分页展示所有学生信息
	public int StudentTotalCount(int status,StudentBean studentBean);//根据学生状态获得学生个数
	public ArrayList<StudentBean> selectStudents(int status,int nowPage,int step,StudentBean studentBean) throws SQLException ;//根据条件查询学生信息并分页
	public boolean addStudent(StudentBean studentBean) throws SQLException ;//增加学生信息
	public boolean updateStudent(StudentBean studentBean);//更新学生信息
	public boolean updateStatusStudent(int id,int status);//更新学生状态
	public boolean delStudent(int id); //根据id删除学生
	public boolean delAllStudent(String[] id); //根据id数组批量删除学生
	public boolean updateAllStudent(String[] id);//根据id数组批量改变学生信息状态
}
