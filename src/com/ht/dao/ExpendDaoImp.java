package com.ht.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.ht.bean.Expend;
import com.ht.common.Pager;

public class ExpendDaoImp implements ExpendDao {

	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Pager<Expend> queryAll(Pager<Expend> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Expend");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Expend> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Expend add(Expend t) {
		session = sessionFactory.openSession();
		session.save(t);
		session.close();
		return t;
	}

	@Override
	public Expend query(Expend t) {
		session = sessionFactory.openSession();
		session.get(Expend.class, t.getPayid());
		session.close();
		return t;
	}

	@Override
	public Expend update(Expend t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Expend t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(t) from Expend t");
		Object obj = query.uniqueResult();
		return obj;
	}

}
