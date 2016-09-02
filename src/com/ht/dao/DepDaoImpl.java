package com.ht.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Dep;
import com.ht.bean.Dstatus;
import com.ht.common.Pager;

public class DepDaoImpl implements DepDao {
	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Dep add(Dep d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		d.setEcreate(new java.sql.Timestamp(new Date().getTime()).toString());
		d.setEtry(new java.sql.Timestamp(new Date().getTime()));
		session.save(d);
		transaction.commit();
		session.close();
		return d;
	}

	@Override
	public Dep update(Dep d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		d.setEcreate(new java.sql.Timestamp(new Date().getTime()).toString());
		d.setEtry(new java.sql.Timestamp(new Date().getTime()));
		session.saveOrUpdate(d);
		transaction.commit();
		session.close();
		return d;
	}

	@Override
	public Dep query(Dep d) {
		session = sessionFactory.openSession();
		session.get(Dep.class, d.getEid());
		session.close();
		return d;
	}

	@Override
	public Pager<Dep> queryAll(Pager<Dep> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Dep order by eid desc");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Dep> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Pager<Dep> queryAlln(Pager<Dep> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Dep t order by eid desc");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Dep> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) countn());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Dep t");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public Object countn() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Dep t ");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public void delete(Dep d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(d);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Dep> queryByName(Pager<Dep> pager, String name) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Dep d where d.ename=?");
		query.setString(0, name);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Dep> list = query.list();
		pager.setRows(list);
		session.close();
		return pager;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Dstatus> queryDstatus() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Dstatus");
		List<Dstatus> dstatus = query.list();
		session.close();
		return dstatus;
	}

	@Override
	public Dep addn(Dep d) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Dep dep = (Dep) session.get(Dep.class, d.getEid());
		dep.setEcreate(new java.sql.Timestamp(new Date().getTime()).toString());
		dep.setEtry(new java.sql.Timestamp(new Date().getTime()));
		dep.setDepartments(d.getDepartments());
		dep.setDstatuss(d.getDstatuss());
		session.update(dep);

		transaction.commit();
		session.close();
		return d;
	}
}
