package com.emoney.hhkim.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.emoney.hhkim.dao.AccountDao;
import com.emoney.hhkim.vo.AccountVo;
import com.emoney.hhkim.vo.LoginHistoryVo;


public interface AccountService {
	// CRUD
	public List<AccountVo> list(HashMap<String, Object> map);
	public int insert(AccountVo vo);
	
	// 회원가입 중복 검사
	public AccountVo findById(String id);
	public String idChk(String id);
	public AccountVo findByNick(String nickname);
	public String nickChk(String nickname);
	
	// 로그인
	public AccountVo login(HashMap<String, Object> map);
	public int updateLastLogin(int accnt_id);
	public int insertLoginHistory(LoginHistoryVo vo);
	
	// 페이징
	public int cnt(HashMap<String, Object> map);
}
