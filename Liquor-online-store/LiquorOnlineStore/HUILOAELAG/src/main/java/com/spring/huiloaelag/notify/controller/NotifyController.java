package com.spring.huiloaelag.notify.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.huiloaelag.notify.NotifyService;
import com.spring.huiloaelag.notify.NotifyVO;

@SessionAttributes("notify") // notify 라는 이름의 Model 객체가 있으면 session 에 저장
@Controller
public class NotifyController {

	@Autowired
	private NotifyService NotifyService;

	@RequestMapping("/notice.do")
	public String notice(NotifyVO vo, Model model) {
		System.out.println(">>> 공지 전체 목록 보여주기");
		System.out.println("vo : " + vo);
		List<NotifyVO> list = NotifyService.NotifyList(vo);
		System.out.println("list: " + list);
		model.addAttribute("NotifyList", list);
		
		return "notify/NotifyList";
	}
	

}
