package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Says;
import com.ht.common.Pager;

public class SaysDaoImpl implements SaysDao{
	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Says add(Says t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Says query(Says t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.get(Says.class, t.getSayid());
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Says update(Says t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Says t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Says> queryAll(Pager<Says> pager) {
		session=sessionFactory.openSession();
		Query query=session.createQuery("from Says");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Says> list=query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session=sessionFactory.openSession();
		Query query=session.createQuery("select count(t) from Says t");
		Object obj=query.uniqueResult();
		return obj;
	}

}
