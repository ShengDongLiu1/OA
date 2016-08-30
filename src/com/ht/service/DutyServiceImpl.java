package com.ht.service;

import com.ht.bean.Duty;
import com.ht.common.Pager;
import com.ht.dao.DutyDao;

public class DutyServiceImpl implements DutyService {
	private DutyDao dutyDao;
	
	public void setDutyDao(DutyDao dutyDao) {
		this.dutyDao = dutyDao;
	}

	@Override
	public Duty add(Duty t) {
		return dutyDao.add(t);
	}

	@Override
	public Duty query(Duty t) {
		return dutyDao.query(t);
	}

	@Override
	public Duty update(Duty t) {
		return dutyDao.update(t);
	}

	@Override
	public void delete(Duty t) {
		dutyDao.delete(t);
	}

	@Override
	public Pager<Duty> queryAll(Pager<Duty> t) {
		return dutyDao.queryAll(t);
	}

	@Override
	public Object count() {
		return null;
	}

}
