package com.ht.service;

import com.ht.bean.Fankui;
import com.ht.common.Pager;
import com.ht.dao.FankuiDao;

public class FankuiServiceImpl implements FankuiService{
						
	private FankuiDao fankuiDao;
	
	public void setFankuiDao(FankuiDao fankuiDao) {
		this.fankuiDao = fankuiDao;
	}

	@Override
	public Fankui add(Fankui d) {
		System.out.println("Service"+d.getPro());
		return fankuiDao.add(d);
	}

	@Override
	public Fankui query(Fankui d) {
		return fankuiDao.query(d);
	}

	@Override
	public Fankui update(Fankui d) {
		return fankuiDao.update(d);
	}

	@Override
	public Pager<Fankui> queryAll(Pager<Fankui> d) {
		return fankuiDao.queryAll(d);
	}

	@Override
	public Object count() {
		return null;
	}

	@Override
	public void delete(Fankui d) {
		fankuiDao.delete(d);
	}

	@Override
	public Pager<Fankui> queryByDepId(Pager<Fankui> pager, int id) {
		return fankuiDao.queryByDepId(pager, id);
	}
}
