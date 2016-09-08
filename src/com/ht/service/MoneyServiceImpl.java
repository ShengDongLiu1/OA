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

	@Override
	public Pager<Money> queryOwe(Pager<Money> pager) {
		return moneyDao.queryOwe(pager);
	}

	@Override
	public Pager<Money> queryByTime(Pager<Money> pager, String begin, String end) {
		return moneyDao.queryByTime(pager, begin, end);
	}

	@Override
	public Pager<Money> queryByXq(Pager<Money> pager, String xq) {
		return moneyDao.queryByXq(pager, xq);
	}

	@Override
	public Pager<Money> queryByDepName(Pager<Money> pager, String name) {
		return moneyDao.queryByDepName(pager, name);
	}

	@Override
	public Pager<Money> queryByStuName(Pager<Money> pager, String name) {
		return moneyDao.queryByStuName(pager, name);
	}
	

}
