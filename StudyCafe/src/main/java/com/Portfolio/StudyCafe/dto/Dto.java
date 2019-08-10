package com.Portfolio.StudyCafe.dto;

import java.sql.Timestamp;

public class Dto {

	private	int MSeq;
	private String MId;
	private	String MName;
	private	String MPwd;
	private	String MEmail;
	private	Timestamp MRegdate;
	private	String MNick;

	public Dto(int MSeq, String MId, String MPwd, String MEmail, Timestamp MRegdate, String MNick) {
		// TODO Auto-generated constructor stub
		this.MSeq = MSeq;
		this.MId = MId;
		this.MPwd = MPwd;
		this.MEmail = MEmail;
		this.MRegdate =  MRegdate;
		this.MNick = MNick;
	}
	
	public int getMSeq() {
		return MSeq;
	}

	public void setMSeq(int mSeq) {
		MSeq = mSeq;
	}

	public String getMId() {
		return MId;
	}

	public void setMId(String mId) {
		MId = mId;
	}

	public String getMName() {
		return MName;
	}

	public void setMName(String mName) {
		MName = mName;
	}

	public String getMPwd() {
		return MPwd;
	}

	public void setMPwd(String mPwd) {
		MPwd = mPwd;
	}

	public String getMEmail() {
		return MEmail;
	}

	public void setMEmail(String mEmail) {
		MEmail = mEmail;
	}

	public Timestamp getMRegdate() {
		return MRegdate;
	}

	public void setMRegdate(Timestamp mRegdate) {
		MRegdate = mRegdate;
	}

	public String getMNick() {
		return MNick;
	}

	public void setMNick(String mNick) {
		MNick = mNick;
	}
	
	
}
