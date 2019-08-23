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


	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(HttpSession session, Model model) throws UnsupportedEncodingException {
		if(session.getAttribute("login") != null){
			return ".error.404";
		}else{
			// 네이버 로그인
			String clientId = "Jze21sO3oqNPdg7pO21n";//애플리케이션 클라이언트 아이디값";
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
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String pwd, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		// 기존에 login 세션이 있는 경우
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
			if (vo != null) { // 로그인 성공
				int accnt_id = vo.getAccnt_id();
				String nickname = vo.getNickname();
				// 마지막 로그인
				int result1 = accountService.updateLastLogin(accnt_id);
				if(result1 <= 0){
					LOG.error("ACCOUNT update 실패 / accnt_id: " + accnt_id + ", nickname: " + nickname);
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
					LOG.error("LOGIN_HIS insert 실패 / accnt_id: " + accnt_id + ", nickname: " + nickname);
					throw new Exception();
				}			
				LOG.info("로그인: " + accnt_id + "(" + nickname + ")");
				session.setAttribute("login", vo);
				String referer = (String)session.getAttribute("referer");
				if(referer == null || referer.equals("")){
					url = "redirect:/";
				}else{
					url = "redirect:" + referer;
				}
			} else { // 로그인 실패
				msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
				model.addAttribute("msg", msg);
				url = ".member.login";
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
		String nickname = vo.getNickname();
		LOG.info("로그아웃: " + accnt_id + "(" + nickname + ")");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/naverLoginOk")
	public String naverLoginOk(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException{
		 String clientId = "Jze21sO3oqNPdg7pO21n";//애플리케이션 클라이언트 아이디값";
		    String clientSecret = "E4Ra1PQPhv";//애플리케이션 클라이언트 시크릿값";
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
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
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
	public String personalInfo(HttpServletRequest request, HttpSession session) throws Exception {
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
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
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
		    	if(vo != null){ // 기존에 네이버 아이디로 가입한 경우
			    	session.setAttribute("login", vo);
					return "redirect:/";
		    	}else{	// 처음 로그인하는 경우
		    		session.setAttribute("id", id);
		    		return ".member.naverJoin";
		    	}
	        } catch (Exception e) {
	            System.out.println(e);
	            return ".error.error";
	        }
	}
}
