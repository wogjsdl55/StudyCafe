package com.Portfolio.StudyCafe;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Portfolio.StudyCafe.dao.MemberDao;
import com.Portfolio.StudyCafe.dto.Dto;
import com.Portfolio.StudyCafe.dto.Login_Dto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
/*	Dao dao; */
	
	@Autowired
	private SqlSession sqlSession;
	
/*	@Autowired
	public void setDao(Dao dao) {
		this.dao = dao;
	}
*/	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);	
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		model.addAttribute("list", dao.list());
		
		return "/list";
	}
	
	@RequestMapping("/write_view")
	public String write_view(Model model) {
		System.out.println("write_view()");
		
		return "write_view";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		
		return "/writeForm";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.contentView(request.getParameter("strID"));
		return "redirect:list";
	}
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model){
		return "/view";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		
		return "login";
	}
	
	@RequestMapping("/member")
	public String member(Model model) {
		
		return "member";
	}
	
	@RequestMapping("/member_proc")
	public String member_proc(HttpServletRequest request, Model model ) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		if (request.getParameter("MId") == null & request.getParameter("MPwd") == null ) {
			model.addAttribute("msg", "잘못된 접근입니다.");
		}else {
			dao.member_proc(request.getParameter("MId"), request.getParameter("MPwd"), request.getParameter("MName"), request.getParameter("MEmail"), request.getParameter("MNick"));
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
		}
		return "member_proc";
	}
	
	@RequestMapping("/login_proc")
	public String login_proc(HttpServletRequest request, Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Login_Dto> result = dao.login_proc(request.getParameter("MId"), request.getParameter("MPwd") );
		model.addAttribute("login", result);
		System.out.println(result);
		if (result.isEmpty()) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
		}else {
			model.addAttribute("msg", "로그인에 완료되었습니다.");
		}
		
		return "login_proc";
	}
	
}
