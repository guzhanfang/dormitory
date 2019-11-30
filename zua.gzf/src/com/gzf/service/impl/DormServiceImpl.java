package com.gzf.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import com.gzf.bean.Dormbean;
import com.gzf.dao.IDormDao;
import com.gzf.dao.impl.DormDAoImpl;
import com.gzf.service.IDormService;

public class DormServiceImpl implements IDormService {

	@Override
	public boolean addDorm(Dormbean dormbean) throws SQLException {
		// TODO Auto-generated method stub
		IDormDao iDormDao = new DormDAoImpl();
		if (iDormDao.isExitDorm(dormbean)) {
			return false;
		}
		else {
			if (iDormDao.addDorm(dormbean)) {
				return true;
			}
			else {
				return false;
			}
		}
		
	}

	@Override
	public boolean delDorm(Dormbean dormbean) throws SQLException {
		// TODO Auto-generated method stub
		IDormDao iDormDao = new DormDAoImpl();
		if (iDormDao.selectDormById(dormbean.getId()).getQuantity()==0) {
			return iDormDao.delDorm(dormbean);
		}
		
		else {
			return false;
		}
	}

	@Override
	public boolean updateDorm(Dormbean dormbean) throws SQLException {
		// TODO Auto-generated method stub
		IDormDao iDormDao = new DormDAoImpl();
		if (iDormDao.selectDormById(dormbean.getId()).getQuantity()==0) {
			System.out.println("dao实现类中"+dormbean);
			return iDormDao.updateDorm(dormbean);
		}
		
		else {
			return false;
		}
	}

	@Override
	public ArrayList<Dormbean> selectDorm(Dormbean dormbean) throws SQLException {
		// TODO Auto-generated method stub
		
		IDormDao iDormDao = new DormDAoImpl();
		return iDormDao.selectDorm(dormbean);
	}

	@Override
	public ArrayList<Dormbean> showAllDorm() throws SQLException {
		// TODO Auto-generated method stub
		IDormDao iDormDao = new DormDAoImpl();
		return iDormDao.showAllDorm();
	}

	@Override
	public int dormTotalCount(Dormbean dormbean) {
		// TODO Auto-generated method stub
		IDormDao iDormDao = new DormDAoImpl();
		
		return iDormDao.dormTotalCount(dormbean);
	}

	@Override
	public Dormbean selectDormById(int id) throws SQLException {
		// TODO Auto-generated method stub
		
		IDormDao iDormDao = new DormDAoImpl();
		return iDormDao.selectDormById(id);
		
	}

	@Override
	public boolean updateDormQuantity(Dormbean dormbean) {
		// TODO Auto-generated method stub
		IDormDao iDormDao = new DormDAoImpl();
		
		return iDormDao.updateDorm(dormbean);
	}

}
