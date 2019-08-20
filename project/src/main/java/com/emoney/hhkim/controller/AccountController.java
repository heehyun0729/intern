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
import org.springframework.web.bind.annotation.ResponseBody;

import com.emoney.hhkim.service.AccountService;
import com.emoney.hhkim.util.SecurityUtil;
import com.emoney.hhkim.vo.AccountVo;

@Controller
public class AccountController {
	@Autowired AccountService service;
	
	@RequestMapping("/account.hh")
	public String list(Model model){
		List<AccountVo> list = service.list();
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
		int result = service.insert(vo);
		if(result > 0){
			return ".member.joinOk";
		}else{
			return ".error.error";
		}
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheck(String id){
		AccountVo vo = service.idChk(id);
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
		AccountVo vo = service.nickChk(nickname);
		JSONObject json = new JSONObject();
		if(vo != null){
			json.put("find", true);
		}else{
			json.put("find", false);
		}
		return json.toString();
	}
	
}
