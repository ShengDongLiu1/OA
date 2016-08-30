package com.ht.common;

import java.util.List;

public class Pager<T> {
	// ��ǰ�
	private int pageNo;
	// ÿ퓶���
	private int pageSize;
	// �G퓔�
	private long total;
	// ��Ŕ���
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
