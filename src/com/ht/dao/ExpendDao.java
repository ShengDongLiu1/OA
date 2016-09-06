package com.ht.dao;

import com.ht.bean.Expend;
import com.ht.common.Pager;

public interface ExpendDao extends BaseDao<Expend, Integer> {
	public Pager<Expend> queryByTime(Pager<Expend> pager,String begin,String end);
	public Pager<Expend> queryByName(Pager<Expend> pager,String name);
}
