package com.ht.service;

import java.util.List;

import com.ht.bean.Work;
import com.ht.bean.Worktype;
import com.ht.dao.BaseDao;

public interface WorkService extends BaseDao<Work, Integer> {
	
	public void deleteByType(int typeid);
	
	public List<Worktype> queryWorktype();
	
	public Work queryById(int wid);
	
	public String deleteW(Work t);
}
