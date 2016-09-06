package com.ht.service;

import com.ht.bean.Expend;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface ExpendService extends BaseDao<Expend, Integer> {
	public Pager<Expend> queryByTime(Pager<Expend> pager,String begin,String end);
	public Pager<Expend> queryByName(Pager<Expend> pager,String name);
}
