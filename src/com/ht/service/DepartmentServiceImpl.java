package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Department;
import com.ht.common.Pager;
import com.ht.dao.DepartmentDao;

public class DepartmentServiceImpl implements DepartmentService{
						
private DepartmentDao departmentDao;
	
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	@Override
	public Department add(Department d) {
		return departmentDao.add(d);
	}

	@Override
	public Department query(Department d) {
		return departmentDao.query(d);
	}

	@Override
	public Department update(Department d) {
		return departmentDao.update(d);
	}

	@Override
	public Pager<Department> queryAll(Pager<Department> d) {
		return departmentDao.queryAll(d);
	}

	@Override
	public Object count() {
		return null;
	}

	@Override
	public void delete(Department d) {
		departmentDao.delete(d);
	}

	@Override
	public List<Dep> depcount(int did) {
		return departmentDao.depcount(did);
	}

	@Override
	public List<Department> queryDepar() {
		return departmentDao.queryDepar();
	}

}
