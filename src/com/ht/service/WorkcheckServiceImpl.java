package com.ht.service;

import com.ht.bean.Workcheck;
import com.ht.common.Pager;
import com.ht.dao.WorkcheckDao;

public class WorkcheckServiceImpl implements WorkcheckService {
	private WorkcheckDao WorkcheckDao;
	
	public void setWorkcheckDao(WorkcheckDao workcheckDao) {
		WorkcheckDao = workcheckDao;
	}

	@Override
	public Workcheck add(Workcheck t) {
		return WorkcheckDao.add(t);
	}

	@Override
	public Workcheck query(Workcheck t) {
		return WorkcheckDao.query(t);
	}

	@Override
	public Workcheck update(Workcheck t) {
		return WorkcheckDao.update(t);
	}

	@Override
	public void delete(Workcheck t) {
		WorkcheckDao.delete(t);
	}

	@Override
	public Pager<Workcheck> queryAll(Pager<Workcheck> t) {
		return WorkcheckDao.queryAll(t);
	}

	@Override
	public Object count() {
		return WorkcheckDao.count();
	}

}
