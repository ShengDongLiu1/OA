package com.ht.dao;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Receiue;
import com.ht.bean.Work;

public interface ReceiueDao extends BaseDao<Receiue, Integer>{
	
	public List<Dep> queryDeps();
	
	public List<Work> queryWorks();
}
