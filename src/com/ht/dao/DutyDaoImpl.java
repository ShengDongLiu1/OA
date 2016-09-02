package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Duty;
import com.ht.common.Pager;

public class DutyDaoImpl implements DutyDao {
	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Duty add(Duty t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Duty query(Duty t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.get(Duty.class, t.getDid());
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Duty update(Duty t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Duty t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Duty> queryAll(Pager<Duty> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Duty");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Duty> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(t) from Duty t");
		Object obj = query.uniqueResult();
		return obj;
	}

}
