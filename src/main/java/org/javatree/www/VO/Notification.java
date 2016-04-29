package org.javatree.www.VO;

public class Notification {
	private String senderid;
	private String receiverid;
	private String message;
	private String regdate;
	private int questionno;
	private int notificationno;

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

	public int getQuestionno() {
		return questionno;
	}

	public void setQuestionno(int questionno) {
		this.questionno = questionno;
	}

	public int getNotificationno() {
		return notificationno;
	}

	public void setNotificationno(int notificationno) {
		this.notificationno = notificationno;
	}

	public Notification(String senderid, String receiverid, String message, String regdate, int questionno,
			int notificationno) {
		this.senderid = senderid;
		this.receiverid = receiverid;
		this.message = message;
		this.regdate = regdate;
		this.questionno = questionno;
		this.notificationno = notificationno;
	}

	public Notification() {
	}

}
