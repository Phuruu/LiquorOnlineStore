package com.spring.huiloaelag.users.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;



@Controller
public class userAjaxController {
	@Autowired
	private com.spring.huiloaelag.users.userService userService;

	@RequestMapping("/userIdCheck.do")
	@ResponseBody
	public String userIdCheck(Model model,@RequestParam(value = "memberId") String userId,
			HttpServletRequest request) {
		if("".equals(userId)) {
			System.out.println("불가능"); 
			model.addAttribute("userIdCheck", 0);
			System.out.println(model.toString());
			return "blank";
		} 
		int result = userService.selectUserId(userId);
		
		if (result == 0) {
			System.out.println("가능"); 
			//model.addAttribute("userIdCheck", "success");
			request.setAttribute("userIdCheck", "success");
			System.out.println(model.toString());
			return "success";
		} else { 
			System.out.println("불가능"); 
			model.addAttribute("userIdCheck", "fail");
			System.out.println(model.toString());
			return "fail";
		}
	}
	
	@RequestMapping("/userNickNameCheck.do")
	@ResponseBody
	public String userNickNameCheck(@RequestParam(value = "memberNick") String unick,
			HttpServletRequest request) {
		if("".equals(unick)) {
			System.out.println("불가능");
			request.setAttribute("result", 0);
			return "blank";
		}
		
		int result = userService.selectUserNickname(unick);
		if (result == 0) {
			System.out.println("가능");
			request.setAttribute("result", 1);
			return "success";
		} else { 
			System.out.println("불가능"); 
			request.setAttribute("result", 0);
			return "fail";
		}
	}

}
