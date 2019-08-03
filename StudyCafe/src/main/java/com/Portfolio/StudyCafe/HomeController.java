package com.Portfolio.StudyCafe;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Portfolio.StudyCafe.command.ContentCommand;
import com.Portfolio.StudyCafe.command.DeleteCommand;
import com.Portfolio.StudyCafe.command.ListCommand;
import com.Portfolio.StudyCafe.command.LoginCommand;
import com.Portfolio.StudyCafe.command.MemberCommand;
import com.Portfolio.StudyCafe.command.ModifyCommand;
import com.Portfolio.StudyCafe.command.ReplyCommand;
import com.Portfolio.StudyCafe.command.WriteCommand;
import com.Portfolio.StudyCafe.dao.Dao;
import com.Portfolio.StudyCafe.dto.Dto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	Dao dao;
	
	@Autowired
	public void setDao(Dao dao) {
		this.dao = dao;
	}
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
		ArrayList<Dto> dtos = dao.listDao();
		model.addAttribute("list", dtos);
		
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
		dao.write(request.getParameter("bName"), request.getParameter("bTitle"), request.getParameter("bContent"));
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
	public String member_proc(HttpServletRequest request, Model model) {
		dao.member_proc(request.getParameter("MId"), request.getParameter("MPwd"), request.getParameter("MName"), request.getParameter("MEmail"), request.getParameter("MNick"));
		
		return "/";
	}
	
}
