package com.ht.service;

import java.util.List;

import com.ht.bean.Income;
import com.ht.bean.Student;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface IncomeService extends BaseDao<Income, Integer> {
	public List<Student> batchQlery(Student student, String id);
	
	public void batchSave(List<Income> grades);
	public Pager<Income> queryByTime(Pager<Income> pager,String begin,String end);
	public Pager<Income> queryByName(Pager<Income> pager,String name);
}
