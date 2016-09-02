package com.ht.dao;

import java.util.List;

import com.ht.bean.Classes;
import com.ht.bean.Student;
import com.ht.bean.Studentyx;
import com.ht.common.Pager;

public interface StudentDao extends BaseDao<Student, Integer> {
	public Pager<Student> queryAllstu(Pager<Student> pager, Integer classid);
	public Object bjcount(Integer classid);
	public Studentyx addyx(Studentyx t);
	public Pager<Studentyx> queryAllyx(Pager<Studentyx> pager);
	public Object countyx();
	public void deleteyx(Studentyx t) ;
	public List<Student> queryAllS(Integer classid);
	public List<Classes> queryClass(Integer eid);
}
