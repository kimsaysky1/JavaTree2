package org.javatree.www.VO;

public class Bookmark {
	private String chaptername;
	private int chaptertime;
	private int lectureno;
	
	public Bookmark() {
	}

	public Bookmark(String chaptername, int chaptertime, int lectureno) {
		super();
		this.chaptername = chaptername;
		this.chaptertime = chaptertime;
		this.lectureno = lectureno;
	}

	public String getChaptername() {
		return chaptername;
	}

	public void setChaptername(String chaptername) {
		this.chaptername = chaptername;
	}

	public int getChaptertime() {
		return chaptertime;
	}

	public void setChaptertime(int chaptertime) {
		this.chaptertime = chaptertime;
	}

	public int getLectureno() {
		return lectureno;
	}

	public void setLectureno(int lectureno) {
		this.lectureno = lectureno;
	}

	@Override
	public String toString() {
		return "Bookmark [chaptername=" + chaptername + ", chaptertime=" + chaptertime + ", lectureno=" + lectureno
				+ "]";
	}
	
	
}
