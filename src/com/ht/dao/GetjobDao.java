package com.ht.dao;

import java.util.List;

import com.ht.bean.Getjob;
import com.ht.bean.Student;
import com.ht.common.Pager;

public interface GetjobDao extends BaseDao<Getjob, Integer> {
	
	public List<Student> queryStudent();
	
	public Pager<Getjob> queryByTime(Pager<Getjob> pager, String time);
	
	public Object DepTimecount(String time);
}
