package org.javatree.www.VO;

public class Error {
	private String errorname;
	private String response;
	
	public Error() {
		super();
	}
	public Error(String errorname, String response) {
		this.errorname = errorname;
		this.response = response;
	}
	public String getErrorname() {
		return errorname;
	}
	public void setErrorname(String errorname) {
		this.errorname = errorname;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	@Override
	public String toString() {
		return "Error [errorname=" + errorname + ", response=" + response + "]";
	}
	
	
}
