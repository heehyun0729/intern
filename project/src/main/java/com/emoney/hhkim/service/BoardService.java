package com.emoney.hhkim.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.emoney.hhkim.dao.BoardDao;
import com.emoney.hhkim.vo.BoardListVo;
import com.emoney.hhkim.vo.BoardVo;

@Service
public class BoardService {
	@Autowired private BoardDao boardDao;
	
	public int insert(BoardVo vo){
		return boardDao.insert(vo);
	}
	public List<BoardListVo> list(){
		return boardDao.list();
	}
	public BoardListVo detail(int board_num){
		return boardDao.detail(board_num);
	}
	public int update(HashMap<String, Object> map){
		return boardDao.update(map);
	}
	public int delete(int board_num){
		return boardDao.delete(board_num);
	}
}
