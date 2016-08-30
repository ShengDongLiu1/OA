package com.ht.service;

import java.util.List;

import com.ht.bean.Computer;
import com.ht.bean.Student;
import com.ht.dao.BaseDao;

public interface ComputerService extends BaseDao<Computer, Integer> {
	public List<Student> queryStudent();
}
