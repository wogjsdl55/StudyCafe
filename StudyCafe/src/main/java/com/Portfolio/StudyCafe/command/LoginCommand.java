package com.Portfolio.StudyCafe.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.Portfolio.StudyCafe.dao.Dao;
import com.Portfolio.StudyCafe.dto.Dto;

public class LoginCommand implements Command {
	
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		Dao dao = new Dao();
		ArrayList<Dto> dtos = dao.list();
		model.addAttribute("login", dtos);
		
	}

}
