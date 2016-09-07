package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Dstatus;
import com.ht.bean.User;
import com.ht.common.Pager;
import com.ht.dao.DepDao;

public class DepServiceImpl implements DepService{
	
	private DepDao depDao;
	
	public void setDepDao(DepDao depDao) {
		this.depDao = depDao;
	}

	@Override
	public Dep add(Dep d) {
		return depDao.add(d);
	}

	@Override
	public Dep query(Dep d) {
		return depDao.query(d);
	}

	@Override
	public Dep update(Dep d) {
		return depDao.update(d);
	}

	@Override
	public Pager<Dep> queryAll(Pager<Dep> d) {
		return depDao.queryAll(d);
	}

	@Override
	public Object count() {
		return null;
	}

	@Override
	public void delete(Dep d) {
		depDao.delete(d);
	}

	@Override
	public Pager<Dep> queryByName(Pager<Dep> pager,String name) {
		return depDao.queryByName(pager, name);
	}

	@Override
	public List<Dstatus> queryDstatus() {
		return depDao.queryDstatus();
	}

	@Override
	public Pager<Dep> queryAlln(Pager<Dep> pager) {
		return depDao.queryAlln(pager);
	}

	@Override
	public Dep addn(Dep d) {
		return depDao.addn(d);
	}

	@Override
	public void addUser(User user) {
		depDao.addUser(user);
	}

	@Override
	public Pager<Dep> bmQuery(Pager<Dep> pager, String czbmyg) {
		return depDao.bmQuery(pager,czbmyg);
	}

	@Override
	public Pager<Dep> NameQuery(Pager<Dep> pager, String czygxm) {
		return depDao.NameQuery(pager,czygxm);
	}

}
