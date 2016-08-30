package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Student;
import com.ht.bean.Stutotal;
import com.ht.common.Pager;

public class StutotalDaoImpl implements StutotalDao{

	private SessionFactory sessionFactory;
	private Session session;
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Stutotal add(Stutotal t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Stutotal query(Stutotal t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.get(Stutotal.class, t.getSid());
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Stutotal update(Stutotal t) {
		session= sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Stutotal t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Stutotal> queryAll(Pager<Stutotal> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Stutotal");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Stutotal> list = query.list();
		pager.setRows(list);
		pager.setTotal((long)count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(t) from Stutotal t");
		Object obj = query.uniqueResult();
		return obj;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> queryStudents() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Student");
		List<Student> stu= query.list();
		session.close();
		return stu;
	}

}
