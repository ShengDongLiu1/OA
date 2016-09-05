package com.ht.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Course;
import com.ht.bean.Courseplan;
import com.ht.bean.Dep;
import com.ht.common.Pager;
/**
 * 
 * @author Su
 *
 */
public class CourseplanDaoImp implements CourseplanDao{

	private SessionFactory sessionFactory;
	private Session session;
	

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Pager<Courseplan> queryAll(Pager<Courseplan> pager,int uid) {
		session=sessionFactory.openSession();
		Query query = session.createQuery("from Courseplan where empid=:uid order by kid DESC");
		query.setInteger("uid",uid);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Courseplan> list=query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}
	
	@Override
	public Pager<Courseplan> queryAll(Pager<Courseplan> pager) {
		return pager;
	}
	
	@Override
	public Courseplan add(Courseplan t) {
		session=sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Courseplan query(Courseplan t) {

		return null;
	}

	@Override
	public Courseplan update(Courseplan t) {
		session=sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.update(t);
		transaction.commit();
		return t;
	}

	@Override
	public void delete(Courseplan t) {
		session=sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Courseplan t");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public List<Course> queryCourse() {
		session=sessionFactory.openSession();
		Query q = session.createQuery("from Course");
		@SuppressWarnings("unchecked")
		List<Course> list=q.list();
		session.close();
		return list;
	}

	@Override
	public List<Dep> queryDep() {
		session=sessionFactory.openSession();
		Query q = session.createQuery("from Dep");
		@SuppressWarnings("unchecked")
		List<Dep> list=q.list();
		session.close();
		return list;
	}

}
