package com.Portfolio.StudyCafe.command;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

import com.Portfolio.StudyCafe.command.Command;
import com.Portfolio.StudyCafe.dao.Dao;

public class DeleteCommand implements Command {
	
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String bId = request.getParameter("bId");
		Dao dao = new Dao();
		dao.delete(bId);
		
	}
}
