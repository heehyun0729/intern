package com.emoney.hhkim.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.emoney.hhkim.service.BoardService;
import com.emoney.hhkim.service.BoardServiceImpl;
import com.emoney.hhkim.util.PageUtil;
import com.emoney.hhkim.vo.BoardListVo;
import com.emoney.hhkim.vo.BoardVo;

@Controller
public class BoardController {
	@Autowired
	private BoardServiceImpl boardServiceImpl;

	@RequestMapping("/board/list")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		int totalRowCnt = boardServiceImpl.cnt();
		PageUtil pu = new PageUtil(pageNum, 5, 5, totalRowCnt);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pageNum", pageNum);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<BoardListVo> list = boardServiceImpl.list(map);
		
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
		int result = boardServiceImpl.insert(vo);
		if (result > 0) {
			return "redirect:/board/list";
		} else {
			return ".error.error";
		}
	}

	@RequestMapping("/board/detail")
	public String detail(int board_num, Model model) {
		BoardListVo vo = boardServiceImpl.detail(board_num);
		model.addAttribute("vo", vo);
		return ".board.detail";
	}

	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public String updateForm(int board_num, Model model) {
		BoardListVo vo = boardServiceImpl.detail(board_num);
		model.addAttribute("vo", vo);
		return ".board.update";
	}

	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(int board_num, String title, String content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board_num", board_num);
		map.put("title", title);
		map.put("content", content);
		int result = boardServiceImpl.update(map);
		if (result > 0) {
			return "redirect:/board/detail?board_num=" + board_num;
		} else {
			return ".error.error";
		}
	}

	@RequestMapping(value = "/board/delete", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String delete(int board_num) {
		return boardServiceImpl.delete(board_num);
	}
	
	@RequestMapping(value = "/board/photoUpload", method = RequestMethod.POST)
	@ResponseBody
	public String photoUpload(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		try{
			String orgName = request.getHeader("file-name");
			// 리눅스 파일경로
	        String path = "/usr/local/tomcat/webapps/resources/upload/";
//	        // 윈도우 파일경로
//			String path = "C:/Users/eMoney/git/intern/project/src/main/webapp/resources/upload/";
			String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
						.format(System.currentTimeMillis()))
						.append("_" + UUID.randomUUID().toString())
						.append("_" + orgName).toString();
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(path + saveName);
			int fileSize = 0;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while((fileSize = is.read(b, 0, b.length)) != -1){
				os.write(b, 0, fileSize);
			}
			os.flush();
			os.close();
			sb.append("&bNewLine=true")
            .append("&sFileName=").append(orgName)
            // 리눅스 경로
            .append("&sFileURL=").append("https://hh.x1.co.kr/resources/upload/")
//	          // 윈도우 경로
//	          .append("&sFileURL=").append("https://localhost/resources/upload/")
            .append(saveName);
		}catch(Exception e){
			e.printStackTrace();
		}
		return sb.toString();
	}
}
