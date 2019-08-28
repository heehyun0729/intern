package com.emoney.hhkim.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecurityUtil {
	
	public static String sha256(String pwd) {
	    String sha = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
		    md.update(pwd.getBytes());
		    byte[] bytes = md.digest();
		    
		    StringBuffer sb = new StringBuffer();
		    for (byte b: bytes) {
		      sb.append(String.format("%02x", b));
		    }
		    sha = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			sha = null;
		}
	    return sha;
	}
	
}
