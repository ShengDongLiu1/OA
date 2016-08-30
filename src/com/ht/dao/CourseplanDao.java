package com.ht.dao;

import java.util.List;

import com.ht.bean.Course;
import com.ht.bean.Courseplan;
import com.ht.bean.Dep;

/**
 * 
 * @author Su
 *
 */
public interface CourseplanDao extends BaseDao<Courseplan,Integer>{
	public List<Course> queryCourse();
	public List<Dep> queryDep();
	
}
