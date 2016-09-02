package com.ht.dao;

import com.ht.common.Pager;

public interface BaseDao<T,PK> {
	
	/**
	 * @param t
	 * @return 添加
	 */
	public T add(T t);
	
	/**
	 * @param t
	 * @return 查询
	 */
	public T query(T t);
	
	/**
	 * @param t
	 * @return 修改
	 */
	public T update(T t);
	
	/**
	 * @param 删除
	 */
	public void delete(T t);
	
	/**
	 * @param t
	 * @return 分页查询
	 */
	public Pager<T> queryAll(Pager<T> pager);
	
	/**
	 * @return
	 */
	public Object count();
	
}
