package org.javatree.www.DAO;

import java.util.List;

import org.javatree.www.VO.Coding;

public interface CompilerDAO {

	List<Coding> selectCodingList(int lectureno);
	Coding callSpecificCoding(int codingno);
	String selectPath(int lectureno);

}
