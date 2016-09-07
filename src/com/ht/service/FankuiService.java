package com.ht.service;

import com.ht.bean.Fankui;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface FankuiService extends BaseDao<Fankui, Integer> {

	public Pager<Fankui> queryByDepId(Pager<Fankui> pager,int id);
}
