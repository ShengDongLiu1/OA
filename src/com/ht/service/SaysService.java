package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Says;
import com.ht.dao.BaseDao;

public interface SaysService extends BaseDao<Says, Integer> {
	public List<Dep> querydepname();
}
