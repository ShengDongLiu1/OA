package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Getjob;
import com.ht.bean.Student;
import com.ht.common.Pager;

public class GetjobDaoImpl implements GetjobDao {

	private SessionFactory sessionFactory;

	private Session session;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Getjob add(Getjob t) {
		session = sessionFactory.openSession();
		session.save(t);
		session.close();
		return t;
	}

	@Override
	public Getjob query(Getjob t) {
		session = sessionFactory.openSession();
		session.get(Getjob.class, t.getJobid());
		session.close();
		return t;
	}

	@Override
	public Getjob update(Getjob t) {
		session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(t);
		session.getTransaction().commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Getjob t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Getjob> queryAll(Pager<Getjob> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Getjob");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Getjob> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Getjob t");
		Object obj = q.uniqueResult();
		return obj;
	}
	
	public List<Student> queryStudent() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Student");
		@SuppressWarnings("unchecked")
		List<Student> student= query.list();
		session.close();
		return student;
	}

}
