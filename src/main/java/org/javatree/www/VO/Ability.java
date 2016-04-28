package org.javatree.www.VO;

public class Ability {
	private int value;
	private String id;
	private int typeno;
	
	
	public Ability() {
	}


	public Ability(int value, String id, int typeno) {
		this.value = value;
		this.id = id;
		this.typeno = typeno;
	}


	public int getValue() {
		return value;
	}


	public void setValue(int value) {
		this.value = value;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getTypeno() {
		return typeno;
	}


	public void setTypeno(int typeno) {
		this.typeno = typeno;
	}


	@Override
	public String toString() {
		return "Ability [value=" + value + ", id=" + id + ", typeno=" + typeno + "]";
	}

	

}
	
	
