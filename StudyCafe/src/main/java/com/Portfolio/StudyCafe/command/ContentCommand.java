package com.Portfolio.StudyCafe.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.Portfolio.StudyCafe.dao.Dao;
import com.Portfolio.StudyCafe.dto.Dto;

public class ContentCommand implements Command {
	
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String bId = request.getParameter("bId");
		
		Dao dao = new Dao();
		Dto dto = dao.contentView(bId);
		
		model.addAttribute("content_view", dto);
		
	}
}
