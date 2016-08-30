package com.ht.dao;

import java.util.List;

import com.ht.bean.Income;
import com.ht.bean.Student;

public interface IncomeDao extends BaseDao<Income, Integer> {
	public List<Student> batchQlery(Student student, String id);
	
	public void batchSave(List<Income> grades);
}
