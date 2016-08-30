package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Rawpun;
import com.ht.common.Pager;

public class RawpunDaoImpl implements RawpunDao {
	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Rawpun add(Rawpun t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Rawpun query(Rawpun t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.get(Rawpun.class, t.getJid());
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Rawpun update(Rawpun t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Rawpun t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Rawpun> queryAll(Pager<Rawpun> pager) {
		session=sessionFactory.openSession();
		Query query=session.createQuery("from Rawpun");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Rawpun> list=query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session=sessionFactory.openSession();
		Query query=session.createQuery("select count(t) from Rawpun t");
		Object obj=query.uniqueResult();
		return obj;
	}

}
