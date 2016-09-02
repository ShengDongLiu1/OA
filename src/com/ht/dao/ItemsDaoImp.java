package com.ht.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.bean.Items;
import com.ht.common.Pager;

public class ItemsDaoImp implements ItemsDao{

	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Pager<Items> queryAll(Pager<Items> tem) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Items");
		query.setFirstResult(tem.getBeginIndex());
		query.setMaxResults(tem.getPageSize());
		@SuppressWarnings("unchecked")
		List<Items> list = query.list();
		tem.setRows(list);
		tem.setTotal((long) count());
		session.close();
		return tem;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Items t");
		Object obj = q.uniqueResult();
		return obj;
	}
	
	@Override
	public Items add(Items t) {
		session=sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Items update(Items t) {
		session=sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.update(t);
		transaction.commit();
		return t;
	}

	@Override
	public void delete(Items t) {
		session=sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public List<Dep> queryDep() {
		session=sessionFactory.openSession();
		Query q = session.createQuery("from Dep");
		@SuppressWarnings("unchecked")
		List<Dep> list=q.list();
		session.close();
		return list;
	}


	@Override
	public Pager<Items> queryByName(Pager<Items> tem, String name) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Items where sname=:name");
		query.setString("name", name);
		query.setFirstResult(tem.getBeginIndex());
		query.setMaxResults(tem.getPageSize());
		@SuppressWarnings("unchecked")
		List<Items> list = query.list();
		tem.setRows(list);
		tem.setTotal((long) count());
		session.close();
		return tem;
	}

	@Override
	public Pager<Items> queryByClass(Pager<Items> tem, int classid) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Items where student.classes.classid=:classid");
		query.setInteger("classid", classid);
		query.setFirstResult(tem.getBeginIndex());
		query.setMaxResults(tem.getPageSize());
		@SuppressWarnings("unchecked")
		List<Items> list = query.list();
		tem.setRows(list);
		tem.setTotal((long) count());
		session.close();
		return tem;
	}

	@Override
	public Pager<Items> queryByScore(Pager<Items> tem,int begin,int end) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Items where score between '"+begin+"' and '"+end+"'");
		query.setFirstResult(tem.getBeginIndex());
		query.setMaxResults(tem.getPageSize());
		@SuppressWarnings("unchecked")
		List<Items> list = query.list();
		tem.setRows(list);
		tem.setTotal((long) count());
		session.close();
		return tem;
	}

	@Override
	public Items query(Items t) {
		return t;
	}

	@Override
	public int maxvalue() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select max(intenid) from Student t");
		int obj = (int) q.uniqueResult();
		return obj;
	}

	@Override
	public List<Classes> queryClasses() {
		session=sessionFactory.openSession();
		Query q = session.createQuery("from Classes");
		@SuppressWarnings("unchecked")
		List<Classes> list=q.list();
//		session.close();
		return list;
	}
}
