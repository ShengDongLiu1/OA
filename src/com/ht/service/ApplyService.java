package com.ht.service;

import java.util.List;

import com.ht.bean.Apply;
import com.ht.bean.Dep;
import com.ht.bean.Worktype;
import com.ht.dao.BaseDao;

public interface ApplyService extends BaseDao<Apply, Integer> {

	public List<Dep> queryDep();
	
	public List<Worktype> queryWorktype();
	
	public Apply updateSP(Apply t);
}
