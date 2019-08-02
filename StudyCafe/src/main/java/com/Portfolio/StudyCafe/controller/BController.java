package com.Portfolio.StudyCafe.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Portfolio.StudyCafe.command.Command;
import com.Portfolio.StudyCafe.command.ContentCommand;
import com.Portfolio.StudyCafe.command.DeleteCommand;
import com.Portfolio.StudyCafe.command.ListCommand;
import com.Portfolio.StudyCafe.command.LoginCommand;
import com.Portfolio.StudyCafe.command.ModifyCommand;
import com.Portfolio.StudyCafe.command.ReplyCommand;
import com.Portfolio.StudyCafe.command.WriteCommand;
import com.Portfolio.StudyCafe.util.Constant;

/**
 * Servlet implementation class BoardFrontController
 */

@Controller
public class BController {

	Command command = null;
	
	private JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		System.out.println("list()");
		command = new ListCommand();
		command.execute(model);
		
		return "list";
	}
	
	@RequestMapping("/write_view")
	public String write_view(Model model) {
		System.out.println("write_view()");
		
		return "write_view";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		model.addAttribute("request", request);
		command = new WriteCommand();
		command.execute(model);
		
		return "redirect:list";
	}
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model){
		System.out.println("content_view()");
		
		model.addAttribute("request", request);
		command = new ContentCommand();
		command.execute(model);
		
		return "content_view";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST )
	public String modify(HttpServletRequest request, Model model){
		System.out.println("modify()");
		
		model.addAttribute("request", request);
		command = new ModifyCommand();
		command.execute(model);
		
		return "redirect:list";
	}
	
	
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request, Model model) {
		System.out.println("reply()");
		
		model.addAttribute("request", request);		
		command = new ReplyCommand();
		command.execute(model);
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");
		
		model.addAttribute("request", request);
		command = new DeleteCommand();
		command.execute(model);
		
		return "redirect:list";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		System.out.println("login()");
		
		command = new LoginCommand();
		command.execute(model);
		
		return "login";
	}
	
}
