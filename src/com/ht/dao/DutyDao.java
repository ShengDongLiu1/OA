package com.ht.dao;

import java.util.List;

import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.bean.Duty;
import com.ht.bean.Hourse;

public interface DutyDao extends BaseDao<Duty, Integer>{
	public List<Dep> queryDepname();
	
	public List<Hourse> queryHourse();
	
	public List<Classes> queryClasses();
}
