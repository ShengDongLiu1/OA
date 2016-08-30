package com.ht.dao;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Expend;
import com.ht.bean.Pays;

public interface PaysDao extends BaseDao<Pays,Integer>{
	
	public List<Dep> queryDep();

	public void BatchAdd(List<Pays> payList);
	
	public void addexpend(Expend e);
}
