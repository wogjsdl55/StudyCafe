package com.Portfolio.StudyCafe.dto;

import java.security.Timestamp;

public class Review_Dto {
	
	private	int RSeq;
	private	String RSubject;
	private	String RComment;
	private	int RView;
	private	Timestamp RRegdate;
	private	String MId;
	private	String MNick;
	private	int RStar;
	private String ReComment;
	private Timestamp ReRegdate;
	
	public Timestamp getReRegdate() {
		return ReRegdate;
	}

	public void setReRegdate(Timestamp reRegdate) {
		ReRegdate = reRegdate;
	}

	public String getReComment() {
		return ReComment;
	}

	public void setReComment(String reComment) {
		ReComment = reComment;
	}

	public Review_Dto() {
		// TODO Auto-generated constructor stub
	}
	
	public Review_Dto(int RSeq, String RSubject, String RComment, int RView, Timestamp RRegdate, int RStar, String MId, String MNick, String ReComment, Timestamp ReRegdate ) {
		this.RSeq = RSeq;
		this.RSubject = RSubject;
		this.RComment = RComment;
		this.RView = RView;
		this.RRegdate = RRegdate;
		this.MId = MId;
		this.MNick = MNick;
		this.RStar = RStar;
		this.ReComment = ReComment;
		this.ReRegdate = ReRegdate;
	}

	public int getRStar() {
		return RStar;
	}

	public void setRStar(int rStar) {
		RStar = rStar;
	}

	public String getMNick() {
		return MNick;
	}

	public void setMNick(String mNick) {
		MNick = mNick;
	}

	public int getRSeq() {
		return RSeq;
	}

	public void setRSeq(int rSeq) {
		RSeq = rSeq;
	}

	public String getRSubject() {
		return RSubject;
	}

	public void setRSubject(String rSubject) {
		RSubject = rSubject;
	}

	public String getRComment() {
		return RComment;
	}

	public void setRComment(String rComment) {
		RComment = rComment;
	}

	public int getRView() {
		return RView;
	}

	public void setRView(int rView) {
		RView = rView;
	}

	public Timestamp getRRegdate() {
		return RRegdate;
	}

	public void setRRegdate(Timestamp rRegdate) {
		RRegdate = rRegdate;
	}

	public String getMId() {
		return MId;
	}

	public void setMId(String mId) {
		MId = mId;
	}
}
