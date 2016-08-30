package com.ht.service;


import java.util.List;

import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface ClassesService extends BaseDao<Classes, Integer> {

	List<Dep> queryDep();

	public List<Classes> queryClasses();
	
	public List<Dep> queryDepfd();
	
	public List<Dep> queryDeprk();
	
	public Pager<Classes> queryAllstu(Pager<Classes> pager,String lx);
}
