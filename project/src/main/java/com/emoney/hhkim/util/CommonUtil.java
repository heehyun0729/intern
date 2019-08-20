package com.emoney.hhkim.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;

public class CommonUtil {
	public static String isMobileChk(HttpServletRequest request) {
		Device device = DeviceUtils.getCurrentDevice(request);

		String result = "";
		if (device.isMobile()) {
			result = "Y";
		} else if (device.isNormal()) {
			result = "N";
		}
		return result;
	}

	public static String getBrowser(HttpServletRequest request) {
		String browserInfo = request.getHeader("User-Agent");
		String browser = "";

		if (browserInfo != null) {
			browserInfo = browserInfo.toLowerCase();
			if (browserInfo.indexOf("trident") > -1) {
				browser = "IE";
			} else if (browserInfo.indexOf("msie") > -1) {
				browser = "IE";
			} else if (browserInfo.indexOf("chrome") > -1) {
				browser = "Chrome";
			} else if (browserInfo.indexOf("opera") > -1) {
				browser = "Opera";
			} else if (browserInfo.indexOf("safari") > -1) {
				browser = "Safari";
			} else if (browserInfo.indexOf("edge") > -1) {
				browser = "Edge";
			} else if (browserInfo.indexOf("firefox") > -1) {
				browser = "Firefox";
			} else {
				browser = "etc";
			}
		}
		return browser;
	}

	public static String getOs(HttpServletRequest request) {
		String osInfo = request.getHeader("User-Agent");
		String os = "";

		if (osInfo != null) {
			osInfo = osInfo.toLowerCase();
			if (osInfo.indexOf("windows") > -1) {
				os = "Windows";
			} else if (osInfo.indexOf("iphone") > -1 || osInfo.indexOf("ipad") > -1) {
				os = "IOS";
			} else if (osInfo.indexOf("mac") > -1) {
				os = "MAC";
			} else if (osInfo.indexOf("android") > -1) {
				os = "Android";
			} else if (osInfo.indexOf("linux") > -1) {
				os = "Linux";
			} else {
				os = "etc";
			}
		}
		return os;
	}

}
