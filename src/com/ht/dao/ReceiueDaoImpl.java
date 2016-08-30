package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Dep;
import com.ht.bean.Receiue;
import com.ht.bean.Work;
import com.ht.common.Pager;

public class ReceiueDaoImpl implements ReceiueDao{

	private Session session;
	private SessionFactory sessionFactory;
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Receiue add(Receiue d) {
		session = sessionFactory.openSession();
		session.save(d);
		session.close();
		return d;
	}


	@Override
	public Receiue update(Receiue d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(d);
		transaction.commit();
		session.close();
		return d;
	}
	
	@Override
	public Receiue query(Receiue d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		d = (Receiue)session.get(Receiue.class, d.getUid());
		transaction.commit();
		session.close();
		return d;
	}
	
	
	@Override
	public Pager<Receiue> queryAll(Pager<Receiue> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Receiue");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Receiue> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Receiue t");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public void delete(Receiue d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(d);
		transaction.commit();
		session.close();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Dep> queryDeps() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Dep");
		List<Dep> deps= query.list();
		return deps;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Work> queryWorks() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Work");
		List<Work> work= query.list();
		session.close();
		return work;
	}
}
