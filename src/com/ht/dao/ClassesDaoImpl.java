package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.common.Pager;

public class ClassesDaoImpl implements ClassesDao {

	private SessionFactory sessionFactory;
	private static Session session;
	
	public SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Classes add(Classes t) {
		session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(t);
		session.getTransaction().commit();
		session.close();
		return t;
	}

	@Override
	public Classes query(Classes t) {
		session = sessionFactory.openSession();
		Classes classes = (Classes) session.get(Classes.class, t.getClassid());
		System.out.println(classes.getEmpteachs());
		session.close();
		return classes;
	}

	@Override
	public Classes update(Classes t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
			session.update(t);
		transaction.commit();
		session.close();
		return t;
	}
	

	@Override
	public Classes updateLx(Classes t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Object obj = session.get(Classes.class, t.getClassid());
		if(obj != null){
			Classes c = (Classes)obj;
			if(c.getClasslx().equals("空")){
				c.setClasslx("预科班");
			}else if(c.getClasslx().equals("预科班")){
				c.setClasslx("第一学期");
			}else if(c.getClasslx().equals("第一学期")){
				c.setClasslx("第二学期");
			}else if(c.getClasslx().equals("第二学期")){
				c.setClasslx("第三学期");
			}else if(c.getClasslx().equals("第三学期")){
				c.setClasslx("第四学期");
			}
			session.update(c);
		}
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Classes t) {
		session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(t);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Pager<Classes> queryAll(Pager<Classes> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Classes");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Classes> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(ct) from Classes ct");
		Object obj = query.uniqueResult();
		return obj;
	}
	
	@Override
	public Object countStu(int id) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(ct) from Student ct where ct.classes.classid=:id");
		query.setInteger("id",id );
		Object obj = query.uniqueResult();
		return obj;
	}

	public static void sessionClose(){
		session.close();
	}

	@Override
	public List<Dep> queryDep() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Dep where estatus = 3");
		@SuppressWarnings("unchecked")
		List<Dep> deps= query.list();
		session.close();
		return deps;
	}
	
	@Override
	public List<Dep> queryDeprk() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Dep where estatus = 1");
		@SuppressWarnings("unchecked")
		List<Dep> deps= query.list();
		return deps;
	}
	
	@Override
	public List<Dep> queryDepfd() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Dep where estatus = 2");
		@SuppressWarnings("unchecked")
		List<Dep> deps= query.list();
		return deps;
	}
	
	@Override
	public List<Classes> queryClasses(){
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Classes");
		@SuppressWarnings("unchecked")
		List<Classes> d  = query.list();
		session.close();
		return d;
	}
	

	@Override
	public Pager<Classes> queryAllstu(Pager<Classes> pager,String lx) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Classes where classlx = '"+lx+"'");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Classes> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) countlx(lx));
		session.close();
		return pager;
	}
	
	@Override
	public Object countlx(String lx) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("select count(ct) from Classes ct where classlx = '"+lx+"'");
		Object obj = query.uniqueResult();
		return obj;
	}
}
