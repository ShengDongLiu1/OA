package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Says;
import com.ht.common.Pager;
import com.ht.dao.SaysDao;

public class SaysServiceImpl implements SaysService{
	private SaysDao saysDao;
	
	public void setSaysDao(SaysDao saysDao) {
		this.saysDao = saysDao;
	}

	public SaysDao getSaysDao() {
		return saysDao;
	}

	@Override
	public Says add(Says t) {
		return saysDao.add(t);
	}

	@Override
	public Says query(Says t) {
		return saysDao.query(t);
	}

	@Override
	public Says update(Says t) {
		return saysDao.update(t);
	}

	@Override
	public void delete(Says t) {
		saysDao.delete(t);
	}

	@Override
	public Pager<Says> queryAll(Pager<Says> t) {
		return saysDao.queryAll(t);
	}

	@Override
	public Object count() {
		return null;
	}

	@Override
	public List<Dep> querydepname() {
		return saysDao.querydepname();
	}

}
