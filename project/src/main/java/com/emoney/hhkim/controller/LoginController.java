package com.emoney.hhkim.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
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


	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpSession session, Model model) throws UnsupportedEncodingException {
		if(session.getAttribute("login") != null){
			return ".error.404";
		}else{
			// ���̹� �α���
			String clientId = "Jze21sO3oqNPdg7pO21n";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
		   String redirectURI = URLEncoder.encode("https://localhost/naverLoginOk", "UTF-8");
		   SecureRandom random = new SecureRandom();
		   String state = new BigInteger(130, random).toString();
		   String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		   apiURL += "&client_id=" + clientId;
		   apiURL += "&redirect_uri=" + redirectURI;
		   apiURL += "&state=" + state;
		   session.setAttribute("state", state);
		   model.addAttribute("apiURL", apiURL);
			
			return ".member.login";
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = {Exception.class})
	public String loginProcess(AccountVo vo, HttpSession session, HttpServletRequest request, Model model) throws Exception{
		String url = "";
		String msg = "";
		if(vo == null){
			msg = "���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
			model.addAttribute("msg", msg);
			url = ".member.login";
		}else{
			int accnt_id = vo.getAccnt_id();
			String nickname = vo.getNickname();
			
			// ������ �α���
			int result1 = accountService.updateLastLogin(accnt_id);
			if(result1 <= 0){
				LOG.error("ACCOUNT update ���� / accnt_id: " + accnt_id + ", nickname: " + nickname);
				throw new Exception();
			}
			
			// login history
			String is_mobile = CommonUtil.isMobileChk(request);
			String ip = request.getRemoteAddr();
			String browser = CommonUtil.getBrowser(request);
			String os = CommonUtil.getOs(request);
			LoginHistoryVo lvo = new LoginHistoryVo(accnt_id, null, is_mobile, ip, browser, os);
			int result2 = accountService.insertLoginHistory(lvo);
			if(result2 <= 0){
				LOG.error("LOGIN_HISTORY insert ���� / accnt_id: " + accnt_id + ", nickname: " + nickname);
				throw new Exception();
			}
			
			if(!vo.getS_passwd().equals("pwd")){	// �Ϲ� �α���
				LOG.info("�α���: " + accnt_id + "(" + nickname + ")");
			}else{	// ���̹� �α���
				LOG.info("���̹� �α���: " + accnt_id + "(" + nickname + ")");
			}
			
			session.setAttribute("login", vo);
			String referer = (String)session.getAttribute("referer");
			if(referer == null || referer.equals("")){
				url = "redirect:/";
			}else{
				url = "redirect:" + referer;
			}
		}
		return url;
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String pwd, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		// ������ login ������ �ִ� ���
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		String s_passwd;
		s_passwd = SecurityUtil.bytesToHex(SecurityUtil.sha256(pwd));

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("s_passwd", s_passwd);

		AccountVo vo = accountService.loginChk(map);
		String url = loginProcess(vo, session, request, model);
		return url;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		AccountVo vo = (AccountVo) session.getAttribute("login");
		int accnt_id = vo.getAccnt_id();
		String nickname = vo.getNickname();
		LOG.info("�α׾ƿ�: " + accnt_id + "(" + nickname + ")");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/naverLoginOk")
	public String naverLoginOk(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException{
		 String clientId = "Jze21sO3oqNPdg7pO21n";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
		    String clientSecret = "E4Ra1PQPhv";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("https://localhost/naverLoginOk", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      if(responseCode==200) { // ���� ȣ��
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // ���� �߻�
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		    	  JSONObject json  = new JSONObject(res.toString());
		    	  String token = json.get("access_token").toString();
		    	  session.setAttribute("token", token);
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		return "redirect:/naverLoginInfo";
	}
	
	@RequestMapping(value = "/naverLoginInfo")
	public String personalInfo(HttpServletRequest request, HttpSession session, Model model) throws Exception {
	        String token = (String)session.getAttribute("token");
	        String header = "Bearer " + token;
	        try {
	            String apiURL = "https://openapi.naver.com/v1/nid/me";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization", header);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // ���� ȣ��
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // ���� �߻�
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer res = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                res.append(inputLine);
	            }
	            br.close();
		    	JSONObject json  = new JSONObject(res.toString());
		    	JSONObject response = json.getJSONObject("response");
		    	String id = response.getString("id");
		    	AccountVo vo = accountService.idChk(id);
		    	if(vo != null){ // ������ ���̹� ���̵�� ������ ���
			    	session.setAttribute("login", vo);
			    	return loginProcess(vo, session, request, model);
		    	}else{	// ó�� �α����ϴ� ���
		    		session.setAttribute("id", id);
		    		return ".member.naverJoin";
		    	}
	        } catch (Exception e) {
	            System.out.println(e);
	            return ".error.error";
	        }
	}
	
	@RequestMapping(value = "/naverJoin", method = RequestMethod.POST)
	public String naverJoin(String nickname, String phone, HttpSession session, HttpServletRequest request, Model model) 
			throws Exception{
		String id = (String)session.getAttribute("id");
		AccountVo vo = new AccountVo(0, nickname, nickname, "", phone, id, "pwd", null);
		int result = accountService.insert(vo);
		if(result > 0){
			vo = accountService.idChk(id);
			return loginProcess(vo, session, request, model);
		}else{
			return ".error.error";
		}
	}
}
