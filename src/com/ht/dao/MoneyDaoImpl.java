package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Money;
import com.ht.bean.Tuition;
import com.ht.common.Pager;

public class MoneyDaoImpl implements MoneyDao {

	private SessionFactory sessionFactory;
	private Session session;
	
	public SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Money add(Money t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Money query(Money t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.get(Money.class, t.getMid());
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Money update(Money t) {
		session= sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Money t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Money> queryAll(Pager<Money> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Money");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Money> list = query.list();
		pager.setRows(list);
		pager.setTotal((long)count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(t) from Money t");
		Object obj = query.uniqueResult();
		return obj;
	}

	@Override
	public List<Tuition> queryAllTuition() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Tuition");
		@SuppressWarnings("unchecked")
		List<Tuition> list = query.list();
		session.close();
		return list;
	}

	@Override
	public void updateTuition(Tuition t) {
		session= sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(t);
		transaction.commit();
		session.close();
	}

}
