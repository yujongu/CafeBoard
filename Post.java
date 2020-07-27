package com.yujongu;

import java.sql.Date;

public class Post {
	
	private String title;
	private String content;
	private String writer;
	private Date writtenDate;
	
	
	
	public Post(String title, String content, String writer) {
		this.title = title;
		this.content = content;
		this.writer = writer;
	}
	public Post(String title, String content, String writer, Date date) {
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writtenDate = date;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}

	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}
	
	
	
	

}
