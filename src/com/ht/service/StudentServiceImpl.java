package com.ht.service;

import java.util.List;

import com.ht.bean.Classes;
import com.ht.bean.Student;
import com.ht.bean.Studentyx;
import com.ht.common.Pager;
import com.ht.dao.StudentDao;

public class StudentServiceImpl implements StudentService {

	private StudentDao studentDao;

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	@Override
	public Student add(Student t) {
		return studentDao.add(t);
	}

	@Override
	public Student query(Student t) {
		return studentDao.query(t);
	}

	@Override
	public Student update(Student t) {
		return studentDao.update(t);
	}

	@Override
	public void delete(Student t) {
		studentDao.delete(t);
	}

	@Override
	public Pager<Student> queryAll(Pager<Student> pager) {
		return studentDao.queryAll(pager);
	}

	@Override
	public Object count() {
		return studentDao.count();
	}

	@Override
	public Pager<Student> queryAllstu(Pager<Student> pager, Integer classid) {
		return studentDao.queryAllstu(pager, classid);
	}

	@Override
	public Object bjcount(Integer classid) {
		return studentDao.bjcount(classid);
	}

	@Override
	public Studentyx addyx(Studentyx t) {
		return studentDao.addyx(t);
	}

	@Override
	public Pager<Studentyx> queryAllyx(Pager<Studentyx> pager) {
		return studentDao.queryAllyx(pager);
	}

	@Override
	public void deleteyx(Studentyx t) {
		studentDao.deleteyx(t);
	}

	@Override
	public List<Student> queryAllS(Integer classid) {
		return studentDao.queryAllS(classid);
	}

	@Override
	public List<Classes> queryClass(Integer eid) {
		return studentDao.queryClass(eid);
	}

	@Override
	public void CloseSession() {
		studentDao.CloseSession();
	}

}
