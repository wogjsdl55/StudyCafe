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
import com.Portfolio.StudyCafe.command.MemberCommand;
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
	
}
