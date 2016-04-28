package org.javatree.www.Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

//업로드한 파일 저장 & 저장된 파일 삭제
public class FileService implements FilenameFilter {
	/**
	 * File객체, 저장할 경로, 파일명을 전달받아 서버에 파일 저장
	 * @param file	서버에 임시로 업로드된 파일 객체
	 * @param basePath	저장할 경로
	 * @param filename	서버에 임시로 업로드된 파일의 이름
	 * @return	변경 저장된 파일의 이름
	 * @throws IOException
	 */
	
	@Override
	public boolean accept(File dir, String name) {
		// TODO Auto-generated method stub
		return name.toLowerCase().endsWith(".wmv");
	}
	
	
	
	
	/**
	 * 서버에 저장된 파일을 삭제
	 * @param fullpath 저장된 파일의 전체 경로
	 * @return 삭제 성공 여부
	 */
	public boolean fileDelete(String fullpath) {
		boolean check = false;
		
		try {
			File file = new File(fullpath);
			if (file.isFile()) {
				file.delete();
				check = true;
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return check;
	}


	
}
