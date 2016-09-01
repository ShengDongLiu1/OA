package com.ht.dao;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Says;

public interface SaysDao extends BaseDao<Says,Integer> {
	
	public List<Dep> querydepname();
}
