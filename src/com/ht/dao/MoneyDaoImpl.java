package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Money;
import com.ht.bean.Tuition;
import com.ht.common.Pager;

public class MoneyDaoImpl implements MoneyDao {

	private SessionFactory sessionFactory;
	private Session session;
	
	public SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Money add(Money t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Money query(Money t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.get(Money.class, t.getMid());
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Money update(Money t) {
		session= sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Money t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Money> queryAll(Pager<Money> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Money order by mid desc");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Money> list = query.list();
		pager.setRows(list);
		pager.setTotal((long)count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(t) from Money t");
		Object obj = query.uniqueResult();
		return obj;
	}

	@Override
	public List<Tuition> queryAllTuition() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Tuition");
		@SuppressWarnings("unchecked")
		List<Tuition> list = query.list();
		session.close();
		return list;
	}

	@Override
	public void updateTuition(Tuition t) {
		session= sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Money> queryOwe(Pager<Money> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Money where owe > 0 order by mid desc");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Money> list = query.list();
		pager.setRows(list);
		pager.setTotal((long)countOwe());
		session.close();
		return pager;
	}
	
	public Object countOwe() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(t) from Money t where owe > 0");
		Object obj = query.uniqueResult();
		return obj;
	}
	
	@Override
	public Pager<Money> queryByTime(Pager<Money> pager,String begin,String end) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Money where mtime between ? and ? order by mid desc");
		query.setString(0,begin);
		query.setString(1,end);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Money> list = query.list();
		pager.setRows(list);
		pager.setTotal((long)countTime(begin,end));
		session.close();
		return pager;
	}

	public Object countTime(String begin,String end) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(t) from Money t where mtime between ? and ? order by mid desc");
		query.setString(0,begin);
		query.setString(1,end);
		Object obj = query.uniqueResult();
		return obj;
	}
	
	@Override
	public Pager<Money> queryByXq(Pager<Money> pager,String xq) {
		System.out.println(xq);
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Money where semester = '"+xq+"' order by mid desc");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Money> list = query.list();
		pager.setRows(list);
		pager.setTotal((long)countXq(xq));
		session.close();
		return pager;
	}

	public Object countXq(String xq) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(t) from Money t where semester = '"+xq+"'");
		Object obj = query.uniqueResult();
		return obj;
	}

	@Override
	public Pager<Money> queryByStuName(Pager<Money> pager,String name) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Money where stuid in (select intenid from Student stu where stu.intenname like '%"+name+"%' ) order by mid desc");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Money> list = query.list();
		pager.setRows(list);
		pager.setTotal((long)countStuName(name));
		session.close();
		return pager;
	}

	public Object countStuName(String name) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(t) from Money t where stuid in (select intenid from Student stu where stu.intenname like '%"+name+"%' )");
		Object obj = query.uniqueResult();
		return obj;
	}

	@Override
	public Pager<Money> queryByDepName(Pager<Money> pager,String name) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Money where eid in (select eid from Dep dep where dep.ename like '%"+name+"%' ) order by mid desc");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Money> list = query.list();
		pager.setRows(list);
		pager.setTotal((long)countDepName(name));
		session.close();
		return pager;
	}

	public Object countDepName(String name) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(t) from Money t where eid in (select eid from Dep dep where dep.ename like '%"+name+"%' )");
		Object obj = query.uniqueResult();
		return obj;
	}
}
