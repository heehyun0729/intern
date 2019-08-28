package com.emoney.hhkim.service;

import java.util.HashMap;
import java.util.List;

import com.emoney.hhkim.vo.BoardListVo;
import com.emoney.hhkim.vo.BoardVo;

public interface BoardService {
	public int insert(BoardVo vo);
	public List<BoardListVo> list(HashMap<String, Object> map);
	public BoardListVo detail(int board_num);
	public int update(HashMap<String, Object> map);
	public String delete(int board_num);
	
	public int cnt(HashMap<String, Object> map);
}
