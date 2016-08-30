package com.ht.service;

import com.ht.bean.Rawpun;
import com.ht.common.Pager;
import com.ht.dao.RawpunDao;

public class RawpunServiceImpl implements RawpunService{
	private RawpunDao rawpunDao;
	
	public void setRawpunDao(RawpunDao rawpunDao) {
		this.rawpunDao = rawpunDao;
	}

	@Override
	public Rawpun add(Rawpun t) {
		return rawpunDao.add(t);
	}

	@Override
	public Rawpun query(Rawpun t) {
		return rawpunDao.query(t);
	}

	@Override
	public Rawpun update(Rawpun t) {
		return rawpunDao.update(t);
	}

	@Override
	public void delete(Rawpun t) {
		rawpunDao.delete(t);
	}

	@Override
	public Pager<Rawpun> queryAll(Pager<Rawpun> t) {
		return rawpunDao.queryAll(t);
	}

	@Override
	public Object count() {
		return null;
	}

}
