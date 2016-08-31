package com.ht.service;

import java.util.List;

import com.ht.bean.Student;
import com.ht.bean.Stutotal;
import com.ht.common.Pager;
import com.ht.dao.StutotalDao;

public class StutotalServiceImpl implements StutotalService {

	private StutotalDao stutatolDao;
	
	
	public StutotalDao getStutatolDao() {
		return stutatolDao;
	}

	public void setStutatolDao(StutotalDao stutatolDao) {
		this.stutatolDao = stutatolDao;
	}

	@Override
	public Stutotal add(Stutotal t) {
		return stutatolDao.add(t);
	}

	@Override
	public Stutotal query(Stutotal t) {
		return stutatolDao.query(t);
	}

	@Override
	public Stutotal update(Stutotal t) {
		return stutatolDao.update(t);
	}

	@Override
	public void delete(Stutotal t) {
		stutatolDao.delete(t);		
	}

	@Override
	public Pager<Stutotal> queryAll(Pager<Stutotal> pager) {
		return stutatolDao.queryAll(pager);
	}

	@Override
	public Object count() {
		return stutatolDao.count();
	}

	@Override
	public List<Student> queryStudents() {
		return stutatolDao.queryStudents();
	}


	@Override
	public Object queryXueqi(int sid , String xueqi) {
		return stutatolDao.queryXueqi(sid, xueqi);
	}

}
