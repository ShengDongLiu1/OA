package com.ht.service;

import com.ht.common.Pager;

import java.util.List;

import com.ht.bean.Course;
import com.ht.dao.CourseDao;

public class CourseServiceImp implements CourseService{
	
	private CourseDao coursedao;

	public void setCoursedao(CourseDao coursedao) {
		this.coursedao = coursedao;
	}
	@Override
	public Course add(Course t) {
		return coursedao.add(t);
	}

	@Override
	public Course query(Course t) {
		return coursedao.query(t);
	}

	@Override
	public Course update(Course t) {
		return coursedao.update(t);
	}

	@Override
	public void delete(Course t) {
		coursedao.delete(t);
	}

	@Override
	public Pager<Course> queryAll(Pager<Course> t) {
		return coursedao.queryAll(t);
	}

	@Override
	public Object count() {
		return coursedao.count();
	}
	@Override
	public List<Course> queryCourse() {
		return coursedao.queryCourse();
	}
	
	
}
