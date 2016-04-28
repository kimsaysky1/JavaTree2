package org.javatree.www.VO;

public class Interest {
	private int value;
	private String id;
	private int typeno;

	public Interest() {
	}

	public Interest(String id, int typeno, int value) {
		this.id = id;
		this.typeno = typeno;
		this.value = value;

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
		return "Interest [value=" + value + ", id=" + id + ", typeno=" + typeno + "]";
	}

}
