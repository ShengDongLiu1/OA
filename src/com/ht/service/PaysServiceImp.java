package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Department;
import com.ht.bean.Expend;
import com.ht.bean.Pays;
import com.ht.common.Pager;
import com.ht.dao.PaysDao;

public class PaysServiceImp implements PaysService {
	
	private PaysDao paysdao;
	
	public void setPaysDao(PaysDao paysdao) {
		this.paysdao = paysdao;
	}

	@Override
	public Pays add(Pays t) {
		return paysdao.add(t);
	}

	@Override
	public Pays query(Pays t) {
		return paysdao.query(t);
	}

	@Override
	public Pays update(Pays t) {
		return paysdao.update(t);
	}

	@Override
	public void delete(Pays t) {
		paysdao.delete(t);
	}

	@Override
	public Pager<Pays> queryAll(Pager<Pays> t) {
		return paysdao.queryAll(t);
	}

	@Override
	public Object count() {
		return paysdao.count();
	}

	@Override
	public List<Dep> queryDep(String did) {
		return paysdao.queryDep(did);
	}

	@Override
	public void BatchAdd(List<Pays> payList,String name) {
		paysdao.BatchAdd(payList,name);
	}

	@Override
	public void addexpend(Expend e) {
		paysdao.addexpend(e);
	}

	@Override
	public Pager<Pays> DateQuery(Pager<Pays> pager, String kssj, String jssj) {
		return paysdao.DateQuery(pager,kssj,jssj);
	}

	@Override
	public Pager<Pays> bmQuery(Pager<Pays> pager, String ygxm) {
		return paysdao.bmQuery(pager,ygxm);
	}

	@Override
	public List<Department> queryBm() {
		return paysdao.queryBm();
	}

	@Override
	public Pager<Pays> NameQuery(Pager<Pays> pager, String ygxm) {
		return paysdao.NameQuery(pager,ygxm);
	}

	@Override
	public List<Dep> queryDepGz(int eid) {
		return paysdao.queryDepGz(eid);
	}
}
