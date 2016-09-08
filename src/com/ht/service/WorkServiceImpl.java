package com.ht.service;

import java.util.List;

import com.ht.bean.Work;
import com.ht.bean.Worktype;
import com.ht.common.Pager;
import com.ht.dao.WorkDao;

public class WorkServiceImpl implements WorkService {

	private WorkDao workDao;
	
	public void setWorkDao(WorkDao workDao) {
		this.workDao = workDao;
	}

	@Override
	public Work add(Work t) {
		return workDao.add(t);
	}

	@Override
	public Work query(Work t) {
		return workDao.query(t);
	}

	@Override
	public Work update(Work t) {
		return workDao.update(t);
	}

	@Override
	public void delete(Work t) {
		workDao.delete(t);
	}

	@Override
	public Pager<Work> queryAll(Pager<Work> t) {
		return workDao.queryAll(t);
	}
	
	public List<Worktype> queryWorktype(){
		return workDao.queryWorktype();
	}

	@Override
	public Object count() {
		return workDao.count();
	}

	@Override
	public void deleteByType(int typeid) {
		workDao.deleteByType(typeid);
	}

	@Override
	public Work queryById(int wid) {
		return workDao.queryById(wid);
	}

	@Override
	public String deleteW(Work t) {
		return workDao.deleteW(t);
	}
}
