package com.ht.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Jobs;
import com.ht.common.Pager;

public class JobsDaoImpl implements JobsDao{

	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Jobs add(Jobs d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(d);
		transaction.commit();
		session.close();
		return d;
	}

	@Override
	public Jobs query(Jobs d) {
		session = sessionFactory.openSession();
		Jobs jobs = (Jobs) session.get(Jobs.class, d.getEid());
		if(jobs.getJedu() != null){
			jobs.setKs(jobs.getJend().toString());
			jobs.setJs(jobs.getJcompany().toString());
		}
		session.close();
		return jobs;
	}
	
	@Override
	public Jobs update(Jobs d) {
		session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(d);
		session.getTransaction().commit();
		session.close();
		return d;
	}

	@Override
	public void delete(Jobs d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(d);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Jobs> queryAll(Pager<Jobs> t) {
		return null;
	}

	@Override
	public Object count() {
		return null;
	}

}
