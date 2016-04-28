package temp.temp2;

import java.util.ArrayList;

public class Course {

	private String name;
	private ArrayList<Human> humanList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<Human> getHumanList() {
		return humanList;
	}

	public void setHumanList(ArrayList<Human> humanList) {
		this.humanList = humanList;
	}

	public Course(String name, ArrayList<Human> humanList) {
		this.name = name;
		this.humanList = humanList;
	}

	@Override
	public String toString() {
		return "Course [name=" + name + ", humanList=" + humanList + "]";
	}

}
