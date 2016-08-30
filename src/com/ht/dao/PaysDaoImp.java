package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Dep;
import com.ht.bean.Expend;
import com.ht.bean.Pays;
import com.ht.common.Pager;

public class PaysDaoImp implements PaysDao{

	private SessionFactory sessionFactory;
	private Session session;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Pager<Pays> queryAll(Pager<Pays> tem) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Pays");
		query.setFirstResult(tem.getBeginIndex());
		query.setMaxResults(tem.getPageSize());
		@SuppressWarnings("unchecked")
		List<Pays> list = query.list();
		tem.setRows(list);
		tem.setTotal((long) count());
		session.close();
		return tem;
		
	}

	@Override
	public Pays add(Pays t) {
		session=sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Pays query(Pays t) {
		session=sessionFactory.openSession();
		session.beginTransaction();
		Pays tem=new Pays();
		session.getTransaction().commit();
		return tem;
	}
	
	@Override
	public List<Dep> queryDep() {
		session=sessionFactory.openSession();
		Query query = session.createQuery("from Dep where eid != 1");
		@SuppressWarnings("unchecked")
		List<Dep> deps = query.list();
		session.close();
		return deps;
	}
	
	@Override
	public Pays update(Pays t) {
		session=sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Object obj = session.get(Pays.class, t.getPaysid());
		if(obj != null){
			Pays p = (Pays)obj;
			p.setPaysa(t.getPaysa());
			p.setPaysb(t.getPaysb());
			p.setPaysc(t.getPaysc());
			p.setPaysd(t.getPaysd());
			p.setPayspro(t.getPayspro());
			p.setPayssta(t.getPayssta());
			session.update(p);
		}
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Pays t) {
		session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		t = (Pays) session.get(Pays.class, t.getPaysid());
		session.delete(t);
		session.getTransaction().commit();
	}


	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Pays t");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public void BatchAdd(List<Pays> payList) {
		 session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
	        try {
	        	double p = 0;
	            for (Pays pays : payList) {
	                session.save(pays);
	                p += pays.getPaysd();
	            }
	            transaction.commit();
	            Expend e = new Expend();
	    		e.setPaypro("发放工资");
	    		e.setPaycount(p);
	    		addexpend(e);
	        } catch (Exception e) {
	            transaction.rollback();
	        } finally {
	        }
	}
	
	@Override
	public void addexpend(Expend e){
		session = sessionFactory.openSession();
		 Transaction transaction = session.beginTransaction();
		 session.save(e);
		 transaction.commit();
		 session.close();
	}
}
