package com.gzf.util;

import java.util.ArrayList;

public class PageUtil<T> {
	private int totalCount;
	private int step;
	private int totalPage;
	private int nowPage;
	private ArrayList<T> list;
	public PageUtil(int totalCount, int step, int totalPage, int nowPage, ArrayList<T> list) {
		super();
		this.totalCount = totalCount;
		this.step = step;
		this.totalPage = totalPage;
		this.nowPage = nowPage;
		this.list = list;
	}
	public PageUtil() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getStep() {
		return step;
	}
//	在这里定义了总页数，因此需要先定义数据总数，再定义每页显示数量
	public void setStep(int step) {
		this.step = step;
		if(this.totalCount % this.step ==0) {
			this.totalPage = this.totalCount / this.step;
		}
		else {
			this.totalPage = this.totalCount / this.step + 1;
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public ArrayList<T> getList() {
		return list;
	}
	public void setList(ArrayList<T> list) {
		this.list = list;
	}
	
}
