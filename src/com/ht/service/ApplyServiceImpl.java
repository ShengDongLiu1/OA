package com.ht.service;

import java.util.List;

import com.ht.bean.Apply;
import com.ht.bean.Dep;
import com.ht.bean.Worktype;
import com.ht.common.Pager;
import com.ht.dao.ApplyDao;

public class ApplyServiceImpl implements ApplyService {
	
	private ApplyDao applyDao;
	
	public void setApplySDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}

	@Override
	public Apply add(Apply t) {
		return applyDao.add(t);
	}

	@Override
	public Apply query(Apply t) {
		return applyDao.query(t);
	}

	@Override
	public Apply update(Apply t) {
		return applyDao.update(t);
	}

	@Override
	public void delete(Apply t) {
		applyDao.delete(t);
	}

	@Override
	public Pager<Apply> queryAll(Pager<Apply> t) {
		return applyDao.queryAll(t);
	}

	@Override
	public Object count() {
		return applyDao.count();
	}

	@Override
	public List<Dep> queryDep() {
		return applyDao.queryDep();
	}

	@Override
	public List<Worktype> queryWorktype() {
		return applyDao.queryWorktype();
	}

	@Override
	public Apply updateSP(Apply t) {
		return applyDao.updateSP(t);
	}

	@Override
	public Pager<Apply> queryByDepName(Pager<Apply> pager, String name) {
		return applyDao.queryByDepName(pager,name);
	}

	@Override
	public Pager<Apply> queryByWorktypeName(Pager<Apply> pager, String lname) {
		return applyDao.queryByWorktypeName(pager, lname);
	}

	@Override
	public Pager<Apply> queryByAstatus(Pager<Apply> pager, String status) {
		return applyDao.queryByAstatus(pager, status);
	}

	@Override
	public Pager<Apply> queryByTime(Pager<Apply> pager, String time) {
		return applyDao.queryByTime(pager, time);
	}

	@Override
	public Pager<Apply> queryAllG(Pager<Apply> pager) {
		return applyDao.queryAllG(pager);
	}

}
