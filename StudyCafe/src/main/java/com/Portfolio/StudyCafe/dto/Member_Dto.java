package com.Portfolio.StudyCafe.dto;

public class Member_Dto {
	
	private int MSeq;
	private String MId;
	private String MPwd;
	private	String MNick;
	private	String MName;
	private	String MEmail;
	
	public Member_Dto() {
		// TODO Auto-generated constructor stub
	}
	
	public Member_Dto(int MSeq, String MId, String MPwd, String MNick, String MName, String MEmail) {
		this.MSeq = MSeq;
		this.MId = MId;
		this.MPwd = MPwd;
		this.MNick = MNick;
		this.MName = MName;
		this.MEmail = MEmail;
	}

	public String getMPwd() {
		return MPwd;
	}

	public void setMPwd(String mPwd) {
		MPwd = mPwd;
	}

	public String getMName() {
		return MName;
	}

	public void setMName(String mName) {
		MName = mName;
	}

	public String getMEmail() {
		return MEmail;
	}

	public void setMEmail(String mEmail) {
		MEmail = mEmail;
	}

	public String getMId() {
		return MId;
	}

	public int getMSeq() {
		return MSeq;
	}

	public void setMSeq(int mSeq) {
		MSeq = mSeq;
	}

	public void setMId(String mId) {
		MId = mId;
	}

	public String getMNick() {
		return MNick;
	}

	public void setMNick(String mNick) {
		MNick = mNick;
	}

}
