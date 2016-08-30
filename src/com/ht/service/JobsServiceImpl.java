package com.ht.service;

import com.ht.bean.Jobs;
import com.ht.common.Pager;
import com.ht.dao.JobsDao;

public class JobsServiceImpl implements JobsService{
						
	private JobsDao jobsDao;
	
	public void setJobsDao(JobsDao jobsDao) {
		this.jobsDao = jobsDao;
	}

	@Override
	public Jobs add(Jobs d) {
		return jobsDao.add(d);
	}

	@Override
	public Jobs query(Jobs d) {
		return jobsDao.query(d);
	}

	@Override
	public Jobs update(Jobs d) {
		return jobsDao.update(d);
	}

	@Override
	public Pager<Jobs> queryAll(Pager<Jobs> d) {
		return null;
	}

	@Override
	public Object count() {
		return null;
	}

	@Override
	public void delete(Jobs d) {
		jobsDao.delete(d);
	}
}
