package com.gogh.DTO;

import java.sql.Date;

public class MemberDTO {
	private String mid;
	private String mpw;
	private String mname;
	private String mphone;
	private String mjuso;
	private String memail;
	private String mbirth;
	private Date regdate;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberDTO(String mid, String mpw) {
		super();
		this.mid = mid;
		this.mpw = mpw;
	}
	
	public MemberDTO(String mid, String mpw, String mname, String memail) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.memail = memail;
	}
	
	public MemberDTO(String mid, String mname, String mphone, String mjuso, String memail, String mbirth) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.mphone = mphone;
		this.mjuso = mjuso;
		this.memail = memail;
		this.mbirth = mbirth;
	}
	
	public MemberDTO(String mid, String mpw, String mname, String mphone, String mjuso, String memail, String mbirth,
			Date regdate) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mphone = mphone;
		this.mjuso = mjuso;
		this.memail = memail;
		this.mbirth = mbirth;
		this.regdate = regdate;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getMpw() {
		return mpw;
	}


	public void setMpw(String mpw) {
		this.mpw = mpw;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getMphone() {
		return mphone;
	}


	public void setMphone(String mphone) {
		this.mphone = mphone;
	}


	public String getMjuso() {
		return mjuso;
	}


	public void setMjuso(String mjuso) {
		this.mjuso = mjuso;
	}


	public String getMemail() {
		return memail;
	}


	public void setMemail(String memail) {
		this.memail = memail;
	}


	public String getMbirth() {
		return mbirth;
	}


	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
