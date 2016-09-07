package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Department;
import com.ht.bean.Expend;
import com.ht.bean.Pays;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface PaysService extends BaseDao<Pays, Integer> {
	
	public List<Dep> queryDep(String did);

	public void BatchAdd(List<Pays> payList);
	
	public void addexpend(Expend e);

	public Pager<Pays> DateQuery(Pager<Pays> pager, String kssj, String jssj);

	public Pager<Pays> bmQuery(Pager<Pays> pager, String ygxm);

	public List<Department> queryBm();

	public Pager<Pays> NameQuery(Pager<Pays> pager, String ygxm);
	
	public List<Dep> queryDepGz(int eid);
}
