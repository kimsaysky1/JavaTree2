package org.javatree.www.VO;

public class Notification {
	private String senderid;
	private String receiverid;
	private String message;
	private String regdate;
	private int replyno;
	private int questionno;

	public String getSenderid() {
		return senderid;
	}

	public void setSenderid(String senderid) {
		this.senderid = senderid;
	}

	public String getReceiverid() {
		return receiverid;
	}

	public void setReceiverid(String receiverid) {
		this.receiverid = receiverid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getReplyno() {
		return replyno;
	}

	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}

	public int getQuestionno() {
		return questionno;
	}

	public void setQuestionno(int questionno) {
		this.questionno = questionno;
	}

	@Override
	public String toString() {
		return "Notification [senderid=" + senderid + ", receiverid=" + receiverid + ", message=" + message
				+ ", regdate=" + regdate + ", replyno=" + replyno + ", questionno=" + questionno + "]";
	}

	public Notification(String senderid, String receiverid, String message, String regdate, int replyno,
			int questionno) {
		this.senderid = senderid;
		this.receiverid = receiverid;
		this.message = message;
		this.regdate = regdate;
		this.replyno = replyno;
		this.questionno = questionno;
	}

	public Notification() {
	}

}
