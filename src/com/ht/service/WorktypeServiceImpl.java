package com.ht.service;

import com.ht.bean.Worktype;
import com.ht.common.Pager;
import com.ht.dao.WorktypeDao;

public class WorktypeServiceImpl implements WorktypeService {

	private WorktypeDao worktypeDao;
	
	public void setWorktypeDao(WorktypeDao worktypeDao) {
		this.worktypeDao = worktypeDao;
	}

	@Override
	public Worktype add(Worktype t) {
		return worktypeDao.add(t);
	}

	@Override
	public Worktype query(Worktype t) {
		return worktypeDao.query(t);
	}

	@Override
	public Worktype update(Worktype t) {
		return worktypeDao.update(t);
	}

	@Override
	public void delete(Worktype t) {
		worktypeDao.delete(t);
	}

	@Override
	public Pager<Worktype> queryAll(Pager<Worktype> t) {
		return worktypeDao.queryAll(t);
	}

	@Override
	public Object count() {
		return worktypeDao.count();
	}

}
