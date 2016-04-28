package org.javatree.www.VO;

import java.util.ArrayList;

public class Question {
	private int typeno;
	private int questionno;
	private String id;
	private String username;
	private String title;
	private String content;
	private String regdate;
	private int hitcount;
	private int curious;
	private int codingno;
	private ArrayList<Reply> replyList;

	public Question() {
		super();
	}

	public int getCodingno() {
		return codingno;
	}

	public void setCodingno(int codingno) {
		this.codingno = codingno;
	}

	public int getTypeno() {
		return typeno;
	}

	public void setTypeno(int typeno) {
		this.typeno = typeno;
	}

	public int getQuestionno() {
		return questionno;
	}

	public void setQuestionno(int questionno) {
		this.questionno = questionno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public int getCurious() {
		return curious;
	}

	public void setCurious(int curious) {
		this.curious = curious;
	}

	public ArrayList<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(ArrayList<Reply> replyList) {
		this.replyList = replyList;
	}

	@Override
	public String toString() {
		return "Question [typeno=" + typeno + ", questionno=" + questionno + ", id=" + id + ", username=" + username
				+ ", title=" + title + ", content=" + content + ", regdate=" + regdate + ", hitcount=" + hitcount
				+ ", curious=" + curious + ", codingno=" + codingno + ", replyList=" + replyList + "]";
	}

	public Question(int typeno, int questionno, String id, String username, String title, String content,
			String regdate, int hitcount, int curious, int codingno, ArrayList<Reply> replyList) {
		this.typeno = typeno;
		this.questionno = questionno;
		this.id = id;
		this.username = username;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.hitcount = hitcount;
		this.curious = curious;
		this.codingno = codingno;
		this.replyList = replyList;
	}

}
