package com.emoney.hhkim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	@RequestMapping("/error404")
	public String error404(){
		return ".error.404";
	}
	@RequestMapping("/error")
	public String error(){
		return ".error.error";
	}
}