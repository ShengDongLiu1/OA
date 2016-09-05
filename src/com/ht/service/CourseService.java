package com.ht.service;

import java.util.List;

import com.ht.bean.Course;
import com.ht.dao.BaseDao;

public interface CourseService extends BaseDao<Course,Integer>{
	
	public List<Course> queryCourse();
	
}
