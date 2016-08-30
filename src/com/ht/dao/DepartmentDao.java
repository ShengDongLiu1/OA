package com.ht.dao;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Department;

public interface DepartmentDao extends BaseDao<Department, Integer> {
	public List<Dep> depcount(int did);
	
	public List<Department> queryDepar();
	
}
