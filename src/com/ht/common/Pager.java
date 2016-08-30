package com.ht.common;

import java.util.List;

public class Pager<T> {
	// 當前頁
	private int pageNo;
	// 每頁多少
	private int pageSize;
	// 縂頁數
	private long total;
	// 存放數據
	private List<T> rows;
	
	public int getBeginIndex(){
		return (pageNo - 1) * pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

}
