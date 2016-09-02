package com.ht.service;

import java.util.List;
import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.bean.Items;
import com.ht.bean.Student;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface ItemsService extends BaseDao<Items, Integer> {
	
	public Pager<Items> queryByName(Pager<Items> tem,String name);
	public Pager<Items> queryByClass(Pager<Items> tem,int classid);
	public Pager<Items> queryByScore(Pager<Items> tem,int begin,int end);
	
	public List<Dep> queryDep();
	public List<Classes> queryClasses();
	public List<Student> student();
	public int maxvalue();
}
