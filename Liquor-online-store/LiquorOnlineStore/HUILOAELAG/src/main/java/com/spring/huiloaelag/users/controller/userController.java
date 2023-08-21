package com.spring.huiloaelag.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.huiloaelag.users.userService;
import com.spring.huiloaelag.users.userVO;

@Controller
public class userController {
	@Autowired
	private userService userService;
	int a = 0;
	@RequestMapping("/insertUser.do")
	public String insertMember(userVO vo,HttpServletRequest request , @RequestParam(value="membershipInsert", required = false) String optionButton){
		String addr1 = request.getParameter("addr1"); //우편번호
		String addr2 = request.getParameter("addr2"); //주소
		String addr3 = request.getParameter("addr3"); //상세주소
		if (addr1 == null) addr1 = "";
		if (addr2 == null) addr2 = "";
		if (addr3 == null) addr3 = "";
		String userAddress = addr2 + addr3;
		System.out.println(addr1 + "," + addr2 + "," + addr3 + "," + userAddress);
		System.out.println("userAddress: " + userAddress );
		vo.setUaddr(userAddress);
		userService.insertUserCheck(vo);
		
		System.out.println("최종 vo : 	" + vo);
		/* return "redirect:main.jsp"; */
		return "user/login";
	}
	
	@RequestMapping("/userCheck.do")
	public String go() {
		return "user/userCheck";

	}
	
	@RequestMapping("/loginPage.do")
	public ModelAndView login_check(@ModelAttribute userVO vo, HttpSession session) {
	System.out.println(vo);
	String name = userService.selectLogin(vo);  
	System.out.println(name);
	 ModelAndView mav = new ModelAndView();
	  if (name != null) { // 로그인 성공 시 
		session.setAttribute("userId", vo.getUserId());
		session.setAttribute("unick", name);
		  mav.setViewName("redirect: main.jsp"); //메인으로 돌리는 ..
	   } else { // 로그인 실패 시
	     mav.setViewName("user/login"); 		
	     mav.addObject("message", "error");
	     }
	     return mav;
	   }
	
	
	//로그아웃 
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		 session.removeAttribute("userId");
		 session.removeAttribute("unick");
		 return "redirect:main.jsp";
	  }
	
	@RequestMapping("/idSearch.do")
	public String goIdSearch() {
		return "user/findId";
	}
	
	//아이디 찾기 
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
		public String findId(userVO vo, HttpServletRequest request) {
		String user = userService.findId(vo);
		if (user == null) {
			request.setAttribute("check", 1);
		} else {
			request.setAttribute("check", 0);
			request.setAttribute("userId", user);
		}
			
			return "user/findId";
		}
		
	@RequestMapping("/pwdSearch.do")
	public String goPwdSearch() {
		return "user/findPwd";
	}
	
	//비밀번호 찾기 
	@RequestMapping(value = "/findPwd.do", method = RequestMethod.POST)
		public String findPwd(userVO vo, HttpServletRequest request) {
		String user = userService.findPwd(vo);
		System.out.println(user);
			
		if (user == null) {
			request.setAttribute("check", 1);
		} else {
			request.setAttribute("check", 0);
			request.setAttribute("userPwd", user);
		}
			return "user/findPwd";
		}
	
	
	

}
