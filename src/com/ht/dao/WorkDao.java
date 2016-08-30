package com.ht.dao;

import java.util.List;

import com.ht.bean.Work;
import com.ht.bean.Worktype;

public interface WorkDao extends BaseDao<Work, Integer> {
	
	public void deleteByType(int typeid);
	
	public List<Worktype> queryWorktype();
	
	public Work queryById(int wid);
}
