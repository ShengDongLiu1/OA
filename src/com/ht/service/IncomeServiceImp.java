package com.ht.service;

import java.util.List;

import com.ht.bean.Income;
import com.ht.bean.Student;
import com.ht.common.Pager;
import com.ht.dao.IncomeDao;

public class IncomeServiceImp implements IncomeService {
	
	private IncomeDao incomedao;

	public void setIncomedao(IncomeDao incomeDao) {
		this.incomedao = incomeDao;
	}

	@Override
	public Income add(Income t) {
		return incomedao.add(t);
	}
	
	@Override
	public Income query(Income t) {
		return incomedao.query(t);
	}

	@Override
	public Income update(Income t) {
		return incomedao.update(t);
	}

	@Override
	public void delete(Income t) {
		incomedao.delete(t);
	}

	@Override
	public Pager<Income> queryAll(Pager<Income> t) {
		return incomedao.queryAll(t);
	}

	@Override
	public Object count() {
		return incomedao.count();
	}

	@Override
	public List<Student> batchQlery(Student student, String id) {
		return incomedao.batchQlery(student,id);
	}

	@Override
	public void batchSave(List<Income> grades) {
		incomedao.batchSave(grades);
	}

}
