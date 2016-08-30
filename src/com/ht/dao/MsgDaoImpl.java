package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import com.ht.bean.Msg;
import com.ht.common.Pager;

@Transactional
public class MsgDaoImpl  implements MsgDao{
	
	private SessionFactory sessionFactory;
	private static Session session;
	
	public SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Msg add(Msg msg) {
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.save(msg);
		session.getTransaction().commit();
		return msg;
	}

	@Override
	public Msg query(Msg t) {
		session = sessionFactory.openSession();
		Msg msg = (Msg) session.get(Msg.class, t.getMsgid());
		session.close();
		return msg;
	}
	
	@Override
	public Msg update(Msg t) {
		session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		return t;
	}
	
	@Override
	public void delete(Msg t) {
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.delete(t);
		session.getTransaction().commit();
	}
	
	@Override
	public Pager<Msg> queryAll(Pager<Msg> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Msg order by msgks desc");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Msg> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}
	
	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(ct) from Msg ct");
		Object obj = query.uniqueResult();
		return obj;
	}
}
