package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Receiue;
import com.ht.bean.Work;
import com.ht.common.Pager;
import com.ht.dao.ReceiueDao;

public class ReceiueServiceImpl implements ReceiueService {

	private ReceiueDao receiueDao;
	
	
	public ReceiueDao getReceiueDao() {
		return receiueDao;
	}

	public void setReceiueDao(ReceiueDao receiueDao) {
		this.receiueDao = receiueDao;
	}

	@Override
	public Receiue add(Receiue t) {
		return receiueDao.add(t);
	}

	@Override
	public Receiue query(Receiue t) {
		return receiueDao.query(t);
	}

	@Override
	public Receiue update(Receiue t) {
		return receiueDao.update(t);
	}

	@Override
	public void delete(Receiue t) {
		receiueDao.delete(t);		
	}

	@Override
	public Pager<Receiue> queryAll(Pager<Receiue> pager) {
		return receiueDao.queryAll(pager);
	}

	@Override
	public Object count() {
		return receiueDao.count();
	}
	@Override
	public List<Dep> queryDeps(){
		return receiueDao.queryDeps();
	}
	@Override
	public List<Work> queryWorks(){
		return receiueDao.queryWorks();
	}

	@Override
	public Receiue queryById(int uid) {
		return receiueDao.queryById(uid);
	}

}
