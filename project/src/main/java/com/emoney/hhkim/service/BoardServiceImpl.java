package com.emoney.hhkim.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.emoney.hhkim.dao.BoardDao;
import com.emoney.hhkim.vo.BoardListVo;
import com.emoney.hhkim.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired private BoardDao boardDao;
	
	@Override
	public int insert(BoardVo vo){
		return boardDao.insert(vo);
	}
	
	@Override
	public List<BoardListVo> list(HashMap<String, Object> map){
		return boardDao.list(map);
	}
	
	@Override
	public BoardListVo detail(int board_num){
		return boardDao.detail(board_num);
	}
	
	@Override
	public int update(HashMap<String, Object> map){
		return boardDao.update(map);
	}
	
	@Override
	public String delete(int board_num){
		String result = "";
		JSONObject json = new JSONObject();
		int n = boardDao.delete(board_num);
		if (n > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		json.put("result", result);
		return json.toString();
	}
	
	@Override
	public int cnt(HashMap<String, Object> map){
		return boardDao.cnt(map);
	}
}
