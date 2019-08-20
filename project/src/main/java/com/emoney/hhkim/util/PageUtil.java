package com.emoney.hhkim.util;

public class PageUtil {
	private int pageNum;
	private int startRow;
	private int endRow;
	private int totalPageCnt;
	private int startPageNum;
	private int endPageNum;
	private int rowBlockCnt;
	private int pageBlockCnt;
	private int totalRowCnt;
	
	public PageUtil() {}

	public PageUtil(int pageNum, int rowBlockCnt, int pageBlockCnt, int totalRowCnt) {
		this.pageNum = pageNum;
		this.totalRowCnt = totalRowCnt;
		this.rowBlockCnt = rowBlockCnt;
		this.pageBlockCnt = pageBlockCnt;
		
		endRow = pageNum * rowBlockCnt;
		startRow = endRow - (rowBlockCnt - 1);
		
		totalPageCnt = (int)Math.ceil(totalRowCnt / (double)rowBlockCnt);
		startPageNum = (pageNum - 1) / pageBlockCnt * pageBlockCnt + 1;
		endPageNum = startPageNum + pageBlockCnt - 1;
		if(totalPageCnt < endPageNum) {
			endPageNum = totalPageCnt;
		}
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getTotalPageCnt() {
		return totalPageCnt;
	}

	public void setTotalPageCnt(int totalPageCnt) {
		this.totalPageCnt = totalPageCnt;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getRowBlockCnt() {
		return rowBlockCnt;
	}

	public void setRowBlockCnt(int rowBlockCnt) {
		this.rowBlockCnt = rowBlockCnt;
	}

	public int getPageBlockCnt() {
		return pageBlockCnt;
	}

	public void setPageBlockCnt(int pageBlockCnt) {
		this.pageBlockCnt = pageBlockCnt;
	}

	public int getTotalRowCnt() {
		return totalRowCnt;
	}

	public void setTotalRowCnt(int totalRowCnt) {
		this.totalRowCnt = totalRowCnt;
	}
	
}
