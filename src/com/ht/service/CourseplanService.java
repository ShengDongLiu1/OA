package com.ht.service;

import java.util.List;

import com.ht.bean.Course;
import com.ht.bean.Courseplan;
import com.ht.bean.Dep;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface CourseplanService extends BaseDao<Courseplan,Integer>{
	public List<Course> queryCourse();
	public List<Dep> queryDep();
	public Pager<Courseplan> queryAll(Pager<Courseplan> pager,int uid);
	public Course query(Course c);
}
