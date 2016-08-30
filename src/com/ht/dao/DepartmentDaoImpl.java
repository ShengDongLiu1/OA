package com.ht.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Dep;
import com.ht.bean.Department;
import com.ht.common.Pager;

public class DepartmentDaoImpl implements DepartmentDao{

	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Department add(Department d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		d.setDcreatetime(new java.sql.Timestamp(new Date().getTime()).toString());
		session.save(d);
		transaction.commit();
		session.close();
		return d;
	}
	@Override
	public List<Department> queryDepar(){
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Department");
		@SuppressWarnings("unchecked")
		List<Department> d  = query.list();
		session.close();
		return d;
	}
	
	@Override
	public Department query(Department d) {
		session = sessionFactory.openSession();
		session.get(Department.class, d.getDid());
		session.close();
		return d;
	}

	@Override
	public Department update(Department d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(d);
		transaction.commit();	
		session.close();
		return d;
	}

	@Override
	public Pager<Department> queryAll(Pager<Department> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Department where did != 1");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Department> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Department t");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public void delete(Department d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(d);
		transaction.commit();
		session.close();
	}
	
	@Override
	public List<Dep> depcount(int did){
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query q = session.createSQLQuery("select eid from Dep where mid in(select did from Department where department.did=?)");
		q.setInteger(0, did);
		@SuppressWarnings("unchecked")
		List<Dep> deps = q.list();
		transaction.commit();
		session.close();
		return deps;
	}
	
}
