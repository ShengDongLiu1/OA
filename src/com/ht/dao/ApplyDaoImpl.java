package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Apply;
import com.ht.bean.Dep;
import com.ht.bean.Worktype;
import com.ht.common.Pager;

public class ApplyDaoImpl implements ApplyDao{
	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Apply add(Apply t) {
		session=sessionFactory.openSession();
		session.save(t);
		session.close();
		return t;
	}

	@Override
	public Apply query(Apply t) {
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.get(Apply.class, t.getAid());
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Apply update(Apply t) {
		session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(t);
		session.getTransaction().commit();
		session.close();
		return t;
	}

	@Override
	public Apply updateSP(Apply t) {
		session = sessionFactory.openSession();
		session.beginTransaction();
		Apply a = (Apply)session.get(Apply.class, t.getAid());
		a.setAstatus("已购买");
		session.update(a);
		session.getTransaction().commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Apply t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Apply> queryAll(Pager<Apply> pager) {
		session=sessionFactory.openSession();
		Query query=session.createQuery("from Apply");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Apply> list=query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session=sessionFactory.openSession();
		Query query=session.createQuery("select count(t) from Apply t");
		Object obj=query.uniqueResult();
		return obj;
	}
	
	public List<Dep> queryDep() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Dep where eid != 1");
		@SuppressWarnings("unchecked")
		List<Dep> dep = query.list();
		return dep;
	}
	
	public List<Worktype> queryWorktype() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Worktype");
		@SuppressWarnings("unchecked")
		List<Worktype> worktype= query.list();
		session.close();
		return worktype;
	}

}
