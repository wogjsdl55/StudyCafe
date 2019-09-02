package com.Portfolio.StudyCafe.dao;

import java.security.Timestamp;
import java.util.ArrayList;

import com.Portfolio.StudyCafe.dto.Dto;
import com.Portfolio.StudyCafe.dto.Review_Dto;

public interface ReviewDao {
	public ArrayList<Review_Dto> review_list();
	public void review_write(String RSubject, String RComment, int MStar, String MId, String MNick);
	public ArrayList<Review_Dto> review_view(int RSeq);
	public void review_view_count(int RSeq);
	public void review_reply_proc(int RSeq, String ReComment, String MNick);
	public ArrayList<Review_Dto> reply_list(int RSeq);
}

