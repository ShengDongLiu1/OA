package com.ht.service;

import java.util.List;

import com.ht.bean.Getjob;
import com.ht.bean.Student;
import com.ht.common.Pager;
import com.ht.dao.GetjobDao;

public class GetjobServiceImpl implements GetjobService {

	private GetjobDao getjobDao;

	public void setGetjobDao(GetjobDao getjobDao) {
		this.getjobDao = getjobDao;
	}

	@Override
	public Getjob add(Getjob t) {
		return getjobDao.add(t);
	}

	@Override
	public Getjob query(Getjob t) {
		return getjobDao.query(t);
	}
	

	@Override
	public Getjob update(Getjob t) {
		return getjobDao.update(t);
	}

	@Override
	public void delete(Getjob t) {
		getjobDao.delete(t);
	}

	@Override
	public Pager<Getjob> queryAll(Pager<Getjob> pager) {
		return getjobDao.queryAll(pager);
	}

	@Override
	public Object count() {
		return getjobDao.count();
	}

	@Override
	public List<Student> queryStudent() {
		return getjobDao.queryStudent();
	}

	@Override
	public Pager<Getjob> queryByTime(Pager<Getjob> pager, String time) {
		return getjobDao.queryByTime(pager, time);
	}

	@Override
	public Object DepTimecount(String time) {
		return getjobDao.DepTimecount(time);
	}

}
