package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Classes;
import com.ht.bean.Hourse;
import com.ht.bean.Student;
import com.ht.bean.Studentyx;
import com.ht.common.Pager;

public class StudentDaoImpl implements StudentDao {

	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Student add(Student t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Studentyx addyx(Studentyx t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public Student query(Student t) {
		session = sessionFactory.openSession();
		t = (Student)session.get(Student.class, t.getIntenid());
		session.close();
		return t;
	}

	@Override
	public Student update(Student t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Object obj = session.get(Student.class, t.getIntenid());
		if(obj != null){
			Student stu = (Student) obj;
			stu.setIntenname(t.getIntenname());
			stu.setIntensch(t.getIntensch());
			stu.setIntensex(t.getIntensex());
			stu.setIntenage(t.getIntenage());
			stu.setIntenbir(t.getIntenbir());
			stu.setIntenfat(t.getIntenfat());
			stu.setIntentel(t.getIntentel());
			stu.setIntenfatel(t.getIntenfatel());
			stu.setIntenaddr(t.getIntenaddr());
			stu.setIntenpeo(t.getIntenpeo());
			stu.setIntenmz(t.getIntenmz());
			stu.setIntenjg(t.getIntenjg());
			stu.setIntenstatus(t.getIntenstatus());
			stu.setClassid(t.getClassid());
			stu.setHourid(t.getHourid());
			Classes c = new Classes();
			c.setClassid(t.getClassid());
			Hourse h = new Hourse();
			h.setHourid(t.getHourid());
			stu.setStatus(stu.getStatus());
			stu.setClasses(c);
			stu.setHourse(h);
			session.update(stu);
		}
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(Student t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Object obj = session.get(Student.class, t.getIntenid());
		if(obj != null){
			Student w = (Student) obj;
			w.setIntenid(t.getIntenid());
			session.delete(w);
		}
		transaction.commit();
		session.close();
	}

	@Override
	public void deleteyx(Studentyx t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Object obj = session.get(Studentyx.class, t.getIntenid());
		if(obj != null){
			Studentyx w = (Studentyx) obj;
			session.delete(w);
		}
		transaction.commit();
		session.close();
	}
	@Override
	public Pager<Student> queryAll(Pager<Student> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Student");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Student> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Pager<Studentyx> queryAllyx(Pager<Studentyx> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Studentyx");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Studentyx> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) countyx());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Student t");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public Object countyx() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Studentyx t");
		Object obj = q.uniqueResult();
		return obj;
	}
	
	@Override
	public Pager<Student> queryAllstu(Pager<Student> pager, Integer classid) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Student stu where stu.classes.classid=:classid");
		query.setInteger("classid", classid);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Student> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) bjcount(classid));
		session.close();
		return pager;
	}
	
	@Override
	public Object bjcount(Integer classid) {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Student t where t.classes.classid=:classid");
		q.setInteger("classid", classid);
		Object obj = q.uniqueResult();
		return obj;
	}



}
