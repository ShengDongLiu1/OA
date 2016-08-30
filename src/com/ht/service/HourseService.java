package com.ht.service;

import java.util.List;

import com.ht.bean.Hourse;
import com.ht.dao.BaseDao;

public interface HourseService extends BaseDao<Hourse, Integer> {
	public List<Hourse> queryHourse();
}
