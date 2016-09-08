package com.ht.service;

import java.util.List;

import com.ht.bean.Classes;
import com.ht.bean.Student;
import com.ht.bean.Studentyx;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface StudentService extends BaseDao<Student, Integer> {
	public Pager<Student> queryAllstu(Pager<Student> pager, Integer classid);

	public Object bjcount(Integer classid);

	public Studentyx addyx(Studentyx t);

	public Pager<Studentyx> queryAllyx(Pager<Studentyx> pager);

	public void deleteyx(Studentyx t);

	public List<Student> queryAllS(Integer classid);

	public List<Classes> queryClass(Integer eid);
	
	public void CloseSession();
	
	public Student addStu(Student t);
	
	public Pager<Student> queryAll(Pager<Student> pager, int i);
	
	public Pager<Student> queryClasses(Pager<Student> pager, int id, int i);
	
	public Pager<Student> queryName(Pager<Student> pager,String name, int i);

	public Student updateZ(Student t);
}
