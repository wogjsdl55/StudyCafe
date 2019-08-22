package com.Portfolio.StudyCafe.dao;

import java.util.ArrayList;

import com.Portfolio.StudyCafe.dto.Dto;
import com.Portfolio.StudyCafe.dto.Member_Dto;

public interface MemberDao {
	
	public ArrayList<Member_Dto> member_edit(int MSeq);
	public ArrayList<Member_Dto> login_proc(String MId, String MPwd);
	public void member_proc(String MId, String MPwd, String MName , String MEmail, String MNick );
	public void member_edit_proc(int MSeq, String MId, String MPwd, String MName , String MEmail, String MNick );

}
