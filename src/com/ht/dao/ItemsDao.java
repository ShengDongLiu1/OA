package com.ht.dao;

import java.util.List;
import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.bean.Items;
import com.ht.bean.Student;
import com.ht.common.Pager;

public interface ItemsDao extends BaseDao<Items,Integer>{
	
	public Pager<Items> queryByName(Pager<Items> tem,String name);
	
	public Pager<Items> queryByClass(Pager<Items> tem,int classid);
	
	public Pager<Items> queryByScore(Pager<Items> tem,int begin,int end);
	
	public Pager<Items> queryAll(Pager<Items> tem,int id);
	
	public List<Dep> queryDep();
	
	public List<Student> student(int c);
	
	public List<Classes> queryClasses();
	
	public int maxvalue();
	
	public Dep queryByDep(Student t);
}
