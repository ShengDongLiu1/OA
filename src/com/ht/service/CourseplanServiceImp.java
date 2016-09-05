package com.ht.service;

import java.util.List;

import com.ht.bean.Course;
import com.ht.bean.Courseplan;
import com.ht.bean.Dep;
import com.ht.common.Pager;
import com.ht.dao.CourseplanDao;
/**
 * 
 * @author Su
 *
 */
public class CourseplanServiceImp implements CourseplanService{

	private CourseplanDao courseplandao;
	
	
	public void setCourseplandao(CourseplanDao courseplandao) {
		this.courseplandao = courseplandao;
	}

	@Override
	public Courseplan add(Courseplan t) {
		return courseplandao.add(t);
	}

	@Override
	public Courseplan query(Courseplan t) {
		return courseplandao.query(t);
	}

	@Override
	public Courseplan update(Courseplan t) {
		return courseplandao.update(t);
	}

	@Override
	public void delete(Courseplan t) {
		courseplandao.delete(t);
	}

	@Override
	public Pager<Courseplan> queryAll(Pager<Courseplan> pager) {
		return courseplandao.queryAll(pager);
	}

	@Override
	public Object count() {
		return courseplandao.count();
	}

	@Override
	public List<Course> queryCourse() {
		return courseplandao.queryCourse();
	}

	@Override
	public List<Dep> queryDep() {
		return courseplandao.queryDep();
	}

	@Override
	public Pager<Courseplan> queryAll(Pager<Courseplan> pager, int uid) {
		return courseplandao.queryAll(pager,uid);
	}

}
