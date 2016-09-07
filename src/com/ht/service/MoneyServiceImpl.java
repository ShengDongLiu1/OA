package com.ht.service;

import java.util.List;

import com.ht.bean.Money;
import com.ht.bean.Tuition;
import com.ht.common.Pager;
import com.ht.dao.MoneyDao;

public class MoneyServiceImpl implements MoneyService {

	private MoneyDao moneyDao;
	
	public void setMoneyDao(MoneyDao moneyDao) {
		this.moneyDao = moneyDao;
	}

	@Override
	public Money add(Money t) {
		return moneyDao.add(t);
	}

	@Override
	public Money query(Money t) {
		return moneyDao.query(t);
	}

	@Override
	public Money update(Money t) {
		return moneyDao.update(t);
	}

	@Override
	public void delete(Money t) {
		moneyDao.delete(t);
	}

	@Override
	public Pager<Money> queryAll(Pager<Money> pager) {
		return moneyDao.queryAll(pager);
	}

	@Override
	public Object count() {
		return moneyDao.count();
	}

	@Override
	public List<Tuition> queryAllTuition() {
		return moneyDao.queryAllTuition();
	}

	@Override
	public void updateTuition(Tuition t) {
		moneyDao.updateTuition(t);
	}
	

}
