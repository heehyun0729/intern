package com.emoney.hhkim.vo;

public class LoginHistoryVo {
	private int accnt_id;
	private String login_date;
	private String is_mobile;
	private String ip;
	private String browser;
	private String os;
	
	public LoginHistoryVo() {}

	public LoginHistoryVo(int accnt_id, String login_date, String is_mobile, String ip, String browser, String os) {
		super();
		this.accnt_id = accnt_id;
		this.login_date = login_date;
		this.is_mobile = is_mobile;
		this.ip = ip;
		this.browser = browser;
		this.os = os;
	}

	public int getAccnt_id() {
		return accnt_id;
	}

	public void setAccnt_id(int accnt_id) {
		this.accnt_id = accnt_id;
	}

	public String getLogin_date() {
		return login_date;
	}

	public void setLogin_date(String login_date) {
		this.login_date = login_date;
	}

	public String getIs_mobile() {
		return is_mobile;
	}

	public void setIs_mobile(String is_mobile) {
		this.is_mobile = is_mobile;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getBrowser() {
		return browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}
	
	
}