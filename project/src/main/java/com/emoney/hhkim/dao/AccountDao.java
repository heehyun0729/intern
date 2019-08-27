package com.emoney.hhkim.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.emoney.hhkim.vo.AccountVo;
import com.emoney.hhkim.vo.LoginHistoryVo;

@Repository
public class AccountDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.emoney.hhkim.mybatis.AccountMapper";
	
	public List<AccountVo> list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".list", map);
	}
	public int insert(AccountVo vo){
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	public AccountVo findById(String id){
		return sqlSession.selectOne(NAMESPACE + ".findById", id);
	}
	public AccountVo findByNick(String nickname){
		return sqlSession.selectOne(NAMESPACE + ".findByNick", nickname);
	}
	public AccountVo login(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE + ".login", map);
	}
	public int updateLastLogin(int accnt_id){
		return sqlSession.update(NAMESPACE + ".updateLastLogin", accnt_id);
	}
	public int insertLoginHistory(LoginHistoryVo vo){
		return sqlSession.insert(NAMESPACE + ".insertLoginHistory", vo);
	}
	public int cnt(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE + ".cnt", map);
	}
}
