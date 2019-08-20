package com.emoney.hhkim.controller;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.emoney.hhkim.service.BoardService;
import com.emoney.hhkim.util.PageUtil;
import com.emoney.hhkim.vo.BoardListVo;
import com.emoney.hhkim.vo.BoardVo;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping("/board/list")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		int totalRowCnt = boardService.cnt();
		PageUtil pu = new PageUtil(pageNum, 10, 5, totalRowCnt);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pageNum", pageNum);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<BoardListVo> list = boardService.list(map);
		
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum());
		map.put("totalPageCnt", pu.getTotalPageCnt());
		
		model.addAttribute("list", list);
		model.addAttribute("pu", map);
		return ".board.list";
	}

	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public String writeForm() {
		return ".board.write";
	}

	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(int accnt_id, String title, String content) {
		BoardVo vo = new BoardVo(0, accnt_id, title, content, null);
		int result = boardService.insert(vo);
		if (result > 0) {
			return "redirect:/board/list";
		} else {
			return ".error.error";
		}
	}

	@RequestMapping("/board/detail")
	public String detail(int board_num, Model model) {
		BoardListVo vo = boardService.detail(board_num);
		model.addAttribute("vo", vo);
		return ".board.detail";
	}

	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public String updateForm(int board_num, Model model) {
		BoardListVo vo = boardService.detail(board_num);
		model.addAttribute("vo", vo);
		return ".board.update";
	}

	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(int board_num, String title, String content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board_num", board_num);
		map.put("title", title);
		map.put("content", content);
		int result = boardService.update(map);
		if (result > 0) {
			return "redirect:/board/detail?board_num=" + board_num;
		} else {
			return ".error.error";
		}
	}

	@RequestMapping(value = "/board/delete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String delete(int board_num) {
		String result = "";
		JSONObject json = new JSONObject();
		int n = boardService.delete(board_num);
		if (n > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		json.put("result", result);
		return json.toString();
	}

}
