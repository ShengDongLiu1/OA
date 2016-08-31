package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Receiue;
import com.ht.bean.Work;
import com.ht.dao.BaseDao;

public interface ReceiueService extends BaseDao<Receiue, Integer>{
	public List<Dep> queryDeps();
	
	public List<Work> queryWorks();
	
	public Receiue queryById(int uid);
}
