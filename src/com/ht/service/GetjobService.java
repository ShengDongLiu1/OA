package com.ht.service;

import java.util.List;

import com.ht.bean.Getjob;
import com.ht.bean.Student;
import com.ht.dao.BaseDao;

public interface GetjobService extends BaseDao<Getjob, Integer> {
	public List<Student> queryStudent();
}
