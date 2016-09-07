package com.ht.dao;

import com.ht.bean.Fankui;
import com.ht.common.Pager;

public interface FankuiDao extends BaseDao<Fankui, Integer> {
	
	public Pager<Fankui> queryByDepId(Pager<Fankui> pager,int id);
	
	public Object countByDepId(int id);
}
