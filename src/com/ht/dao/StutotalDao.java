package com.ht.dao;

import java.util.List;

import com.ht.bean.Student;
import com.ht.bean.Stutotal;

public interface StutotalDao extends BaseDao<Stutotal,Integer>{
	public List<Student> queryStudents();
	
	
	public Object queryXueqi(int sid , String xueqi);
	
}
