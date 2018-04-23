package com.gogh.DTO;

import java.util.Date;

public class BoardDTO {
    private int bno;
	private String title;
	private String contents;
	private String writer;
	//날짜만 받고 싶으면 sql로 임폴트하고 시간까지 받고 싶으면 util로 임폴트한다.
	private Date regdate;
	private int viewcnt;
	private int goodcnt;
	private int replycnt;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	public BoardDTO(int bno, String title, String contents) {
		super();
		this.bno = bno;
		this.title = title;
		this.contents = contents;
	}
	
	public BoardDTO(String title, String contents, String writer) {
		super();
		this.title = title;
		this.contents = contents;
		this.writer = writer;
	}

	
	public BoardDTO(int bno, String title, String contents, String writer, Date regdate, int viewcnt) {
		super();
		this.bno = bno;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getwriter() {
		return writer;
	}

	public void setwriter(String writer) {
		this.writer = writer;
	}

	public Date getregdate() {
		return regdate;
	}

	public void setregdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getGoodcnt() {
		return goodcnt;
	}

	public void setGoodcnt(int goodcnt) {
		this.goodcnt = goodcnt;
	}
	
	
	
	
}
