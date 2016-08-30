package com.ht.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Workcheck;
import com.ht.common.Pager;

public class WorkcheckDaoImpl implements WorkcheckDao {
	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Workcheck add(Workcheck t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Pager<Workcheck> queryAll(Pager<Workcheck> pager) {
		session = sessionFactory.openSession();
		Query query=session.createQuery("from Workcheck");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Workcheck> list=query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query=session.createQuery("select count(t) from Workcheck t");
		Object obj=query.uniqueResult();
		return obj;
	}
	
	@Override
	public Workcheck query(Workcheck t) {
		return t;
	}

	@Override
	public Workcheck update(Workcheck t) {
		return t;
	}

	@Override
	public void delete(Workcheck t) {
	}

}
