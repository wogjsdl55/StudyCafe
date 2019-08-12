package com.Portfolio.StudyCafe;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Portfolio.StudyCafe.dao.MemberDao;
import com.Portfolio.StudyCafe.dao.ReviewDao;
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
	
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model){
		return "/view";
	}
	
	@RequestMapping("/member/member")
	public String member(Model model) {
		
		return "/member/member";
	}
	
	@RequestMapping("/member/member_edit")
	public String member_edit(Model model) {
		
		return "/member/member_edit";
	}
	
	@RequestMapping("/member/member_proc")
	public String member_proc(HttpServletRequest request, Model model ) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		if (request.getParameter("MId") == null & request.getParameter("MPwd") == null ) {
			model.addAttribute("msg", "잘못된 접근입니다.");	
			return "/member/member_proc";
		}
		
		dao.member_proc(request.getParameter("MId"), request.getParameter("MPwd"), request.getParameter("MName"), request.getParameter("MEmail"), request.getParameter("MNick"));
		model.addAttribute("msg", "회원가입이 완료되었습니다.");
		return "/member/member_proc";
	}
	
	@RequestMapping("/member/login")
	public String login(Model model) {
		
		return "/member/login";
	}
	
	@RequestMapping("/member/login_out")
	public String login_out(Model model, HttpSession session) {
		session.removeAttribute("login_name");
		model.addAttribute("msg", "로그아웃 되었습니다.");
		return "/member/login_out";
	}
	
	@RequestMapping("/member/login_proc")
	public String login_proc(HttpServletRequest request, Model model, HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		if (request.getParameter("MId") == null & request.getParameter("MPwd") == null ) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "/member/login_proc";
		}
		
		String login_name = dao.login_proc(request.getParameter("MId"), request.getParameter("MPwd") );
		System.out.println(login_name);
		/*기존에 login이란 세션 값이 존재한다면, 기존값을 제거*/
		if ( session.getAttribute("login_name") != null ){
			session.removeAttribute("login_name");
		}
		if (login_name == null || login_name == "") {
			model.addAttribute("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
		}else {
			session.setAttribute("login_name", login_name);
			model.addAttribute("msg", "로그인 되었습니다.");
		}
		
		return "/member/login_proc";
	}

	@RequestMapping("/review/review")
	public String review_list(Model model) {
	//	ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
	//	model.addAttribute("list", dao.review_list());
		
		return "/review/review";
	}
	
	@RequestMapping("/review/review_write")
	public String review_write(Model model) {
		
		return "/review/review_write";
	}
	
	@RequestMapping("/review/review_write_proc")
	public String review_write(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.review_write(request.getParameter("RSubject"), request.getParameter("RComment"), request.getParameter("MId") );
		
		return "/review/review_write_proc";
	}
}
