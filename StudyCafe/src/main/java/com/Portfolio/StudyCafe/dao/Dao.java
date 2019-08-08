package com.Portfolio.StudyCafe.dao;

import java.util.ArrayList;

import com.Portfolio.StudyCafe.dto.Dto;

public interface Dao {
	
	public ArrayList<Dto> list();
	public void member_proc(String MId, String MPwd, String MName , String MEmail, String MNick );
	public Dto login_proc(String MId, String MPwd );
	public Dto contentView(String strID);
	public void delete(String bId);

}
