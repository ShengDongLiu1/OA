package com.ht.dao;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Dep;
import com.ht.bean.Department;
import com.ht.bean.Expend;
import com.ht.bean.Pays;
import com.ht.bean.User;
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
		Query query = session.createQuery("from Pays order by paysid desc");
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
	public List<Dep> queryDep(String did) {
		session=sessionFactory.openSession();
		Query query = session.createQuery("from Dep where departments.did=:did");
		query.setInteger("did", Integer.valueOf(did));
		@SuppressWarnings("unchecked")
		List<Dep> deps = query.list();
		session.close();
		return deps;
	}
	
	@Override
	public List<Department> queryBm() {
		session=sessionFactory.openSession();
		Query query = session.createQuery("from Department where did != 1");
		@SuppressWarnings("unchecked")
		List<Department> deps = query.list();
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
	public void BatchAdd(List<Pays> payList,String name) {
		 session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
	        try {
	        	double p = 0;
	            for (Pays pays : payList) {
	                session.save(pays);
	                p += pays.getPaysd();
	            }
	            
	            HttpSession session = ServletActionContext.getRequest().getSession();
	    		User user = (User) session.getAttribute("user");
	    		Dep dep = new Dep();
	    		dep.setEname(user.getDep().getEname());
	    		
	    		Expend e = new Expend();
	    		e.setPaypro("给"+name+"发放工资");
	    		e.setPaycount(p);
	    		e.setPtime(new Date());
	    		e.setPayname(dep.getEname());
	    		addexpend(e);
	    		
	            transaction.commit();
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

	@Override
	public Pager<Pays> DateQuery(Pager<Pays> pager, String kssj, String jssj) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Pays where paytime between ? and ? order by paysid desc");
		query.setString(0,kssj);
		query.setString(1,jssj);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Pays> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) DateCount(kssj,jssj));
		session.close();
		return pager;
	}
	
	@Override
	public Object DateCount(String kssj,String jssj) {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Pays t where paytime between ? and ? order by paytime desc");
		q.setString(0,kssj);
		q.setString(1,jssj);
		Object obj = q.uniqueResult();
		return obj;
	}
	
	@Override
	public Pager<Pays> bmQuery(Pager<Pays> pager, String ygxm) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Pays where dep.departments.did=:id order by paytime desc");
		query.setInteger("id",Integer.valueOf(ygxm));
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Pays> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) bmCount(ygxm));
		session.close();
		return pager;
	}
	
	@Override
	public Object bmCount(String ygxm) {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Pays t where dep.departments.did=:id");
		q.setInteger("id",Integer.valueOf(ygxm));
		Object obj = q.uniqueResult();
		return obj;
	}
	
	@Override
	public Pager<Pays> NameQuery(Pager<Pays> pager, String ygxm) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Pays where dep.ename like:name order by paytime desc");
		query.setString("name","%"+ygxm+"%");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Pays> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) NameCount(ygxm));
		session.close();
		return pager;
	}

	@Override
	public Object NameCount(String ygxm) {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Pays t where dep.ename like:name");
		q.setString("name","%"+ygxm+"%");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public List<Dep> queryDepGz(int eid) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Dep where eid = "+eid);
		@SuppressWarnings("unchecked")
		List<Dep> list = query.list();
		session.close();
		return list;
	}
}
