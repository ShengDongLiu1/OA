package com.ht.service;

import java.util.List;
import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.bean.Items;
import com.ht.bean.Student;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface ItemsService extends BaseDao<Items, Integer> {
	
	public Pager<Items> queryByName(Pager<Items> tem,String name,int id);
	public Pager<Items> queryByClass(Pager<Items> tem,int classid,int id);
	public Pager<Items> queryByScore(Pager<Items> tem,int begin,int end,int id);
	public Pager<Items> queryAll(Pager<Items> t,int id);
	public List<Dep> queryDep();
	public List<Classes> queryClasses();
	public List<Student> student(int c);
	public int maxvalue();
}
