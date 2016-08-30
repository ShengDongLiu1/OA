package com.ht.dao;

import java.util.List;

import com.ht.bean.Computer;
import com.ht.bean.Student;

public interface ComputerDao extends BaseDao<Computer, Integer> {
	public List<Student> queryStudent();
}
