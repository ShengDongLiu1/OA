package com.ht.service;

import java.util.List;

import com.ht.bean.Course;
import com.ht.bean.Dep;
import com.ht.bean.Items;
import com.ht.bean.Student;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface ItemsService extends BaseDao<Items, Integer> {
	
	public Pager<Items> queryByName(Pager<Items> tem,String name);
	public Pager<Items> queryByClass(Pager<Items> tem,String name);
	public Pager<Items> queryByScore(Pager<Items> tem);
	public List<Student> queryStudent();
	public List<Course> queryCourse();
	public List<Dep> queryDep();
}
