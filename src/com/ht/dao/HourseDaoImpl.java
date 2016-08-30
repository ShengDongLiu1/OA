package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Hourse;
import com.ht.common.Pager;

public class HourseDaoImpl implements HourseDao{
	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Hourse add(Hourse t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		System.out.println(t.getHourname());
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Hourse query(Hourse t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.get(Hourse.class, t.getHourid());
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Hourse update(Hourse t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Hourse t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Hourse> queryAll(Pager<Hourse> pager) {
		session=sessionFactory.openSession();
		Query query=session.createQuery("from Hourse");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Hourse> list=query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session=sessionFactory.openSession();
		Query query=session.createQuery("select count(t) from Hourse t");
		Object obj=query.uniqueResult();
		return obj;
	}

	@Override
	public List<Hourse> queryHourse() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Hourse");
		@SuppressWarnings("unchecked")
		List<Hourse> d  = query.list();
		session.close();
		return d;
	}

}
