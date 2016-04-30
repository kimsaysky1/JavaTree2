package org.javatree.www.VO;

public class Subnote {
	private String id;
	private int subnoteno;
	private String originalfilename;
	private String uploadedfilename;
	private int lectureno;
	private int courseno;
	
	public Subnote() {
		super();
	}
	
	public Subnote(String id, int subnoteno, String originalfilename, String uploadedfilename, int lectureno,
			int courseno) {
		super();
		this.id = id;
		this.subnoteno = subnoteno;
		this.originalfilename = originalfilename;
		this.uploadedfilename = uploadedfilename;
		this.lectureno = lectureno;
		this.courseno = courseno;
	}


	public int getCourseno() {
		return courseno;
	}


	public void setCourseno(int courseno) {
		this.courseno = courseno;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSubnoteno() {
		return subnoteno;
	}
	public void setSubnoteno(int subnoteno) {
		this.subnoteno = subnoteno;
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
	public int getLectureno() {
		return lectureno;
	}
	public void setLectureno(int lectureno) {
		this.lectureno = lectureno;
	}
	@Override
	public String toString() {
		return "Subnote [id=" + id + ", subnoteno=" + subnoteno + ", originalfilename=" + originalfilename
				+ ", uploadedfilename=" + uploadedfilename + ", lectureno=" + lectureno + "]";
	}
	
	
}
