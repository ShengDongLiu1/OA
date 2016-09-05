package com.ht.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.ht.bean.Course;
import com.ht.common.Pager;

public class CourseDaoImp implements CourseDao{

	private SessionFactory sessionFactory;
	private Session session;
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Course update(Course t) {
		session=sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}
	
	@Override
	public Pager<Course> queryAll(Pager<Course> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Course");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Course> list=query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	};

	
	@Override
	public Course add(Course t) {
		session=sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		if(t.getSemester()>0 && t.getSemester()<=4){
			session.save(t);
			transaction.commit();
			session.close();
			return t;
		}
		session.close();
		return null;
	}

	@Override
	public Course query(Course t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Course t) {
		session=sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	
	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query=session.createQuery("select count(t) from Course t");
		Object obj=query.uniqueResult();
		return obj;
	}

	@Override
	public List<Course> queryCourse() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Course");
		@SuppressWarnings("unchecked")
		List<Course> courses = query.list();
		session.close();
		return courses;
	}

}
