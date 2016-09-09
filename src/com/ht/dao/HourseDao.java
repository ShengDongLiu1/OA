package com.ht.dao;

import java.util.List;

import com.ht.bean.Hourse;

public interface HourseDao extends BaseDao<Hourse, Integer> {
	public List<Hourse> queryHourse();
	
	
	public List<Hourse> queryById(int hourseid);
	
	public Object countStuH(int id);
}
