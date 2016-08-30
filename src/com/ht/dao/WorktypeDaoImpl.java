package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Worktype;
import com.ht.common.Pager;

public class WorktypeDaoImpl implements WorktypeDao {
	
	private SessionFactory sessionFactory;
	private Session session;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Worktype add(Worktype t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Worktype query(Worktype t) {
		session = sessionFactory.openSession();
		session.get(Worktype.class, t.getSwid());
		session.close();
		return t;
	}

	@Override
	public Worktype update(Worktype t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Object obj = session.get(Worktype.class, t.getSwid());
		if(obj != null){
			Worktype wt = (Worktype)obj;
			wt.setSwname(t.getSwname());
			session.update(wt);
		}
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Worktype t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Object obj = session.get(Worktype.class, t.getSwid());
		if(obj != null){
			Worktype wt = (Worktype)obj;
			wt.setSwid(t.getSwid());
			session.delete(wt);
		}
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Worktype> queryAll(Pager<Worktype> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Worktype");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Worktype> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(wt) from Worktype wt");
		Object obj = query.uniqueResult();
		return obj;
	}

}
