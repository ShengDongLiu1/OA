package com.ht.dao;

import java.util.List;

import com.ht.bean.Course;
import com.ht.bean.Courseplan;
import com.ht.bean.Dep;
import com.ht.common.Pager;

/**
 * 
 * @author Su
 *
 */
public interface CourseplanDao extends BaseDao<Courseplan,Integer>{
	public List<Course> queryCourse();
	public List<Dep> queryDep();
	public Pager<Courseplan> queryAll(Pager<Courseplan> pager,int uid);
	public Course query(Course c);
}
