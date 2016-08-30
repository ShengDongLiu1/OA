package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Computer;
import com.ht.bean.Student;
import com.ht.common.Pager;

public class ComputerDaoImpl implements ComputerDao {

	private SessionFactory sessionFactory;
	private Session session;
	
	public SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Computer add(Computer t) {
		session = sessionFactory.openSession();
		session.save(t);
		session.close();
		return t;
	}

	@Override
	public Computer query(Computer t) {
		session = sessionFactory.openSession();
		session.get(Computer.class, t.getComid());
		session.close();
		return t;
	}

	@Override
	public Computer update(Computer t) {
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.saveOrUpdate(t);
		session.getTransaction().commit();
		return t;
	}

	@Override
	public void delete(Computer t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();

	}

	@Override
	public Pager<Computer> queryAll(Pager<Computer> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Computer");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Computer> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(ct) from Computer ct");
		Object obj = query.uniqueResult();
		return obj;
	}

	@Override
	public List<Student> queryStudent() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Student");
		@SuppressWarnings("unchecked")
		List<Student> student= query.list();
		session.close();
		return student;
	}

}
