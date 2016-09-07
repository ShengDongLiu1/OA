package com.ht.service;

import java.util.List;

import com.ht.bean.Money;
import com.ht.bean.Tuition;
import com.ht.dao.BaseDao;

public interface MoneyService extends BaseDao<Money, Integer> {

	public List<Tuition> queryAllTuition();
	
	public void updateTuition(Tuition t);
}
