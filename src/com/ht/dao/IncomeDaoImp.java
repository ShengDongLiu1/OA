package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Computer;
import com.ht.bean.Income;
import com.ht.bean.Student;
import com.ht.common.Pager;

public class IncomeDaoImp implements IncomeDao {

	private SessionFactory sessionFactory;
	private Session session;
	
	public SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Pager<Income> queryAll(Pager<Income> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Income");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Income> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}
	
	@Override
	public Income add(Income t) {
		session = sessionFactory.openSession();
		session.save(t);
		session.close();
		return t;
	}

	@Override
	public Income query(Income t) {
		session = sessionFactory.openSession();
		session.get(Computer.class, t.getMonid());
		session.close();
		return t;
	}

	@Override
	public Income update(Income t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Income t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(ct) from Income ct");
		Object obj = query.uniqueResult();
		return obj;
	}


	@Override
	public void batchSave(List<Income> grades) {
		session = sessionFactory.openSession();
		try {
			for (Income grade : grades) {
				session.save(grade);
			}
		} catch (Exception e) {
		} finally {
			session.close();
		}
	}

	@Override
	public List<Student> batchQlery(Student student, String id) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Student where classid = "+id);
		@SuppressWarnings("unchecked")
		List<Student> list = query.list();
		session.close();
		return list;
	}
}
