package com.ht.dao;

import java.util.List;

import com.ht.bean.Apply;
import com.ht.bean.Dep;
import com.ht.bean.Worktype;
import com.ht.common.Pager;

public interface ApplyDao extends BaseDao<Apply, Integer>{

	public List<Dep> queryDep();
	
	public List<Worktype> queryWorktype();
	
	public Apply updateSP(Apply t);
	
	public Pager<Apply> queryByDepName(Pager<Apply> pager, String name);
	
	public Object DepNamecount(String name);
	
	public Pager<Apply> queryByWorktypeName(Pager<Apply> pager, String lname);
	
	public Object WorktypeNamecount(String lname);
	
	public Pager<Apply> queryByAstatus(Pager<Apply> pager, String status);
	
	public Object Astatuscount(String status);
	
}
