package com.Portfolio.StudyCafe.dao;

import java.util.ArrayList;

import com.Portfolio.StudyCafe.dto.Dto;
import com.Portfolio.StudyCafe.dto.Login_Dto;

public interface MemberDao {
	
	public ArrayList<Dto> list();
	public ArrayList<Dto> member_edit(String MNick);
	public void member_proc(String MId, String MPwd, String MName , String MEmail, String MNick );
	public String login_proc(String MId, String MPwd);
	public Dto contentView(String strID);
	public void delete(String bId);

}
