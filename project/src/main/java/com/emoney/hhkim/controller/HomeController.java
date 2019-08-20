package com.emoney.hhkim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy³â MM¿ù ddÀÏ HH:mm:ss");
		String time = sf.format(new Date());
		
		model.addAttribute("time", time);
		
		return ".main";
	}
}
