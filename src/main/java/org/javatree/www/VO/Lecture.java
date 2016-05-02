package org.javatree.www.VO;

import java.util.ArrayList;

public class Lecture {
	private int courseno;
	private int lectureno;
	private String lecturename;
	private String regdate;
	private String originalfilename;
	private String uploadedfilename;
	private String startdate;
	private String enddate;
	private String coursename; //강좌의 이름을 받아오는 변수
	private String introdution; //강좌의 소개를 받아오는 변수
	private String studying; //수강신청한 강의 인지 체크하는 변수
	private String teacherid; //수강신청시 사용한 강사 아이디 변수
	private String subnoteName;
	/*private ArrayList<Lecture> lectureList;*/
	private ArrayList<Coding> codingList;
	
	
	public Lecture() {
	}
	
	public Lecture(String lecturename, String coursename) {
		super();
		this.lecturename = lecturename;
		this.coursename = coursename;
	}


	
	public Lecture(int courseno, int lectureno, String lecturename, String regdate, String originalfilename,
			String uploadedfilename, String startdate, String enddate, String coursename, String introdution,
<<<<<<< HEAD
			String studying, String teacherid, String subnoteName) {
=======
			String studying, String teacherid, ArrayList<Coding> codingList) {
>>>>>>> dc09945ebdcb01fde54096b1fa5ea645d72a89ee
		super();
		this.courseno = courseno;
		this.lectureno = lectureno;
		this.lecturename = lecturename;
		this.regdate = regdate;
		this.originalfilename = originalfilename;
		this.uploadedfilename = uploadedfilename;
		this.startdate = startdate;
		this.enddate = enddate;
		this.coursename = coursename;
		this.introdution = introdution;
		this.studying = studying;
		this.teacherid = teacherid;
<<<<<<< HEAD
		this.subnoteName = subnoteName;
=======
		this.codingList = codingList;
>>>>>>> dc09945ebdcb01fde54096b1fa5ea645d72a89ee
	}

	public int getCourseno() {
		return courseno;
	}

	public void setCourseno(int courseno) {
		this.courseno = courseno;
	}

	public int getLectureno() {
		return lectureno;
	}

	public void setLectureno(int lectureno) {
		this.lectureno = lectureno;
	}

	public String getLecturename() {
		return lecturename;
	}

	public void setLecturename(String lecturename) {
		this.lecturename = lecturename;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getOriginalfilename() {
		return originalfilename;
	}

	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}

	public String getUploadedfilename() {
		return uploadedfilename;
	}

	public void setUploadedfilename(String uploadedfilename) {
		this.uploadedfilename = uploadedfilename;
	}



	public String getStartdate() {
		return startdate;
	}



	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}



	public String getEnddate() {
		return enddate;
	}



	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getIntrodution() {
		return introdution;
	}

	public void setIntrodution(String introdution) {
		this.introdution = introdution;
	}

	public String getStudying() {
		return studying;
	}

	public void setStudying(String studying) {
		this.studying = studying;
	}
	
	
	public String getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}

<<<<<<< HEAD
	public String getSubnoteName() {
		return subnoteName;
	}

	public void setSubnoteName(String subnoteName) {
		this.subnoteName = subnoteName;
=======
	public ArrayList<Coding> getCodingList() {
		return codingList;
	}

	public void setCodingList(ArrayList<Coding> codingList) {
		this.codingList = codingList;
>>>>>>> dc09945ebdcb01fde54096b1fa5ea645d72a89ee
	}

	@Override
	public String toString() {
		return "Lecture [courseno=" + courseno + ", lectureno=" + lectureno + ", lecturename=" + lecturename
				+ ", regdate=" + regdate + ", originalfilename=" + originalfilename + ", uploadedfilename="
				+ uploadedfilename + ", startdate=" + startdate + ", enddate=" + enddate + ", coursename=" + coursename
				+ ", introdution=" + introdution + ", studying=" + studying + ", teacherid=" + teacherid
<<<<<<< HEAD
				+ ", subnoteName=" + subnoteName + "]";
	}

=======
				+ ", codingList=" + codingList + "]";
	}

	

	
>>>>>>> dc09945ebdcb01fde54096b1fa5ea645d72a89ee
}
