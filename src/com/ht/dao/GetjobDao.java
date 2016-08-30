package com.ht.dao;

import java.util.List;

import com.ht.bean.Getjob;
import com.ht.bean.Student;

public interface GetjobDao extends BaseDao<Getjob, Integer> {
	public List<Student> queryStudent();
}
