package com.ht.service;

import com.ht.bean.Student;
import com.ht.bean.Studentyx;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface StudentService extends BaseDao<Student, Integer> {
	public Pager<Student> queryAllstu(Pager<Student> pager, Integer classid);
	public Object bjcount(Integer classid);
	public Studentyx addyx(Studentyx t);
	public Pager<Studentyx> queryAllyx(Pager<Studentyx> pager);
	public void deleteyx(Studentyx t) ;
}
