package com.ht.dao;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Fankui;
import com.ht.common.Pager;

public class FankuiDaoImpl implements FankuiDao{

	private SessionFactory sessionFactory;
	private static Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Fankui add(Fankui d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		d.setTime(Calendar.getInstance().getTime());
		session.save(d);
		transaction.commit();
		session.close();
		return d;
	}

	@Override
	public Fankui query(Fankui d) {
		session = sessionFactory.openSession();
		d=(Fankui) session.get(Fankui.class, d.getTbackid());
		session.close();
		return d;
	}

	@Override
	public Fankui update(Fankui d) {
		session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(d);
		transaction.commit();
		session.close();
		return d;
	}

	@Override
	public Pager<Fankui> queryAll(Pager<Fankui> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Fankui order by time desc");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Fankui> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	public static void closeSession(){
		session.close();
	}
	
	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Fankui t");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public void delete(Fankui d) {
		session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.delete(d);
		transaction.commit();
		session.close();
	}
}
