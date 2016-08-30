package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Department;
import com.ht.dao.BaseDao;

public interface DepartmentService extends BaseDao<Department, Integer> {
	public List<Dep> depcount(int did);
	
	public List<Department> queryDepar();
	
}
