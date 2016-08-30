package com.ht.service;


import java.util.List;

import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.common.Pager;
import com.ht.dao.ClassesDao;

public class ClassesServiceImpl implements ClassesService {
	
	private ClassesDao classesDao;

	public void setClassesDao(ClassesDao classesDao) {
		this.classesDao = classesDao;
	}

	@Override
	public Classes add(Classes t) {
		return classesDao.add(t);
	}
	
	@Override
	public Classes query(Classes t) {
		return classesDao.query(t);
	}

	@Override
	public Classes update(Classes t) {
		return classesDao.update(t);
	}

	@Override
	public void delete(Classes t) {
		System.out.println("Service:"+t.getClassid());
		classesDao.delete(t);
	}

	@Override
	public Pager<Classes> queryAll(Pager<Classes> t) {
		return classesDao.queryAll(t);
	}

	@Override
	public Object count() {
		return classesDao.count();
	}

	@Override
	public List<Dep> queryDep() {
		return classesDao.queryDep();
	}

	@Override
	public List<Classes> queryClasses() {
		return classesDao.queryClasses();
	}

	@Override
	public List<Dep> queryDepfd() {
		return classesDao.queryDepfd();
	}

	@Override
	public List<Dep> queryDeprk() {
		return classesDao.queryDeprk();
	}

	@Override
	public Pager<Classes> queryAllstu(Pager<Classes> pager, String lx) {
		return classesDao.queryAllstu(pager, lx);
	}
}
