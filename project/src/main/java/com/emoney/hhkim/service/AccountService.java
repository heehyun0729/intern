package com.emoney.hhkim.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.emoney.hhkim.dao.AccountDao;
import com.emoney.hhkim.vo.AccountVo;
import com.emoney.hhkim.vo.LoginHistoryVo;

@Service
public class AccountService {
	@Autowired private AccountDao accountDao;
	
	public List<AccountVo> list(HashMap<String, Object> map){
		return accountDao.list(map);
	}
	public int insert(AccountVo vo){
		return accountDao.insert(vo);
	}
	public AccountVo idChk(String id){
		return accountDao.idChk(id);
	}
	public AccountVo nickChk(String nickname){
		return accountDao.nickChk(nickname);
	}
	public AccountVo loginChk(HashMap<String, Object> map){
		return accountDao.loginChk(map);
	}
	public int updateLastLogin(int accnt_id){
		return accountDao.updateLastLogin(accnt_id);
	}
	public int insertLoginHistory(LoginHistoryVo vo){
		return accountDao.insertLoginHistory(vo);
	}
	public int cnt(){
		return accountDao.cnt();
	}
}
