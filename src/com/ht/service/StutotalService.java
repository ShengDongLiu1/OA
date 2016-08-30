package com.ht.service;

import java.util.List;

import com.ht.bean.Student;
import com.ht.bean.Stutotal;
import com.ht.dao.BaseDao;

public interface StutotalService extends BaseDao<Stutotal, Integer> {
	public List<Student> queryStudents();
}
