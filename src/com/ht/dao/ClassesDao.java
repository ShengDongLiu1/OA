package com.ht.dao;


import java.util.List;

import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.common.Pager;

public interface ClassesDao extends BaseDao<Classes, Integer> {

	List<Dep> queryDep();

	Object countStu(int id);

	public List<Classes> queryClasses();
	
	public List<Dep> queryDepfd();
	
	public List<Dep> queryDeprk();
	
	public Pager<Classes> queryAllstu(Pager<Classes> pager,String lx);
	
	public Object countlx(String lx);
	
	public Classes updateLx(Classes t);
}
