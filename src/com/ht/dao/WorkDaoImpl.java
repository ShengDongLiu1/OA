package com.ht.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Work;
import com.ht.bean.Worktype;
import com.ht.common.Pager;

public class WorkDaoImpl implements WorkDao {

	private SessionFactory sessionFactory;
	private Session session;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Pager<Work> queryAll(Pager<Work> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Work");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Work> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}
	
	@Override
	public Work add(Work t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Work query(Work t) {
		session = sessionFactory.openSession();
		t = (Work)session.get(Work.class, t.getWid());
		session.close();
		return t;
	}

	@Override
	public Work update(Work t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Work t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}


	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(wt) from Work wt");
		Object obj = query.uniqueResult();
		return obj;
	}

	@Override
	public void deleteByType(int typeid) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query query = session.createQuery("delete from Work where wtypeid='"+typeid+"'");
		query.uniqueResult();
		transaction.commit();
		session.close();
	}
	
	@Override
	public List<Worktype> queryWorktype() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Worktype");
		@SuppressWarnings("unchecked")
		List<Worktype> worktype= query.list();
		session.close();
		return worktype;
	}
	
	@Override
	public Work queryById(int wid){
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query query = session.createQuery("from Work where wid=?");
		query.setInteger(0, wid);
		Work work = (Work)query.uniqueResult();
		transaction.commit();
		session.close();
		return work;
	}

}
