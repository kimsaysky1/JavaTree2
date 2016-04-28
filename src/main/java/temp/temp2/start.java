package temp.temp2;

import java.util.ArrayList;

public class start {

	public static void main(String[] args) {
		Human h = new Human("김영호", 29);
		ArrayList<Human> hList = new ArrayList<Human>();
		hList.add(h);
		Course c = new Course("자바 강의", hList);
		System.out.println(c);
	}

}
