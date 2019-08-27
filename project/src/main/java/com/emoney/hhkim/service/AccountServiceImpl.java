package com.emoney.hhkim.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.emoney.hhkim.dao.AccountDao;
import com.emoney.hhkim.vo.AccountVo;
import com.emoney.hhkim.vo.LoginHistoryVo;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired private AccountDao accountDao;
	
	@Override
	public List<AccountVo> list(HashMap<String, Object> map){
		return accountDao.list(map);
	}
	
	@Override
	public int insert(AccountVo vo){
		return accountDao.insert(vo);
	}
	
	@Override
	public AccountVo findById(String id) {
		return accountDao.findById(id);
	}
	
	@Override
	public String idChk(String id){
		AccountVo vo = findById(id);
		JSONObject json = new JSONObject();
		if(vo != null){
			json.put("find", true);
		}else{
			json.put("find", false);
		}
		return json.toString();
	}
	
	@Override
	public AccountVo findByNick(String nickname) {
		return accountDao.findByNick(nickname);
	}
	
	@Override
	public String nickChk(String nickname){
		AccountVo vo = findByNick(nickname);
		JSONObject json = new JSONObject();
		if(vo != null){
			json.put("find", true);
		}else{
			json.put("find", false);
		}
		return json.toString();
	}
	
	@Override
	public AccountVo login(HashMap<String, Object> map){
		return accountDao.login(map);
	}
	
	@Override
	public int updateLastLogin(int accnt_id){
		return accountDao.updateLastLogin(accnt_id);
	}
	
	@Override
	public int insertLoginHistory(LoginHistoryVo vo){
		return accountDao.insertLoginHistory(vo);
	}
	
	@Override
	public int cnt(){
		return accountDao.cnt();
	}
}
