package com.emoney.hhkim.controller;

import java.security.NoSuchAlgorithmException;
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

import com.emoney.hhkim.service.AccountService;
import com.emoney.hhkim.util.PageUtil;
import com.emoney.hhkim.util.SecurityUtil;
import com.emoney.hhkim.vo.AccountVo;

@Controller
public class AccountController {
	@Autowired AccountService accountService;
	
	@RequestMapping("/account.hh")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model){
		int totalRowCnt = accountService.cnt();
		PageUtil pu = new PageUtil(pageNum, 5, 5, totalRowCnt);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pageNum", pageNum);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<AccountVo> list = accountService.list(map);
		for(AccountVo vo : list){
			String pwd = vo.getS_passwd();
			pwd = pwd.substring(0, 3) + "***";
			vo.setS_passwd(pwd);
		}
		
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum());
		map.put("totalPageCnt", pu.getTotalPageCnt());
		
		model.addAttribute("pu", map);
		model.addAttribute("list", list);
		
		return ".member.account";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm(){
		return ".member.join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(String id, String pwd, String name, String nickname, String phone) 
			throws NoSuchAlgorithmException{
		// 비밀번호 암호화
		String s_passwd = SecurityUtil.bytesToHex(SecurityUtil.sha256(pwd));
		
		AccountVo vo = new AccountVo(0, nickname, name, "", phone, id, s_passwd, null);
		int result = accountService.insert(vo);
		if(result > 0){
			return ".member.joinOk";
		}else{
			return ".error.error";
		}
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheck(String id){
		AccountVo vo = accountService.idChk(id);
		JSONObject json = new JSONObject();
		if(vo != null){
			json.put("find", true);
		}else{
			json.put("find", false);
		}
		return json.toString();
	}
	
	@RequestMapping("/nickCheck")
	@ResponseBody
	public String nickCheck(String nickname){
		AccountVo vo = accountService.nickChk(nickname);
		JSONObject json = new JSONObject();
		if(vo != null){
			json.put("find", true);
		}else{
			json.put("find", false);
		}
		return json.toString();
	}
	
}
