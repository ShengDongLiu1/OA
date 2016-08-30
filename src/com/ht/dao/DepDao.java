package com.ht.dao;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Dstatus;
import com.ht.common.Pager;

public interface DepDao  extends BaseDao<Dep, Integer> {

	public Pager<Dep> queryByName(Pager<Dep> pager,String name);
	
	public List<Dstatus> queryDstatus();
	
	public Object countn();
	
	public Pager<Dep> queryAlln(Pager<Dep> pager);
	
	public Dep addn(Dep d);
}
