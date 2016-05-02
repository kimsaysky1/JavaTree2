package org.javatree.www.VO;

public class Coding {
	private int codingno;
	private String codingquestion;
	private String codingtemplet;
	private String codinganswer;
	private String regdate;
	private String id;

	
	public Coding() {
	}
	public Coding(int codingno, String id) {
		this.codingno = codingno;
		this.id = id;
	}
	
	public Coding(int codingno, String codingquestion, String codingtemplet, String codinganswer, String regdate,
			String id) {
		this.codingno = codingno;
		this.codingquestion = codingquestion;
		this.codingtemplet = codingtemplet;
		this.codinganswer = codinganswer;
		this.regdate = regdate;
		this.id = id;
	}
	
	
	public int getCodingno() {
		return codingno;
	}

	public void setCodingno(int codingno) {
		this.codingno = codingno;
	}

	public String getCodingquestion() {
		return codingquestion;
	}

	public void setCodingquestion(String codingquestion) {
		this.codingquestion = codingquestion;
	}

	public String getCodingtemplet() {
		return codingtemplet;
	}

	public void setCodingtemplet(String codingtemplet) {
		this.codingtemplet = codingtemplet;
	}

	public String getCodinganswer() {
		return codinganswer;
	}

	public void setCodinganswer(String codinganswer) {
		this.codinganswer = codinganswer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



	@Override
	public String toString() {
		return "Coding [codingno=" + codingno + ", codingquestion=" + codingquestion + ", codingtemplet="
				+ codingtemplet + ", codinganswer=" + codinganswer + ", regdate=" + regdate + ", id=" + id + "]";
	}

}
