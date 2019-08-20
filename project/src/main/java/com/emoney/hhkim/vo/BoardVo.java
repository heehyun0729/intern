package com.emoney.hhkim.vo;

public class BoardVo {
	private int board_num;
	private int accnt_id;
	private String title;
	private String content;
	private String wdate;
	
	public BoardVo() {}

	public BoardVo(int board_num, int accnt_id, String title, String content, String wdate) {
		super();
		this.board_num = board_num;
		this.accnt_id = accnt_id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getAccnt_id() {
		return accnt_id;
	}

	public void setAccnt_id(int accnt_id) {
		this.accnt_id = accnt_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
}
