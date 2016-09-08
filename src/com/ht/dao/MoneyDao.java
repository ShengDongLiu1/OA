package com.ht.dao;

import java.util.List;

import com.ht.bean.Money;
import com.ht.bean.Tuition;
import com.ht.common.Pager;

public interface MoneyDao extends BaseDao<Money, Integer> {
	public List<Tuition> queryAllTuition();
	
	public void updateTuition(Tuition t);
	
	public Pager<Money> queryOwe(Pager<Money> pager);
	
	public Pager<Money> queryByTime(Pager<Money> pager,String begin,String end);

	public Pager<Money> queryByXq(Pager<Money> pager,String xq);
	
	public Pager<Money> queryByDepName(Pager<Money> pager,String name);
	
	public Pager<Money> queryByStuName(Pager<Money> pager,String name);
}
