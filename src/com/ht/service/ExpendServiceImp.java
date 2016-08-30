package com.ht.service;

import com.ht.bean.Expend;
import com.ht.common.Pager;
import com.ht.dao.ExpendDao;

public class ExpendServiceImp implements ExpendService {
	
	private ExpendDao expenddao;

	
	public void setExpenddao(ExpendDao expenddao) {
		this.expenddao = expenddao;
	}

	@Override
	public Expend add(Expend t) {
		return expenddao.add(t);
	}
	
	@Override
	public Expend query(Expend t) {
		return expenddao.query(t);
	}

	@Override
	public Expend update(Expend t) {
		return expenddao.update(t);
	}

	@Override
	public void delete(Expend t) {
		expenddao.delete(t);
	}

	@Override
	public Pager<Expend> queryAll(Pager<Expend> t) {
		return expenddao.queryAll(t);
	}

	@Override
	public Object count() {
		return expenddao.count();
	}

}
