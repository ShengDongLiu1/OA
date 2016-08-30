package com.ht.dao;

import java.util.List;

import com.ht.bean.Apply;
import com.ht.bean.Dep;
import com.ht.bean.Worktype;

public interface ApplyDao extends BaseDao<Apply, Integer>{

	public List<Dep> queryDep();
	
	public List<Worktype> queryWorktype();
	
	public Apply updateSP(Apply t);
}
