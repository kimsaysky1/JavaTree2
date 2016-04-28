package org.javatree.www.VO;

public class Rereply {
	private int replyno;
	private String id;
	private String content;
	private String regdate;
	private String username;

	public Rereply() {
	}

	public Rereply(int replyno, String id, String content, String regdate, String username) {
		this.replyno = replyno;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
		this.username = username;
	}

	public int getReplyno() {
		return replyno;
	}

	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Rereply [replyno=" + replyno + ", id=" + id + ", content=" + content + ", regdate=" + regdate
				+ ", username=" + username + "]";
	}

}
