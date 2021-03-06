package com.ht.service;

import java.util.List;

import com.ht.bean.Classes;
import com.ht.bean.Grade;
import com.ht.bean.Student;
import com.ht.common.Pager;
import com.ht.dao.GradeDao;

public class GradeServiceImpl implements GradeService {

    private GradeDao gradeDao;

    public void setGradeDao(GradeDao gradeDao) {
        this.gradeDao = gradeDao;
    }

    @Override
    public Grade add(Grade t) {
        return gradeDao.add(t);
    }

    @Override
    public Grade query(Grade t) {
        return gradeDao.query(t);
    }

    @Override
    public Grade update(Grade t) {
        return gradeDao.update(t);
    }

    @Override
    public void delete(Grade t) {
        gradeDao.delete(t);
    }

    @Override
    public Pager<Grade> queryAll(Pager<Grade> t) {
        return gradeDao.queryAll(t);
    }

    @Override
    public Object count() {
        return null;
    }

    @Override
    public void batchSave(List<Grade> grades) {
        gradeDao.batchSave(grades);
    }

    @Override
    public List<Student> batchQlery(Student student) {
        return gradeDao.batchQlery(student);
    }

	@Override
	public Pager<Grade> queryByName(Pager<Grade> pager,String name) {
		return gradeDao.queryByName(pager, name);
	}

	@Override
	public Pager<Grade> queryByCourse(Pager<Grade> pager, String courseName) {
		return gradeDao.queryByCourse(pager, courseName);
	}

	@Override
	public List<Classes> queryClasses() {
		return gradeDao.queryClasses();
	}

	@Override
	public Pager<Grade> queryByClass(Pager<Grade> pager, int classID) {
		return gradeDao.queryByClass(pager, classID);
	}

}
