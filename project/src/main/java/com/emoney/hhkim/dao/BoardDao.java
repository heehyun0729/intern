package com.emoney.hhkim.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.emoney.hhkim.vo.BoardListVo;
import com.emoney.hhkim.vo.BoardVo;

@Repository
public class BoardDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.emoney.hhkim.mybatis.BoardMapper";
	
	public int insert(BoardVo vo){
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	public List<BoardListVo> list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".list", map);
	}
	public BoardListVo detail(int board_num){
		return sqlSession.selectOne(NAMESPACE + ".detail", board_num);
	}
	public int update(HashMap<String, Object> map){
		return sqlSession.update(NAMESPACE + ".update", map);
	}
	public int delete(int board_num){
		return sqlSession.delete(NAMESPACE + ".delete", board_num);
	}
	public int cnt(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE + ".cnt", map);
	}
}
