package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Expend;
import com.ht.bean.Pays;
import com.ht.dao.BaseDao;

public interface PaysService extends BaseDao<Pays, Integer> {
	
	public List<Dep> queryDep();

	public void BatchAdd(List<Pays> payList);
	
	public void addexpend(Expend e);
}
