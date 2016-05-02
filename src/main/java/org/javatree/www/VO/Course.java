package org.javatree.www.VO;

import java.util.ArrayList;

public class Course {
	private int courseno;
	private String coursename;
	private String id;
	private String username;
	private String introdution;
	private String regdate;
	private ArrayList<String> courseTypeList;
	private String teacherid;
	private String lecturename;
	
	public Course() {
	}
	
	public Course(int courseno, String coursename) {
		this.courseno = courseno;
		this.coursename = coursename;
	}
	
	public Course(int courseno, String coursename, String lecturename) {
		super();
		this.courseno = courseno;
		this.coursename = coursename;
		this.lecturename = lecturename;
	}

	public int getCourseno() {
		return courseno;
	}
	public void setCourseno(int courseno) {
		this.courseno = courseno;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
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
	public String getIntrodution() {
		return introdution;
	}
	public void setIntrodution(String introdution) {
		this.introdution = introdution;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public ArrayList<String> getCourseTypeList() {
		return courseTypeList;
	}
	public void setCourseTypeList(ArrayList<String> courseTypeList) {
		this.courseTypeList = courseTypeList;
	}

	public String getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}

	public String getLecturename() {
		return lecturename;
	}

	public void setLecturename(String lecturename) {
		this.lecturename = lecturename;
	}

	public Course(int courseno, String coursename, String id, String username, String introdution, String regdate,
			ArrayList<String> courseTypeList, String teacherid, String lecturename) {
		super();
		this.courseno = courseno;
		this.coursename = coursename;
		this.id = id;
		this.username = username;
		this.introdution = introdution;
		this.regdate = regdate;
		this.courseTypeList = courseTypeList;
		this.teacherid = teacherid;
		this.lecturename = lecturename;
	}

	@Override
	public String toString() {
		return "Course [courseno=" + courseno + ", coursename=" + coursename + ", id=" + id + ", username=" + username
				+ ", introdution=" + introdution + ", regdate=" + regdate + ", courseTypeList=" + courseTypeList
				+ ", teacherid=" + teacherid + ", lecturename=" + lecturename + "]";
	}

	
}
