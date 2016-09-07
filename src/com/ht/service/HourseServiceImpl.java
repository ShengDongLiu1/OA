package com.ht.service;

import java.util.List;

import com.ht.bean.Hourse;
import com.ht.common.Pager;
import com.ht.dao.HourseDao;

public class HourseServiceImpl implements HourseService {
	private HourseDao hourseDao;
	
	public void setHourseDao(HourseDao hourseDao) {
		this.hourseDao = hourseDao;
	}

	@Override
	public Hourse add(Hourse t) {
		return hourseDao.add(t);
	}

	@Override
	public Hourse query(Hourse t) {
		return hourseDao.query(t);
	}

	@Override
	public Hourse update(Hourse t) {
		return hourseDao.update(t);
	}

	@Override
	public void delete(Hourse t) {
		hourseDao.delete(t);
	}

	@Override
	public Pager<Hourse> queryAll(Pager<Hourse> t) {
		return hourseDao.queryAll(t);
	}

	@Override
	public Object count() {
		return null;
	}

	@Override
	public List<Hourse> queryHourse() {
		return hourseDao.queryHourse();
	}

	@Override
	public List<Hourse> queryById(int hourseid) {
		return hourseDao.queryById(hourseid);
	}

}
