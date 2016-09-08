package com.ht.service;

import java.util.List;

import com.ht.bean.Apply;
import com.ht.bean.Dep;
import com.ht.bean.Worktype;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface ApplyService extends BaseDao<Apply, Integer> {

	public List<Dep> queryDep();
	
	public List<Worktype> queryWorktype();
	
	public Apply updateSP(Apply t);
	
	public Pager<Apply> queryByDepName(Pager<Apply> pager, String name);
	
	public Pager<Apply> queryByWorktypeName(Pager<Apply> pager, String lname);
	
	public Pager<Apply> queryByTime(Pager<Apply> pager, String time);
	
	public Pager<Apply> queryByAstatus(Pager<Apply> pager, String status);

	public Pager<Apply> queryAllG(Pager<Apply> pager);
}
