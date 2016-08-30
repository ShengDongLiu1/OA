package com.ht.dao;

import com.ht.common.Pager;

public interface BaseDao<T,PK> {
	
	/**
	 * @param t
	 * @return ���
	 */
	public T add(T t);
	
	/**
	 * @param t
	 * @return ������ѯ
	 */
	public T query(T t);
	
	/**
	 * @param t
	 * @return ����
	 */
	public T update(T t);
	
	/**
	 * @param ɾ��
	 */
	public void delete(T t);
	
	/**
	 * @param t
	 * @return ��ҳ��ѯ
	 */
	public Pager<T> queryAll(Pager<T> pager);
	
	/**
	 * @return
	 */
	public Object count();
	
}
