package com.emoney.hhkim.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.emoney.hhkim.service.AccountService;
import com.emoney.hhkim.util.CommonUtil;
import com.emoney.hhkim.util.SecurityUtil;
import com.emoney.hhkim.vo.AccountVo;
import com.emoney.hhkim.vo.LoginHistoryVo;

@Controller
public class LoginController {
	@Autowired private AccountService accountService;
	private static final Logger LOG = LoggerFactory.getLogger(LoginController.class);


	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return ".member.login";
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = {Exception.class})
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String pwd, HttpSession session, HttpServletRequest request) throws Exception {
		// ������ login ������ �ִ� ���
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}

		String s_passwd;
		try {
			s_passwd = SecurityUtil.bytesToHex(SecurityUtil.sha256(pwd));

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("s_passwd", s_passwd);
	
			AccountVo vo = accountService.loginChk(map);
			String url = "";
			String msg = "";
			if (vo != null) { // �α��� ����
				int accnt_id = vo.getAccnt_id();
				// ������ �α���
				int result1 = accountService.updateLastLogin(accnt_id);
				if(result1 <= 0){
					LOG.error("ACCOUNT update ���� / accnt_id: " + accnt_id);
					throw new Exception();
				}
				// login history
				String is_mobile = CommonUtil.isMobileChk(request);
				String ip = request.getRemoteAddr();
				String browser = CommonUtil.getBrowser(request);
				String os = CommonUtil.getOs(request);
				LoginHistoryVo lvo = new LoginHistoryVo(accnt_id, null, is_mobile, 
	                    ip, browser, os);
				int result2 = accountService.insertLoginHistory(lvo);
				if(result2 <= 0){
					LOG.error("LOGIN_HIS insert ���� / accnt_id: " + accnt_id);
					throw new Exception();
				}			
				LOG.info("�α���: " + accnt_id);
				session.setAttribute("login", vo);
				url = "redirect:/";
			} else { // �α��� ����
				msg = "���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
				session.setAttribute("msg", msg);
				url = "redirect:/login";
			}
			return url;
		} catch (NoSuchAlgorithmException e) {
			LOG.error(e.getMessage());
			throw new Exception();
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		AccountVo vo = (AccountVo) session.getAttribute("login");
		int accnt_id = vo.getAccnt_id();
		LOG.info("�α׾ƿ�: " + accnt_id);
		session.invalidate();
		return "redirect:/";
	}
}
