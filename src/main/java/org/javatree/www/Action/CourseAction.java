package org.javatree.www.Action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.type.IntegerTypeHandler;
import org.apache.struts2.interceptor.SessionAware;
import org.javatree.www.DAO.QnaDAO;
import org.javatree.www.DAO.courseDAO;
import org.javatree.www.Util.PageNavigator;
import org.javatree.www.VO.Coding;
import org.javatree.www.VO.Error;

import org.javatree.www.VO.Course;
import org.javatree.www.VO.Lecture;
import org.javatree.www.VO.Member_jt;
import org.javatree.www.VO.Question;
import org.javatree.www.VO.Subnote;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;


public class CourseAction extends ActionSupport implements SessionAware {
	
	/**
	 * 	Value Stack 에서 사용할 멤버를 선언,
		setter getter 주고받는것들. 꼭만들어줘야한다.
	 * 
	 * **/
	private String str;
	private String message;
	private Coding coding;
	private Course course;
	private Lecture lecture;
	private ArrayList<Coding> codingList;
	private ArrayList<Course> teachCourseList;
	private ArrayList<Course> courseList;

	private ArrayList<Lecture> lectureList;
	private Member_jt member_jt;
	private Question question;
	private Error error;
	private String id;
	private String username;
	private int courseno;
	private int lectureno;
	private int codingno;
	private String content;
	private String introdution;
	private String coursename;
	private String teacherid;
	private boolean check;
	
	private PageNavigator navi;
	private int currentPage;
	private int page;
	private int total;
	
	private String order;
	
	private ArrayList<Course> recentRank;
	private ArrayList<Course> allRank;
	private String interestString;
	
	private String purejava;
	private String web;
	private String mobile;
	private String iot;
	private String swing;
	private String jdbc;
	private String api;
	private String spring;
	private String struts;
	private String etcframework;
	private String ect;
	private ArrayList<String> courseTypeList;
	private String lecturename;
	private String regdate;
	private String uploadedfilename, originalfilename;
	private Subnote subnote;
	private String mycode;
	
	//private static final String UploadPath="E://apache-tomcat-8.0.32-windows-x64/apache-tomcat-8.0.32/wtpwebapps/JavaTree/resources/upload/";
	//private static final String UploadPath="C://apache-tomcat-8.0.32/wtpwebapps/JavaTree/resources/upload/";
	//private static final String UploadPath="C://upload/";
	private static final String UploadPath="C://apache-tomcat-8.0.33/webapps/javatree/resources/upload/";
	private static final String UploadPath2="C://upload/";
	private File directoryPath;
	private File saveFile;
	
	private List<File> upload = new ArrayList<File>();
	private List<String> uploadFileName = new ArrayList<String>();
	private List<String> uploadContentType = new ArrayList<String>();
	private ArrayList<Lecture> recentlyCompletedLectureList;
	private ArrayList<Lecture> latelyPurchasedLectureList;
	Map<String, Object> session;
	
	@Autowired
	SqlSession sqlSession;
	private courseDAO dao;
	private int start;
	private int end;
	private int endPageGroup;
	
	private ArrayList<String> codingListForInsert ;	
	
	private String contentType;
	private String contentDisposition;
	private InputStream inputStream;
	private long contentLength;
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	private String searchText;
	private ArrayList<Course> recourseList;
	private ArrayList<String> interestList;
	private String codingquestion;
	
	private ArrayList<String> codingnoListforCheck;
	private String filename;
	
	ArrayList<Coding> checkCoding= new ArrayList<>();
	
	
	private static final Logger logger = LoggerFactory.getLogger(CourseAction.class);
	
	public String plusStudyMain2() {
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		Map <String,Object> gong = new HashMap();
		if(session.get("loginId") != null){
			gong.put("id", (String)session.get("loginId"));
		}
		
		int countPerPage = (int) session.get("CountPerPage");		//페이지당 글목록 수
		
		System.out.println("currentPage>> " + currentPage);
		session.put("currentPage", currentPage);
		
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		gong.put("start", start);
		gong.put("end", end);
		
		courseList = dao.pagingStudyCourse(gong);
		
		for (int i = 0; i < courseList.size(); i++) {
			
			for (int j = 0; j < courseList.get(i).getCourseTypeList().size(); j++) {
				
				String key = courseList.get(i).getCourseTypeList().get(j);
				
				switch (key) {
				case "1":
					courseList.get(i).getCourseTypeList().set(j, "Purejava");
					break;
				case "2":
					courseList.get(i).getCourseTypeList().set(j, "Web");
					break;
				case "3":
					courseList.get(i).getCourseTypeList().set(j, "Mobile");
					break;
				case "4":
					courseList.get(i).getCourseTypeList().set(j, "IOT");
					break;
				case "5":
					courseList.get(i).getCourseTypeList().set(j, "Swing");
					break;
				case "6":
					courseList.get(i).getCourseTypeList().set(j, "JDBC");
					break;
				case "7":
					courseList.get(i).getCourseTypeList().set(j, "API");
					break;
				case "8":
					courseList.get(i).getCourseTypeList().set(j, "Spring");
					break;
				case "9":
					courseList.get(i).getCourseTypeList().set(j, "Struts");
					break;
				case "10":
					courseList.get(i).getCourseTypeList().set(j, "etcFramework");
					break;
				case "11":
					courseList.get(i).getCourseTypeList().set(j, "etc");
					break;
				default:
					break;
				}
				
			}
			
		}
		
		ArrayList<String> tempList1 = new ArrayList<>();
		tempList1 =  dao.selectLatelyPurchasedLectureList1(gong);
		ArrayList<String> tempList2 = new ArrayList<>();
		tempList2 =  dao.selectLatelyPurchasedLectureList2(gong);
		
		latelyPurchasedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList1.size(); i++) {
			Lecture l = new Lecture(tempList1.get(i), tempList2.get(i));
			latelyPurchasedLectureList.add(l);
		}
		
		ArrayList<String> tempList3 = new ArrayList<>();
		tempList3 =  dao.recentlyCompletedLectureList1(gong);
		ArrayList<String> tempList4 = new ArrayList<>();
		tempList4 =  dao.recentlyCompletedLectureList2(gong);
		
		recentlyCompletedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList3.size(); i++) {
			Lecture l = new Lecture(tempList3.get(i), tempList4.get(i));
			recentlyCompletedLectureList.add(l);
		}
		
		session.put("currentPage", currentPage);
		
		session.put("pend", end);
		session.put("pstart", start);
		session.put("operation", "plusStudyMain2");
		session.put("pcurrentPage", currentPage);
		
		return SUCCESS;
	}
	
	public String selectListForSlide() {
		
		start = 1;
		end = 2;
		currentPage = 1;
		int countPerPage = 2;
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		kong.put("courseno", courseno);
		if(session.get("loginId") != null){
			kong.put("id", (String)session.get("loginId"));
		}
		
		int totalRecordsCount = dao.selectCourseDefaultDetailTotal(kong);
		System.out.println("total>> " + totalRecordsCount);
		if(totalRecordsCount != 0){
					//페이지당 글목록 수
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			
			if(currentPage == 0){
				currentPage = 1;
			}
					
			ArrayList<Lecture> tempList = new ArrayList<>();
			ArrayList<Lecture> tempList2 = new ArrayList<>();
			//tempList = dao.selectCourseDetailForStudy(kong);
			tempList = dao.selectWatchingLecture(kong);
			System.out.println("tempList>> " + tempList);
			tempList2 = dao.selectWatchingLecture1(kong);
			lectureList = new ArrayList<>();
			
			for (int i = 0; i < tempList.size(); i++) {
				for (int j = 0; j < tempList2.size(); j++) {
					if(tempList.get(i).getLectureno() == tempList2.get(j).getLectureno()){
						tempList.get(i).setUploadedfilename(tempList2.get(j).getUploadedfilename());
						//subnote 붙이기
					}
				}
			}
			
			
			if(end > tempList.size()){
				end = tempList.size();			
			}
			
			for (int i = start; i < end+1; i++) {
				lectureList.add(tempList.get(i-1));
			}
			
			//coursename = lectureList.get(0).getCoursename();
			//introdution = lectureList.get(0).getIntrodution();
		}else{
			if(endPageGroup == 0) endPageGroup = 1;
			/*lecture = dao.selectCourseForDetail(courseno);
			coursename = lecture.getCoursename();
			introdution = lecture.getIntrodution();*/
		}
		
		//session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		//session.put("endPageGroup", endPageGroup);
		System.out.println("leclist>> " + lectureList);
		return SUCCESS;
	}
	
	
	public String DownLoadFile() throws Exception {
		System.out.println("lectureno: "+getLectureno());
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		String uploadid = dao.selectUploadedFileName(lectureno);
		System.out.println("lecture: >> " + uploadid);
		
		String inputPath = UploadPath2 + uploadid+ "/"+uploadedfilename;
		File file = new File(inputPath);
		System.out.println("inputPath>> " + inputPath + "~~ " + "filename>> " + uploadedfilename);
		setContentLength(file.length());
		
		//contentDisposition 다운로드 창을 띄우는 부분
		setContentDisposition("attachment; filename=" + URLEncoder.encode(uploadedfilename, "UTF-8"));
		
		setInputStream(new FileInputStream(inputPath));

		return SUCCESS;
	}
	/**
	 * courseDefaultMain - 분야별 검색
	 * **/
	
	public String selectListbyField(){
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		ArrayList<String> interestList = new ArrayList<>();
		
		StringTokenizer st = new StringTokenizer(interestString, ",");
		
		while (st.hasMoreTokens()) {
			interestList.add(st.nextToken());
		}
		
		Map<String, Object> kong = new HashMap<>();
		
		for (int i = 0; i < interestList.size(); i++) {
			kong.put("interest"+i, interestList.get(i));
		}
		
		kong.put("order", order);
		start = 1;
		end = 7;
		currentPage = 1;
		
		kong.put("start", start);
		kong.put("end", end);
		
		int totalRecordsCount = dao.selectFieldTotal(kong);
		
		int countPerPage = 7;		//페이지당 글목록 수
		endPageGroup = 1;
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		if(currentPage == 0){
			currentPage = 1;
		}
		
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
		courseList= dao.selectListbyField(kong);		
		
		//베스트 강좌 (역대, 최신)
		allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();
		
		//backAction을 위한 세션값
				session.put("pend", end);
				session.put("pstart", start);
				session.put("operation", "selectListbyField");
				session.put("pcurrentPage", currentPage);
				session.put("pCountPerPage", countPerPage);
				session.put("pendPageGroup", endPageGroup);
				session.put("porder", order);
				session.put("interest", interestString);
		
		return SUCCESS;
	}
	
	/**
	 * courseDefaultMain - 분야별 검색 (페이지 이동 할때) 
	 * **/
	
	public String plusSelectListbyField(){
		System.out.println("qna>>"+interestString);
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		ArrayList<String> interestList = new ArrayList<>();
		
		StringTokenizer st = new StringTokenizer(interestString, ",");
		while (st.hasMoreTokens()) {
			interestList.add(st.nextToken());
		}
		
		Map<String, Object> kong = new HashMap<>();
		for (int i = 0; i < interestList.size(); i++) {
			kong.put("interest"+i, interestList.get(i));
		}
		
		int countPerPage = (int) session.get("CountPerPage");		//페이지당 글목록 수
		
		System.out.println("get.currpage>> " + currentPage);
		
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		
		kong.put("start", start);
		kong.put("end", end);
		
		int totalRecordsCount = dao.selectFieldTotal(kong);
		
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		if(currentPage == 0){
			currentPage = 1;
		}
		
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
		
		courseList= dao.selectListbyField(kong);
		
		
		//베스트 강좌 (역대, 최신)
		allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();
		
		session.put("pend", end);
		session.put("pstart", start);
		session.put("operation", "plusSelectListbyField");
		session.put("pcurrentPage", currentPage);
		session.put("pCountPerPage", countPerPage);
		session.put("pendPageGroup", endPageGroup);
		
		return SUCCESS;
	}
	
	/**
	 * courseDefaultMain - 메인페이지 뿌리기 (아이디 받아서 뿌리기)
	 * **/
	public String selectAllCourseList(){
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		//login시 활동들(임시)
		 // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
			if(session.get("loginId") != null){
				String storedid = session.get("loginId").toString();
				
				kong.put("id", storedid);
			}
				
				start = 1;
				end = 7;
				currentPage = 1;
				int countPerPage = 7;		//페이지당 글목록 수
				
				kong.put("start", start);
				kong.put("end", end);
				
				
				int totalRecordsCount = dao.selectDefaultTotal(kong);
				if(totalRecordsCount != 0){
					
				
				
				if(totalRecordsCount % countPerPage == 0 ){
					endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
				}else{
					endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
				}
				
								
				if(currentPage == 0){
					currentPage = 1;
				}
						
				session.put("currentPage", currentPage);
				session.put("CountPerPage", countPerPage);
				session.put("endPageGroup", endPageGroup);
				}else{
					currentPage = 0;
				}
				
				//backAction을 위한 세션값
				session.put("pend", end);
				session.put("pstart", start);
				session.put("operation", "selectAllCourseList");
				session.put("pcurrentPage", currentPage);
				session.put("pCountPerPage", countPerPage);
				session.put("pendPageGroup", endPageGroup);
				
				courseList = dao.pagingCourse(kong);
				
			
			//베스트 강좌 (역대, 최신)
			allRank = dao.selectAllRank();
			recentRank = dao.selectRecentRank();
			
			
		return SUCCESS;
	}
	
	/**
	 * courseDefaultMain - 사이드 검색 창
	 * **/
	public String searchCourse(){
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		int countPerPage = 7;
		//login시 활동들(임시)
		 // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
			
			Map<String, Object> kong = new HashMap<>();
			
			if(searchText.trim().length() > 0){
				searchText = "%"+searchText+"%";
				kong.put("searchText", searchText);
				session.put("searchText", searchText);
			}
			
			start = 1;
			end = 7;
			currentPage = 1;
			
			kong.put("start", start);
			kong.put("end", end);
									
			int totalRecordsCount = dao.selectDefaultTotal(kong);
			if(totalRecordsCount != 0){
				
			
					//페이지당 글목록 수
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
		
			
			courseList = dao.searchCourse(kong);
			
		
		//베스트 강좌 (역대, 최신)
		allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();
		
			}else{
			session.put("currentPage", 0);
		}
		//backAction을 위한 세션값
				session.put("pend", end);
				session.put("pstart", start);
				session.put("operation", "searchCourse");
				session.put("pcurrentPage", currentPage);
				session.put("pCountPerPage", countPerPage);
				session.put("pendPageGroup", endPageGroup);
				session.put("psearchText", searchText);
		
		return SUCCESS;
	}
	
	public String backAction() {
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		if(((String)session.get("operation")).equals("searchCourse") || 
				((String)session.get("operation")).equals("plusSearchCourse")){
			
			
			Map<String, Object> kong = new HashMap<>();
			kong.put("start", Integer.parseInt(session.get("pstart").toString()));
			kong.put("end", Integer.parseInt(session.get("pend").toString()));
			kong.put("searchText", session.get("psearchText").toString());
			
			currentPage = Integer.parseInt(session.get("pcurrentPage").toString());
										
				int totalRecordsCount = dao.selectDefaultTotal(kong);
				
				int countPerPage = 7;		//페이지당 글목록 수

				if(totalRecordsCount % countPerPage == 0 ){
					endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
				}else{
					endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
				}

				if(currentPage == 0){
					currentPage = 1;
				}
				
				session.put("currentPage", currentPage);
				session.put("CountPerPage", countPerPage);
				session.put("endPageGroup", endPageGroup);
				
				
				recourseList = dao.searchCourse(kong);
				
			
			//베스트 강좌 (역대, 최신)
			allRank = dao.selectAllRank();
			recentRank = dao.selectRecentRank();
			
		}else if(((String)session.get("operation")).equals("selectListbyField")
				|| ((String)session.get("operation")).equals("plusSelectListbyField")){
			
			interestList = new ArrayList<String>();
			
			StringTokenizer st = new StringTokenizer(session.get("interest").toString(), ",");
			while (st.hasMoreTokens()) {
				interestList.add(st.nextToken());
			}
			System.out.println("interestlist>> " + interestList);
			Map<String, Object> kong = new HashMap<>();
			for (int i = 0; i < interestList.size(); i++) {
				kong.put("interest"+i, interestList.get(i));
			}
			
			kong.put("order", session.get("porder").toString());
			currentPage = Integer.parseInt(session.get("pcurrentPage").toString());
			
			kong.put("start", (int)session.get("pstart"));
			kong.put("end", (int)session.get("pend"));
			
			int totalRecordsCount = dao.selectFieldTotal(kong);
			
			int countPerPage = 7;		//페이지당 글목록 수
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			if(endPageGroup == 0){
				endPageGroup = 1;
			}
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
			
			recourseList= dao.selectListbyField(kong);
			
			//베스트 강좌 (역대, 최신)
			allRank = dao.selectAllRank();
			recentRank = dao.selectRecentRank();
			
		}else if (((String)session.get("operation")).equals("plusStudyMain2")
				|| ((String)session.get("operation")).equals("studyMainView2")) {
		
			
			Map <String,Object> gong = new HashMap();
			if(session.get("loginId") != null){
				gong.put("id", (String)session.get("loginId"));
			}
			
			int countPerPage = (int) session.get("pCountPerPage");		//페이지당 글목록 수
			
			System.out.println("currentPage>> " + currentPage);
			currentPage = (int)session.get("pcurrentPage");
			
			start = countPerPage*currentPage-(countPerPage-1);
			end = countPerPage*currentPage;
			gong.put("start", start);
			gong.put("end", end);
			
			courseList = dao.pagingStudyCourse(gong);
			
			/*for (int i = 0; i < courseList.size(); i++) {
				
				for (int j = 0; j < courseList.get(i).getCourseTypeList().size(); j++) {
					
					String key = courseList.get(i).getCourseTypeList().get(j);
					
					switch (key) {
					case "1":
						courseList.get(i).getCourseTypeList().set(j, "Purejava");
						break;
					case "2":
						courseList.get(i).getCourseTypeList().set(j, "Web");
						break;
					case "3":
						courseList.get(i).getCourseTypeList().set(j, "Mobile");
						break;
					case "4":
						courseList.get(i).getCourseTypeList().set(j, "IOT");
						break;
					case "5":
						courseList.get(i).getCourseTypeList().set(j, "Swing");
						break;
					case "6":
						courseList.get(i).getCourseTypeList().set(j, "JDBC");
						break;
					case "7":
						courseList.get(i).getCourseTypeList().set(j, "API");
						break;
					case "8":
						courseList.get(i).getCourseTypeList().set(j, "Spring");
						break;
					case "9":
						courseList.get(i).getCourseTypeList().set(j, "Struts");
						break;
					case "10":
						courseList.get(i).getCourseTypeList().set(j, "etcFramework");
						break;
					case "11":
						courseList.get(i).getCourseTypeList().set(j, "etc");
						break;
					default:
						break;
					}
					
				}
				
			}*/
			
			ArrayList<String> tempList1 = new ArrayList<>();
			tempList1 =  dao.selectLatelyPurchasedLectureList1(gong);
			ArrayList<String> tempList2 = new ArrayList<>();
			tempList2 =  dao.selectLatelyPurchasedLectureList2(gong);
			
			latelyPurchasedLectureList = new ArrayList<>();
			
			for (int i = 0; i < tempList1.size(); i++) {
				Lecture l = new Lecture(tempList1.get(i), tempList2.get(i));
				latelyPurchasedLectureList.add(l);
			}
			
			ArrayList<String> tempList3 = new ArrayList<>();
			tempList3 =  dao.recentlyCompletedLectureList1(gong);
			ArrayList<String> tempList4 = new ArrayList<>();
			tempList4 =  dao.recentlyCompletedLectureList2(gong);
			
			recentlyCompletedLectureList = new ArrayList<>();
			
			for (int i = 0; i < tempList3.size(); i++) {
				Lecture l = new Lecture(tempList3.get(i), tempList4.get(i));
				recentlyCompletedLectureList.add(l);
			}
			
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", session.get("pendPageGroup"));
			
			return "STUDY";
		}else{
			
			
			//login시 활동들(임시)
			 // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
				
			Map<String, Object> kong = new HashMap<>();
			
			if(session.get("loginId") != null){
					String storedid = session.get("loginId").toString();
					kong.put("id", storedid);
				}
				
				//베스트 강좌 (역대, 최신)
				allRank = dao.selectAllRank();
				recentRank = dao.selectRecentRank();

				start = 1;
				end = 7;
				currentPage = Integer.parseInt(session.get("pcurrentPage").toString());
				
				kong.put("start", (int)session.get("pstart"));
				kong.put("end", (int)session.get("pend"));
				
				int totalRecordsCount = dao.selectDefaultTotal(kong);
				
				int countPerPage = 7;		//페이지당 글목록 수
				if(totalRecordsCount % countPerPage == 0 ){
					endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
				}else{
					endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
				}
				if(endPageGroup == 0){
					endPageGroup = 1;
				}
				if(currentPage == 0){
					currentPage = 1;
				}
						
				session.put("currentPage", currentPage);
				session.put("CountPerPage", countPerPage);
				session.put("endPageGroup", endPageGroup);
				
				courseList = dao.pagingCourse(kong);
		
		}
		
		return SUCCESS;
	}
	
	/**
	 * courseDefaultMain - 사이드 검색 창(페이지 이동 시)
	 * **/
	
	public String plusSearchCourse(){
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		 // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
			
			Map<String, Object> kong = new HashMap<>();
				//searchText = "%"+searchText+"%";
			if(session.get("searchText") == null) kong.put("searchText", null);
			kong.put("searchText", (String)session.get("searchText"));
			
			start = (currentPage-1)*7 + 1; 
			end = start+6;
			
			kong.put("start", start);
			kong.put("end", end);
			
			int totalRecordsCount = dao.selectDefaultTotal(kong);
			
			int countPerPage = 7;		//페이지당 글목록 수
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
			
			
			courseList = dao.searchCourse(kong);
			
		//베스트 강좌 (역대, 최신)
		allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();
		
		session.put("pend", end);
		session.put("pstart", start);
		session.put("operation", "plusSearchCourse");
		session.put("pcurrentPage", currentPage);
		session.put("pCountPerPage", countPerPage);
		session.put("pendPageGroup", endPageGroup);
		session.put("psearchText", (String)session.get("searchText"));
		
		return SUCCESS;
	}
	
	/**
	 * courseDefaultMain - 메인 페이지 뿌리기(페이지 이동 시)
	 * **/
	public String plusCourseDefaultMain() throws Exception {
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String,Object> gong = new HashMap();
	
		if(session.get("loginId") != null){
			gong.put("id", session.get("loginId").toString());
		}
		
		int countPerPage = (int) session.get("CountPerPage");		//페이지당 글목록 수
		
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		gong.put("start", start);
		gong.put("end", end);
		
		session.put("currentPage", currentPage);
		
		courseList = dao.pagingCourse(gong);
	
		allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();
		
		System.out.println("currpage> " + currentPage + " / endpage> " + (int)session.get("endPageGroup"));
		
		session.put("pend", end);
		session.put("pstart", start);
		session.put("operation", "plusCourseDefaultMain");
		session.put("pcurrentPage", currentPage);
		session.put("pCountPerPage", countPerPage);
		session.put("pendPageGroup", ((int)session.get("endPageGroup")));
		
		return SUCCESS;
	}
	
	
	/**
	 * studytMain - 메인페이지
	 * **/
	public String studyMainView(){
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		//페이지 시작 값, 마지막 값, 현재 페이지 = 1
		start = 1;
		end = 7;
		currentPage = 1;
		int countPerPage = 7;		//페이지당 글목록 수
		
		Map<String, Object> kong = new HashMap<>();
		
		if(((String) session.get("loginId")) != null){
			kong.put("id", (String)session.get("loginId"));
		}
		
		kong.put("start", start);
		kong.put("end", end);
		int totalRecordsCount = dao.selectTotal(kong);
		
		if(totalRecordsCount != 0){
		
		ArrayList<String> tempList1 = new ArrayList<>();
		tempList1 =  dao.selectLatelyPurchasedLectureList1(kong);
		ArrayList<String> tempList2 = new ArrayList<>();
		tempList2 =  dao.selectLatelyPurchasedLectureList2(kong);
		
		latelyPurchasedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList1.size(); i++) {
			Lecture l = new Lecture(tempList1.get(i), tempList2.get(i));
			latelyPurchasedLectureList.add(l);
		}
		
		ArrayList<String> tempList3 = new ArrayList<>();
		tempList3 =  dao.recentlyCompletedLectureList1(kong);
		ArrayList<String> tempList4 = new ArrayList<>();
		tempList4 =  dao.recentlyCompletedLectureList2(kong);
		
		recentlyCompletedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList3.size(); i++) {
			Lecture l = new Lecture(tempList3.get(i), tempList4.get(i));
			recentlyCompletedLectureList.add(l);
		}
	
		courseList = dao.pagingStudyCourse(kong);
		
		for (int i = 0; i < courseList.size(); i++) {
			
			for (int j = 0; j < courseList.get(i).getCourseTypeList().size(); j++) {
				
				String key = courseList.get(i).getCourseTypeList().get(j);
				
				switch (key) {
				case "1":
					courseList.get(i).getCourseTypeList().set(j, "Purejava");
					break;
				case "2":
					courseList.get(i).getCourseTypeList().set(j, "Web");
					break;
				case "3":
					courseList.get(i).getCourseTypeList().set(j, "Mobile");
					break;
				case "4":
					courseList.get(i).getCourseTypeList().set(j, "IOT");
					break;
				case "5":
					courseList.get(i).getCourseTypeList().set(j, "Swing");
					break;
				case "6":
					courseList.get(i).getCourseTypeList().set(j, "JDBC");
					break;
				case "7":
					courseList.get(i).getCourseTypeList().set(j, "API");
					break;
				case "8":
					courseList.get(i).getCourseTypeList().set(j, "Spring");
					break;
				case "9":
					courseList.get(i).getCourseTypeList().set(j, "Struts");
					break;
				case "10":
					courseList.get(i).getCourseTypeList().set(j, "etcFramework");
					break;
				case "11":
					courseList.get(i).getCourseTypeList().set(j, "etc");
					break;
				default:
					break;
				}
				
			}
			
		}
		
		if(session.get("searchText") == null) searchText = null;
		
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		if(currentPage == 0){
			currentPage = 1;
		}
				
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
		}else{
			session.put("currentPage", 0);
		}
		
	/*	session.put("pend", end);
		session.put("pstart", start);
		session.put("operation", "plusSearchCourse");
		session.put("pcurrentPage", currentPage);
		session.put("pCountPerPage", countPerPage);
		session.put("pendPageGroup", endPageGroup);
		session.put("psearchText", (String)session.get("searchText"));*/
		
		return SUCCESS;
		
	}
	
	/**
	 * studytMain - 메인페이지(페이지 이동시)
	 * **/
	public String plusStudyMain() {
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		session.put("currentPage", currentPage);
		if(currentPage == 0){
			currentPage = 1;
		}
		
		Map <String,Object> gong = new HashMap();
		if(session.get("loginId") != null){
			gong.put("id", (String)session.get("loginId"));
		}
		
		if(session.get("searchText") == null) searchText = null;
		int countPerPage = (int) session.get("CountPerPage");		//페이지당 글목록 수
		
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		gong.put("start", start);
		gong.put("end", end);
		
		session.put("currentPage", currentPage);
		courseList = dao.pagingStudyCourse(gong);
		
		for (int i = 0; i < courseList.size(); i++) {
			
			for (int j = 0; j < courseList.get(i).getCourseTypeList().size(); j++) {
				
				String key = courseList.get(i).getCourseTypeList().get(j);
				
				switch (key) {
				case "1":
					courseList.get(i).getCourseTypeList().set(j, "Purejava");
					break;
				case "2":
					courseList.get(i).getCourseTypeList().set(j, "Web");
					break;
				case "3":
					courseList.get(i).getCourseTypeList().set(j, "Mobile");
					break;
				case "4":
					courseList.get(i).getCourseTypeList().set(j, "IOT");
					break;
				case "5":
					courseList.get(i).getCourseTypeList().set(j, "Swing");
					break;
				case "6":
					courseList.get(i).getCourseTypeList().set(j, "JDBC");
					break;
				case "7":
					courseList.get(i).getCourseTypeList().set(j, "API");
					break;
				case "8":
					courseList.get(i).getCourseTypeList().set(j, "Spring");
					break;
				case "9":
					courseList.get(i).getCourseTypeList().set(j, "Struts");
					break;
				case "10":
					courseList.get(i).getCourseTypeList().set(j, "etcFramework");
					break;
				case "11":
					courseList.get(i).getCourseTypeList().set(j, "etc");
					break;
				default:
					break;
				}
				
			}
			
		}
		
		ArrayList<String> tempList1 = new ArrayList<>();
		tempList1 =  dao.selectLatelyPurchasedLectureList1(gong);
		ArrayList<String> tempList2 = new ArrayList<>();
		tempList2 =  dao.selectLatelyPurchasedLectureList2(gong);
		
		latelyPurchasedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList1.size(); i++) {
			Lecture l = new Lecture(tempList1.get(i), tempList2.get(i));
			latelyPurchasedLectureList.add(l);
		}
		
		
		ArrayList<String> tempList3 = new ArrayList<>();
		tempList3 =  dao.recentlyCompletedLectureList1(gong);
		ArrayList<String> tempList4 = new ArrayList<>();
		tempList4 =  dao.recentlyCompletedLectureList2(gong);
		
		recentlyCompletedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList3.size(); i++) {
			Lecture l = new Lecture(tempList3.get(i), tempList4.get(i));
			recentlyCompletedLectureList.add(l);
		}
		
		return SUCCESS;
	}
	
	public String selectCourseDetailForStudy() {
		start = 1;
		end = 10;
		currentPage = 1;
		int countPerPage = 10;
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		kong.put("courseno", courseno);
		if(session.get("loginId") != null){
			kong.put("id", (String)session.get("loginId"));
		}
		
		int totalRecordsCount = dao.selectCourseDefaultDetailTotal(kong);
		System.out.println("total>> " + totalRecordsCount);
		if(totalRecordsCount != 0){
					//페이지당 글목록 수
			
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			
			if(currentPage == 0){
				currentPage = 1;
			}
			
			ArrayList<Lecture> tempList = new ArrayList<>();
			tempList = dao.selectCourseDetailForStudy(kong);
			System.out.println("templist>> " + tempList);
			
			ArrayList<Lecture> tempList2 = new ArrayList<>();
			tempList2 = dao.selectWatchingLecture1(kong);
			System.out.println("templist2>> " + tempList2);
			for (int i = 0; i < tempList.size(); i++) {
				for (int j = 0; j < tempList2.size(); j++) {
					if(tempList.get(i).getLectureno() == tempList2.get(j).getLectureno()){
						tempList.get(i).setSubnoteName(tempList2.get(j).getUploadedfilename());
						//subnote 붙이기
					}
				}
			}
			
			lectureList = new ArrayList<>();
			
			if(end > tempList.size()){
				end = tempList.size();			
			}
			
			for (int i = start; i < end+1; i++) {
				lectureList.add(tempList.get(i-1));
			}
			System.out.println("리스트>>" + lectureList);
			coursename = lectureList.get(0).getCoursename();
			introdution = lectureList.get(0).getIntrodution();
			
		}else{
		
			if(endPageGroup == 0) endPageGroup = 1;
			lecture = dao.selectCourseForDetail(courseno);
			coursename = lecture.getCoursename();
			introdution = lecture.getIntrodution();
		}
		
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		System.out.println("endpage>> " + endPageGroup);
		System.out.println("curpage>> " + currentPage);
		System.out.println("스터디 디테일 courselist>> " + courseList);
		
		return SUCCESS;
	}
	
	public String plusCourseDetailForStudy() {
		
		int countPerPage = 10;
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		kong.put("courseno", courseno);
		if(session.get("loginId") != null){
			kong.put("id", (String)session.get("loginId"));
		}
		
		int totalRecordsCount = dao.selectCourseDefaultDetailTotal(kong);
		System.out.println("total>> " + totalRecordsCount);
		if(totalRecordsCount != 0){
					//페이지당 글목록 수
			
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			
			if(currentPage == 0){
				currentPage = 1;
			}
			
			ArrayList<Lecture> tempList = new ArrayList<>();
			tempList = dao.selectCourseDetailForStudy(kong);
			System.out.println("templist>> " + tempList);
			
			lectureList = new ArrayList<>();
			
			if(end > tempList.size()){
				end = tempList.size();			
			}
			
			for (int i = start; i < end+1; i++) {
				lectureList.add(tempList.get(i-1));
			}
			System.out.println("리스트>>" + lectureList);
			coursename = lectureList.get(0).getCoursename();
			introdution = lectureList.get(0).getIntrodution();
		}else{
			if(endPageGroup == 0) endPageGroup = 1;
			lecture = dao.selectCourseForDetail(courseno);
			coursename = lecture.getCoursename();
			introdution = lecture.getIntrodution();
		}
		
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		System.out.println("endpage>> " + endPageGroup);
		System.out.println("curpage>> " + currentPage);
		
		
		return SUCCESS;
	}
	
	
	/**
	 * CourseDefaultDetail - 강좌 쪽 상세보기 페이지 
	 * **/
	public String selectCourseDefaultDetail() {
		
		start = 1;
		end = 10;
		currentPage = 1;
		int countPerPage = 10;
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		kong.put("courseno", courseno);
		if(session.get("loginId") != null){
			kong.put("id", (String)session.get("loginId"));
		}
		
		int totalRecordsCount = dao.selectCourseDefaultDetailTotal(kong);
		System.out.println("total>> " + totalRecordsCount);
		if(totalRecordsCount != 0){
					//페이지당 글목록 수
			
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			
			if(endPageGroup == 0) endPageGroup = 1;
			
			if(currentPage == 0){
				currentPage = 1;
			}
					
			
			
			ArrayList<Lecture> tempList = new ArrayList<>();
			tempList = dao.selectCourseDefaultDetail(kong);
			
			ArrayList<Lecture> tempList2 = new ArrayList<>();
			tempList2 = dao.selectWatchingLecture1(kong);
			System.out.println("templist2>> " + tempList2);
			for (int i = 0; i < tempList.size(); i++) {
				for (int j = 0; j < tempList2.size(); j++) {
					if(tempList.get(i).getLectureno() == tempList2.get(j).getLectureno()){
						tempList.get(i).setSubnoteName(tempList2.get(j).getUploadedfilename());
						//subnote 붙이기
					}
				}
			}
			
			lectureList = new ArrayList<>();
			
			if(end > tempList.size()){
				end = tempList.size();			
			}
			
			for (int i = start; i < end+1; i++) {
				lectureList.add(tempList.get(i-1));
			}
			
			coursename = lectureList.get(0).getCoursename();
			introdution = lectureList.get(0).getIntrodution();
		}else{
			if(endPageGroup == 0) endPageGroup = 1;
			lecture = dao.selectCourseForDetail(courseno);
			coursename = lecture.getCoursename();
			introdution = lecture.getIntrodution();
		}
		
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		System.out.println("endpage>> " + endPageGroup);
		System.out.println("curpage>> " + currentPage);
		
		return SUCCESS;
	}
	
	/**
	 * CourseDefaultDetail - 강좌 쪽 상세보기 페이지 (페이징)
	 * **/
	
	public String plusCourseDefaultDetail() {
				
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		kong.put("courseno", courseno);
		
		if(session.get("logidId") != null){
			kong.put("id", (String)session.get("loginId"));
		}
		
		int totalRecordsCount = dao.selectCourseDefaultDetailTotal(kong);
		int countPerPage = 10;		//페이지당 글목록 수
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		
		endPageGroup = 1;
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		if(currentPage == 0){
			currentPage = 1;
		}
				
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
		ArrayList<Lecture> tempList = new ArrayList<>();
		tempList = dao.selectCourseDefaultDetail(kong);
		
		ArrayList<Lecture> tempList2 = new ArrayList<>();
		tempList2 = dao.selectWatchingLecture1(kong);
		System.out.println("templist2>> " + tempList2);
		for (int i = 0; i < tempList.size(); i++) {
			for (int j = 0; j < tempList2.size(); j++) {
				if(tempList.get(i).getLectureno() == tempList2.get(j).getLectureno()){
					tempList.get(i).setSubnoteName(tempList2.get(j).getUploadedfilename());
					//subnote 붙이기
				}
			}
		}
		
		lectureList = new ArrayList<>();
		
		if(end > tempList.size()){
			end = tempList.size();			
		}
		
		for (int i = start; i < end+1; i++) {
			lectureList.add(tempList.get(i-1));
		}
		
		coursename = lectureList.get(0).getCoursename();
		introdution = lectureList.get(0).getIntrodution();
		
		return SUCCESS;
	}
	
	/**
	 * CourseDefaultDetail - 강의신청(수강 신청) 
	 * **/
	public String insertLectureForStudy() {
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		
		System.out.println("loginId>> " + session.get("loginId"));
		
		if(session.get("loginId") != null){
			kong.put("id", (String)session.get("loginId"));
		}else{
			message = "수강 신청 실패!";
			return ERROR;
		}
		
		System.out.println("lecno> " + lectureno + " / courseno> " + courseno
				+ " / coursename> " + coursename + "teacherid> " + teacherid);
		
		kong.put("lectureno", lectureno);
		kong.put("courseno", courseno);
		kong.put("coursename", coursename);
		kong.put("teacherid", teacherid);
		int confirm = dao.updateMemberPoint(kong);
		
		System.out.println("confirm>> " + confirm);
		
		if(confirm == 1){
			
			try {
				int k = dao.checkStudyCourse(kong);
				System.out.println("k> " + k);
				if (k == 0) {
					dao.insertLectureForStudy(kong);
				}
				dao.insertLectureForStudy1(kong);
				dao.updateStudentCount(lectureno);
			} catch (Exception e) {
				return ERROR;
			}
			message = "수강 신청 완료!";
		}else {
			return ERROR;
		}
		
		selectCourseDefaultDetail(kong);
		
		return SUCCESS;
	}
	
	public String insertLectureForStudy1() {
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		
		System.out.println("loginId>> " + session.get("loginId"));
		
		if(session.get("loginId") != null){
			kong.put("id", (String)session.get("loginId"));
		}else{
			message = "수강 신청 실패!";
			return ERROR;
		}
		
		System.out.println("lecno> " + lectureno + " / courseno> " + courseno
				+ " / coursename> " + coursename + "teacherid> " + teacherid);
		
		kong.put("lectureno", lectureno);
		kong.put("courseno", courseno);
		kong.put("coursename", coursename);
		kong.put("teacherid", teacherid);
		int confirm = dao.updateMemberPoint(kong);
		
		System.out.println("confirm>> " + confirm);
		
		if(confirm == 1){
			
			try {
				int k = dao.checkStudyCourse(kong);
				System.out.println("k> " + k);
				if (k == 0) {
					dao.insertLectureForStudy(kong);
				}
				dao.insertLectureForStudy1(kong);
				dao.updateStudentCount(lectureno);
			} catch (Exception e) {
				return ERROR;
			}
			message = "수강 신청 완료!";
		}else {
			return ERROR;
		}
		
		selectCourseDefaultDetail(kong);
		
		return SUCCESS;
	}
	
	/**
	 * CourseDefaultDetail - 강좌 쪽 상세보기 페이지 (수강 신청 후 다시 리스트 뿌리면서 들어오기)
	 * **/
		public void selectCourseDefaultDetail(Map<String, Object> kong2) {
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			start = 1;
			end = 10;
			currentPage = 1;
			
			int totalRecordsCount = dao.selectCourseDefaultDetailTotal(kong2);
			
			int countPerPage = 10;		//페이지당 글목록 수
			endPageGroup = 1;
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
		
			ArrayList<Lecture> tempList = new ArrayList<>();
			tempList = dao.selectCourseDefaultDetail(kong2);
			
			ArrayList<Lecture> tempList2 = new ArrayList<>();
			tempList2 = dao.selectWatchingLecture1(kong2);
			System.out.println("templist2>> " + tempList2);
			for (int i = 0; i < tempList.size(); i++) {
				for (int j = 0; j < tempList2.size(); j++) {
					if(tempList.get(i).getLectureno() == tempList2.get(j).getLectureno()){
						tempList.get(i).setSubnoteName(tempList2.get(j).getUploadedfilename());
						//subnote 붙이기
					}
				}
			}
			
			lectureList = new ArrayList<>();
			
			if(end > tempList.size()){
				end = tempList.size();			
			}
			
			for (int i = start; i < end+1; i++) {
				lectureList.add(tempList.get(i-1));
			}
			
			coursename = lectureList.get(0).getCoursename();
			introdution = lectureList.get(0).getIntrodution();
			
	}

		/**
		 * teachMain - 메인 페이지 강좌 리스트 뿌리기 
		 * **/
		public String selectAllCourseListForTeach(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			//페이지 시작 값, 마지막 값, 현재 페이지 = 1
			start = 1;
			end = 7;
			currentPage = 1;
			int countPerPage = 7;		//페이지당 글목록 수
			
			Map<String, Object> kong = new HashMap<>();
			
			if(((String) session.get("loginId")) != null){
				kong.put("id", ((String)session.get("loginId")));
			}
			
			kong.put("start", start);
			kong.put("end", end);
			int totalRecordsCount = dao.selectTeachTotal(kong);
			
			if(totalRecordsCount != 0){
			
			ArrayList<String> tempList1 = new ArrayList<>();
			tempList1 =  dao.selectLatelyPurchasedLectureList1(kong);
			ArrayList<String> tempList2 = new ArrayList<>();
			tempList2 =  dao.selectLatelyPurchasedLectureList2(kong);
			
			latelyPurchasedLectureList = new ArrayList<>();
			
			for (int i = 0; i < tempList1.size(); i++) {
				Lecture l = new Lecture(tempList1.get(i), tempList2.get(i));
				latelyPurchasedLectureList.add(l);
			}
			
			ArrayList<String> tempList3 = new ArrayList<>();
			tempList3 =  dao.recentlyCompletedLectureList1(kong);
			ArrayList<String> tempList4 = new ArrayList<>();
			tempList4 =  dao.recentlyCompletedLectureList2(kong);
			
			recentlyCompletedLectureList = new ArrayList<>();
			
			for (int i = 0; i < tempList3.size(); i++) {
				Lecture l = new Lecture(tempList3.get(i), tempList4.get(i));
				recentlyCompletedLectureList.add(l);
			}
		
			//courseList = dao.pagingStudyCourse(kong);
			courseList = dao.pagingTeachCourse(kong);
			System.out.println("kong>> " + kong);
			System.out.println("courselist>> " + courseList);
			for (int i = 0; i < courseList.size(); i++) {
				
				for (int j = 0; j < courseList.get(i).getCourseTypeList().size(); j++) {
					
					String key = courseList.get(i).getCourseTypeList().get(j);
					
					switch (key) {
					case "1":
						courseList.get(i).getCourseTypeList().set(j, "Purejava");
						break;
					case "2":
						courseList.get(i).getCourseTypeList().set(j, "Web");
						break;
					case "3":
						courseList.get(i).getCourseTypeList().set(j, "Mobile");
						break;
					case "4":
						courseList.get(i).getCourseTypeList().set(j, "IOT");
						break;
					case "5":
						courseList.get(i).getCourseTypeList().set(j, "Swing");
						break;
					case "6":
						courseList.get(i).getCourseTypeList().set(j, "JDBC");
						break;
					case "7":
						courseList.get(i).getCourseTypeList().set(j, "API");
						break;
					case "8":
						courseList.get(i).getCourseTypeList().set(j, "Spring");
						break;
					case "9":
						courseList.get(i).getCourseTypeList().set(j, "Struts");
						break;
					case "10":
						courseList.get(i).getCourseTypeList().set(j, "etcFramework");
						break;
					case "11":
						courseList.get(i).getCourseTypeList().set(j, "etc");
						break;
					default:
						break;
					}
					
				}
				
			}
			
			if(session.get("searchText") == null) searchText = null;
			
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
			
			}else{
				session.put("currentPage", 0);
			}
			
			
			System.out.println("teachmain>> " + courseList);
			
			//courseList= dao.selectAllCourseListForTeach(id);
			
			return SUCCESS;
		}
		
		
		public String plusTeachMain() {
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			//페이지 시작 값, 마지막 값, 현재 페이지 = 1
			
			int countPerPage = 7;		//페이지당 글목록 수
			start = countPerPage*currentPage-(countPerPage-1);
			end = countPerPage*currentPage;
			
			Map<String, Object> kong = new HashMap<>();
			
			if(((String) session.get("loginId")) != null){
				kong.put("id", ((String)session.get("loginId")));
			}
			
			kong.put("start", start);
			kong.put("end", end);
			int totalRecordsCount = dao.selectTeachTotal(kong);
			
			if(totalRecordsCount != 0){
			
			ArrayList<String> tempList1 = new ArrayList<>();
			tempList1 =  dao.selectLatelyPurchasedLectureList1(kong);
			ArrayList<String> tempList2 = new ArrayList<>();
			tempList2 =  dao.selectLatelyPurchasedLectureList2(kong);
			
			latelyPurchasedLectureList = new ArrayList<>();
			
			for (int i = 0; i < tempList1.size(); i++) {
				Lecture l = new Lecture(tempList1.get(i), tempList2.get(i));
				latelyPurchasedLectureList.add(l);
			}
			
			ArrayList<String> tempList3 = new ArrayList<>();
			tempList3 =  dao.recentlyCompletedLectureList1(kong);
			ArrayList<String> tempList4 = new ArrayList<>();
			tempList4 =  dao.recentlyCompletedLectureList2(kong);
			
			recentlyCompletedLectureList = new ArrayList<>();
			
			for (int i = 0; i < tempList3.size(); i++) {
				Lecture l = new Lecture(tempList3.get(i), tempList4.get(i));
				recentlyCompletedLectureList.add(l);
			}
		
			courseList = dao.pagingTeachCourse(kong);
			System.out.println("kong>> " + kong);
			System.out.println("courselist>> " + courseList);
			for (int i = 0; i < courseList.size(); i++) {
				
				for (int j = 0; j < courseList.get(i).getCourseTypeList().size(); j++) {
					
					String key = courseList.get(i).getCourseTypeList().get(j);
					
					switch (key) {
					case "1":
						courseList.get(i).getCourseTypeList().set(j, "Purejava");
						break;
					case "2":
						courseList.get(i).getCourseTypeList().set(j, "Web");
						break;
					case "3":
						courseList.get(i).getCourseTypeList().set(j, "Mobile");
						break;
					case "4":
						courseList.get(i).getCourseTypeList().set(j, "IOT");
						break;
					case "5":
						courseList.get(i).getCourseTypeList().set(j, "Swing");
						break;
					case "6":
						courseList.get(i).getCourseTypeList().set(j, "JDBC");
						break;
					case "7":
						courseList.get(i).getCourseTypeList().set(j, "API");
						break;
					case "8":
						courseList.get(i).getCourseTypeList().set(j, "Spring");
						break;
					case "9":
						courseList.get(i).getCourseTypeList().set(j, "Struts");
						break;
					case "10":
						courseList.get(i).getCourseTypeList().set(j, "etcFramework");
						break;
					case "11":
						courseList.get(i).getCourseTypeList().set(j, "etc");
						break;
					default:
						break;
					}
					
				}
				
			}
			
			if(session.get("searchText") == null) searchText = null;
			
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
			
			}else{
				session.put("currentPage", 0);
			}
			
			
			System.out.println("teachmain>> " + courseList);
			
			//courseList= dao.selectAllCourseListForTeach(id);
			
			return SUCCESS;
		}
		
		/**
		 * teachMain - 강좌 등록
		 * **/
		public String insertCourse(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			/*insert Course*/
			id = (String) session.get("loginId");
			course.setId(id);
			course.setUsername(id);
			dao.insertCourse(course);
			
			/*insert CourseType*/
			Map<String, Object> map = new HashMap<>();
			for(int i = 0; i < courseTypeList.size(); i++){
				//map.put("courseno", course.getCoureseno());
				map.put("typeno", courseTypeList.get(i));
				
				map.put("id", course.getId());
				map.put("coursename", course.getCoursename());
				dao.insertCourseType(map);
				/*insert TeachCourse*/
				dao.insertTeachCourse(map);
			}
	
	
			return SUCCESS;
		}
		
		/**
		 * teachMain - 강사가 등록한 강의 리스트 보기
		 * **/
		public String getAllLectureListForTeach(String id){
			
			id=(String) session.get("loginId");
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			lectureList=dao.getAllLectureListForTeach(id);
			return SUCCESS;
		}
		

		/**
		 * teachMainDefault - 강사가 등록한 강의 리스트 보기
		 * **/
		public String insertLectureForm(){
			return SUCCESS;
		}
		
		
		/**
		 * 강의등록-insertLecture20160421수정
		 * @return
		 * @throws IOException 
		 */
		public String insertLecture() throws IOException{
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			/*insert Lecture*/
			lecture.setCourseno(courseno);
			lecture.setLecturename(lecture.getLecturename());
			lecture.setRegdate(lecture.getRegdate());
			
			//System.out.println(uploadContentType+"컨텐트타입");
			//System.out.println(uploadFileName+"파일네임");
			//System.out.println(getUpload()+"실제파일");
			
			String a= uploadFileName.get(0);
			String b= uploadFileName.get(1);
			
			String [] video_chk = a.split("\\.");
			String [] note_chk = b.split("\\.");
			
			String check_point1= video_chk[1];
			String check_point2= note_chk[1];
			
			//System.out.println("check_point1 : "+check_point1);
			//System.out.println("check_point2 : "+check_point2);	   
			
			//여기서부터 내꺼
            
    		/*insert Lecture*/
    		//System.out.println(uploadContentType+"컨텐트타입");
    		//System.out.println(uploadFileName+"파일네임");
    		//System.out.println(getUpload()+"실제파일");
    		//System.out.println(ServletActionContext.getRequest().getRequestURL());
    		
			/*file_parent = file_parent + "/" + packagePath;
			directoryPath = new File(file_parent + "/");
			File file = new File(file_parent, file_name);*/
			
			String loginId = (String)session.get("loginId");
    		/*강의video*/
    		//System.out.println(UploadPath+uploadFileName.get(0));
    		
			directoryPath = new File(UploadPath +loginId+"/");
			if (!directoryPath.exists()) {
				directoryPath.mkdirs();
			}
			System.out.println("filename>> " + directoryPath+uploadFileName.get(0));
			File video=new File(directoryPath, uploadFileName.get(0)); /*파일네임*/
    		
    		FileUtils.copyFile(upload.get(0), video); /*실제파일저장*/
    		//System.out.println(video+"video");
    		
    		/*originalfilename="lecture,"+UploadPath+video+","+System.currentTimeMillis();실제파일이름
    		uploadedfilename=uploadFileName.get(0); 실제파일경로*/
    		originalfilename=video+","+System.currentTimeMillis(); //실제파일이름
    		uploadedfilename=uploadFileName.get(0); //실제파일경로*/
    		
    		//System.out.println("경로1: "+uploadedfilename);
    		 //입력받은 파일 이름을 가지고 File 객체를 생성
    		
			lecture.setUploadedfilename(uploadedfilename);
			lecture.setOriginalfilename(originalfilename);
			dao.insertLecture(lecture);
    		
    		 try {
    			   Class.forName("oracle.jdbc.driver.OracleDriver");
    			  // System.out.println("드라이버 검색 성공");
    			  }catch(ClassNotFoundException e) {
    			   System.err.println("error = " + e);
    			   System.exit(1);
    			  }
    			  Connection conn = null;
    			  PreparedStatement pstmt = null;
    			  String url = "jdbc:oracle:thin:@localhost:1521:xe";
    			  String id = "hr";
    			  String pass = "hr";
    			  String query = null;
    			  try {
    			   conn = DriverManager.getConnection(url, id, pass);
    			  }catch(SQLException e) {
    			   System.err.println("sql error = " + e);
    			   System.exit(1); // 비정상 종료시 사용되는 함수이다.
    			  }
    			  
    			  /*Scanner sc = new Scanner(System.in);
    			  System.out.print("업로드 할 파일 = ");
    			  String filename = sc.next();*/
    			 
    			  //File f = new File(filename);
    			  if(!video.exists()) {
    			   System.out.println("파일이 존재 하지 않습니다.");
    			   System.exit(1);
    			  }
    			  
    			  ByteArrayOutputStream bos = new ByteArrayOutputStream();
    			  FileInputStream fis = new FileInputStream(video);
    			  while(true) {
    			   int x = fis.read();
    			   if(x == -1) break;
    			   bos.write(x);
    			  }
    			  fis.close();
    			  bos.close(); 
    			  ByteArrayInputStream bis = new ByteArrayInputStream(bos.toByteArray());
    			  
    			  int lecNo = dao.selectMaxLectureno();
    			  System.out.println("lecNo>> " + lecNo);
    			  
    			  query = "update lecture set filedata = ? where lectureno = ? ";
    			  try {
    			   pstmt = conn.prepareStatement(query);
    			   pstmt.setBinaryStream(1, bis, bos.size());
    			   pstmt.setInt(2, lecNo);
    			   int row =  pstmt.executeUpdate();
    			   System.out.println("업로드 성공!" + row);
    			   pstmt.close();
    			   conn.close();
    			  }catch(SQLException e) {
    			   System.err.println("sql error = " + e);
    			  }
            
            //여기까지 내꺼
				/*서브노트파일*/
    			  
    			directoryPath = new File(UploadPath2 +loginId+"/");
    				if (!directoryPath.exists()) {
    					directoryPath.mkdirs();
    				}  
    			  
				File note=new File(directoryPath, uploadFileName.get(1));
				FileUtils.copyFile(upload.get(1), note); /*실제파일저장*/
				System.out.println(note+"subnote");
				
				originalfilename="subnote,"+note+","+System.currentTimeMillis();
				uploadedfilename=uploadFileName.get(1);
				System.out.println("경로2: "+uploadedfilename);
				
				subnote = new Subnote();
				id=(String) session.get("loginId");
				subnote.setId(id);
				subnote.setCourseno(courseno);
				System.out.println("subnote2: "+subnote);
				subnote.setOriginalfilename(originalfilename);
				subnote.setUploadedfilename(uploadedfilename);
				System.out.println("subnote3: "+subnote);
				System.out.println(subnote+"서브노트객체");
				dao.insertSubnote(subnote);
	/*struts.properties src 파일사이즈 속성. 값. byte값단위로 */
				
				/*insert Teachlecture*/
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", id);
				//System.out.println(courseno+"티치렉쳐");
				map.put("courseno", courseno);
				map.put("point", 0);
				map.put("studentcount", 0);
				//System.out.println(map+"티치렉쳐맵");
				dao.insertTeachLecture(map);
			
			
				/*insert Coding-coding 갔다가 옴..*/
				codingList = dao.selectForCodingTemp(id); //id와 코딩넘버알기위해서 문제등록되었는지잠깐등록
				//System.out.println("codingtemp codingno: " +codingList);
				
				for(int i=0; i<codingList.size();i++){
					coding= codingList.get(i);
					map.put("codingno", coding.getCodingno());
				}			
				dao.insertlecturecodingInInsertLecture(map);
				dao.deleteCodingTemp(id);
			return SUCCESS;
		}
		
		/**
		 * teachMain - 강좌 상세 페이지 띠우기
		 */
		public String CourseDetailForTeachForm(){
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			id=(String) session.get("loginId");
			
			lectureList = dao.selectAllLectureListForTeach(courseno);
			
			course=dao.selectCourse(courseno);     
			return SUCCESS;
		}
		
		/**
		 * teachMain - 강좌 상세 페이지- 영상 확인 창
		 */
		public String mediaPlayerForm(){
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			System.out.println("미디어플레이어폼 lectureno: "+lectureno);
			lecture = dao.selectLecture(lectureno);
			
			return SUCCESS;
		}
		
		/**
		 * teachMain - 강좌 상세 페이지 - 강의 삭제 
		 */
		public String deleteLecture(){
		    courseDAO dao = sqlSession.getMapper(courseDAO.class);
		    filename = dao.selectFileName(lectureno); // 삭제용 비디오파일네임 
		    String sfilename = dao.selectSubNoteName(lectureno); // 삭제용 서브노트파일네임 
		    System.out.println("deletelecture 옴, lectureno : "+lectureno);
	         System.out.println("courseno : "+courseno);
	         dao.deleteCheckLecture(lectureno);
	         dao.deleteStudyLecture(lectureno);
	         dao.deleteTeachLecture(lectureno);
	         dao.deleteSubnote(lectureno);
	         dao.deleteLectureCoding(lectureno);
	         dao.deleteLecture(lectureno);
	         System.out.println("courseno : "+courseno);
	         lectureList= dao.selectAllLectureListForTeach(courseno);
	         System.out.println("leclist>> " + lectureList);
	         course= dao.selectCourse(courseno);
	         
	         directoryPath = new File(UploadPath + (String)session.get("loginId"));
	         String path = UploadPath + (String)session.get("loginId");
	 		System.out.println("filename>> " + filename);
	         
	         if (directoryPath.isDirectory()) {
	 			String[] childFiles = directoryPath.list();
	 			
	 				for (String childFilePath : childFiles) {
	 						if(childFilePath.equals(filename)){
							System.out.println("childfilePath>> " + childFilePath);
							File file2 = new File(directoryPath, childFilePath);
							file2.delete();
						}
	 					/*deleteFile(path + "/" + childFilePath, filename);*/
	 			}
	 		} 
	         
	         
	         
	         directoryPath = new File(UploadPath2 + (String)session.get("loginId"));
		        String spath = UploadPath2 + (String)session.get("loginId");
		         
		         if (directoryPath.isDirectory()) {
		 			String[] childFiles = directoryPath.list();
		 			
		 				for (String childFilePath : childFiles) {
		 						if(childFilePath.equals(sfilename)){
								
		 						File file2 = new File(directoryPath, childFilePath);
								file2.delete();
							}
		 					/*deleteFile(path + "/" + childFilePath, filename);*/
		 			}
		 		} 
	         
	         
	         
	         return SUCCESS;
		}
		
		public void deleteFile(String path, String filename) {
			File file = new File(path);
			if (file.isDirectory()) {
				String[] childFiles = file.list();
				if (childFiles == null) {
					file.delete();
				} else {
					for (String childFilePath : childFiles) {
						System.out.println("childFilePath");
						if(childFilePath.equals(filename)){
							
							File file2 = new File(path+"/"+childFilePath);
							file2.delete();
						}
						//deleteFile(path + "/" + childFilePath);
					}
				}
			} else {
				file.delete();
			}
		}
		/**
		 * teachMain - 강좌 상세 페이지 - 수정 폼
		 */
		public String updateLectureForm(){
			
			return SUCCESS;
		}
		
		/**
		 * teachMain - 강좌 상세 페이지 - 수정 
		 */
		public String updateLecture() throws IOException{
		
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			String loginId = (String)session.get("loginId");
			
			filename = dao.selectFileName(lectureno); //삭제용 파일 네임
    		System.out.println("filename>> " + filename);
			
			directoryPath = new File(UploadPath +loginId+"/");
			if (!directoryPath.exists()) {
				directoryPath.mkdirs();
			}
			System.out.println("filenamee디렉토리포함>> " + directoryPath +" ㄹㄴㄹ " +uploadFileName.get(0));
			File video=new File(directoryPath, uploadFileName.get(0)); /*파일네임*/
    		
    		FileUtils.copyFile(upload.get(0), video); /*실제파일저장*/
			
			originalfilename=video+","+System.currentTimeMillis(); //실제파일이름
    		uploadedfilename=uploadFileName.get(0); //실제파일경로*/
    		
    		//System.out.println("경로1: "+uploadedfilename);
    		 //입력받은 파일 이름을 가지고 File 객체를 생성
    		
			//lecture.setUploadedfilename(uploadedfilename);
			//lecture.setOriginalfilename(originalfilename);
			//dao.insertLecture(lecture);
    		
    		System.out.println("update> " + uploadedfilename + " / original " + originalfilename + " / lectureno > " + lectureno);
    		
			try {
 			   Class.forName("oracle.jdbc.driver.OracleDriver");
 			  // System.out.println("드라이버 검색 성공");
 			  }catch(ClassNotFoundException e) {
 			   System.err.println("error = " + e);
 			   System.exit(1);
 			  }
 			  Connection conn = null;
 			  PreparedStatement pstmt = null;
 			  String url = "jdbc:oracle:thin:@localhost:1521:xe";
 			  String id = "hr";
 			  String pass = "hr";
 			  String query = null;
 			  try {
 			   conn = DriverManager.getConnection(url, id, pass);
 			  }catch(SQLException e) {
 			   System.err.println("sql error = " + e);
 			   System.exit(1); // 비정상 종료시 사용되는 함수이다.
 			  }
 			  
 			  /*Scanner sc = new Scanner(System.in);
 			  System.out.print("업로드 할 파일 = ");
 			  String filename = sc.next();*/
 			 
 			  //File f = new File(filename);
 			  if(!video.exists()) {
 			   System.out.println("파일이 존재 하지 않습니다.");
 			   System.exit(1);
 			  }
 			  
 			  ByteArrayOutputStream bos = new ByteArrayOutputStream();
 			  FileInputStream fis = new FileInputStream(video);
 			  while(true) {
 			   int x = fis.read();
 			   if(x == -1) break;
 			   bos.write(x);
 			  }
 			  fis.close();
 			  bos.close(); 
 			  ByteArrayInputStream bis = new ByteArrayInputStream(bos.toByteArray());
 			  
 			  int lecNo = dao.selectMaxLectureno();
 			  System.out.println("lecNo>> " + lecNo);
 			  
 			  query = "update lecture set filedata = ? where lectureno = ? ";
 			  try {
 			   pstmt = conn.prepareStatement(query);
 			   pstmt.setBinaryStream(1, bis, bos.size());
 			   pstmt.setInt(2, lecNo);
 			   int row =  pstmt.executeUpdate();
 			   System.out.println("업로드 성공!" + row);
 			   pstmt.close();
 			   conn.close();
 			  }catch(SQLException e) {
 			   System.err.println("sql error = " + e);
 			  }
 			  
 			 Map<String, Object> map = new HashMap<String, Object>();
 			
 			map.put("originalfilename", originalfilename);
 			map.put("uploadedfilename", uploadedfilename);
 			map.put("lectureno", lectureno);
 			
 			dao.updateLecture(map);
 			  
			  directoryPath = new File(UploadPath + (String)session.get("loginId"));
		        String path = UploadPath + (String)session.get("loginId");
		         
		         if (directoryPath.isDirectory()) {
		 			String[] childFiles = directoryPath.list();
		 			
		 				for (String childFilePath : childFiles) {
		 						if(childFilePath.equals(filename)){
								
		 						File file2 = new File(directoryPath, childFilePath);
								file2.delete();
							}
		 					/*deleteFile(path + "/" + childFilePath, filename);*/
		 			}
		 		} 
			
		    message = "업데이트 성공"; 
		         
			return SUCCESS;
		}
		
		/**
		 * teachMain - 강좌 상세 페이지 - 교안 수정 폼
		 */
		public String updateSubnoteForm(){
			
			return SUCCESS;
		}
		
		
		/**
		 * teachMain - 강좌 상세 페이지 - 교안 수정 폼
		 */
		public String updateSubnote() throws IOException{
			System.out.println("updatesubnote 들어옴");
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			directoryPath = new File(UploadPath2 + (String)session.get("loginId"));
	        String path = UploadPath2+ (String)session.get("loginId");
			
	        /*서브노트파일*/
			File note=new File(directoryPath, uploadFileName.get(0));
			FileUtils.copyFile(upload.get(0), note);
			
			originalfilename="subnote,"+note+","+System.currentTimeMillis();
			uploadedfilename=uploadFileName.get(0);
			
			System.out.println("lectureno>> " + lectureno);
			filename = dao.selectSubNoteName(lectureno); //삭제용 파일 네임
			System.out.println("filename은 뭘까? >> " + filename);
			
			subnote = new Subnote();
			id=(String) session.get("loginId");
			subnote.setId(id);
			subnote.setOriginalfilename(originalfilename);
			subnote.setUploadedfilename(uploadedfilename);
			subnote.setLectureno(lectureno);
			
			dao.updateSubnote(subnote);
		         
		         if (directoryPath.isDirectory()) {
		 			String[] childFiles = directoryPath.list();
		 			
		 				for (String childFilePath : childFiles) {
		 						if(childFilePath.equals(filename)){
								
		 						File file2 = new File(directoryPath, childFilePath);
								file2.delete();
							}
		 			}
		 		} 
			
		     message = "업데이트 성공";
			return SUCCESS;
		}
		/**
		 * teachMain - 강좌 상세 페이지 - 강좌이름 수정 
		 */
		public String updateCourseName(){
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("coursename", coursename);
			map.put("courseno", courseno);
			
			dao.updateCourseName(map);
			
			return SUCCESS;
		}
		/**
		 * teachMain - 강좌 상세 페이지 - 강좌상세설명 수정 
		 */
		public String updateCourseIntrodution(){
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("introdution", introdution);
			map.put("courseno", courseno);
			
			dao.updateCourseIntrodution(map);
			
			return SUCCESS;
		}

		/**
		 * codingMain_fromMain - 문제 보관함에서 강좌 리스트 뽑기
		 */
		public String codingFormfromMain(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			
			codingList =  dao.getAllCodingList(id);
			
			courseList = dao.getAllCourseListForCodingBox(id);

			return SUCCESS;
		}
			/**
		 * codingMain2 - 강의등록시 문제 보관함에서 강좌 리스트 뽑기
		 */
		public String codingMainInsertLectureView(){
		
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			
			codingList =  dao.getAllCodingList(id);
			return SUCCESS;
		}

		/**
		 * codingMain_fromMain - 문제 보관함에서 강의 리스트 뽑기
		 */
		public String codingFormlecturelist(){
			
			try{
				
				courseDAO dao = sqlSession.getMapper(courseDAO.class);
				
				lectureList = dao.getAllLectureListForCodingBox(courseno);
				
			}catch(Exception e){
				e.printStackTrace();
			}
	
			
			return SUCCESS;
			
		}
		
		/**
		 * insertCoding - 문제 보관함에 문제 등록 뷰
		 */
		public String insertCodingfromMainView(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			
			codingList =  dao.getAllCodingList(id);
			
			return SUCCESS;
		}
		/**
		 * codingMain2 - 강의등록시 문제 보관함에 문제 등록 뷰
		 */
		public String insertSelectedCodingfromInsertLectureView(){
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			
			codingList =  dao.getAllCodingList(id);
			
			return SUCCESS;
		}
		
		/*insertSelectedCodingfromMain- 문제 보관함 메인 화면에서의 등록 */
/*	      public String insertSelectedCodingfromMain(){
	         
	         System.out.println("codingListForInsert: "+codingListForInsert);// codingListForInsert: [1,3]
	         System.out.println("size: "+codingListForInsert.size());
	         System.out.println("codingListForInsert.get(0): "+codingListForInsert.get(0));
	         courseDAO dao = sqlSession.getMapper(courseDAO.class);
	         
	         ArrayList<String> tempList = new ArrayList<>();
	         String temp = codingListForInsert.get(0);
	         StringTokenizer st = new StringTokenizer(temp, ",");
	         while(st.hasMoreTokens()){
	            tempList.add(st.nextToken());
	         }
	            
	         System.out.println("tempList.size(): "+tempList.size());
	         System.out.println("tempList: "+tempList);
	         
	         Map<String, Object> map = new HashMap<>();
	         Map<String, Object> mapfordele = new HashMap<>();
	         ArrayList<Integer> codingListCheck = new ArrayList<>();//20160501추가 - codingno;; for delete (왼쪽버튼 눌렀을때)
	         
	         boolean delCk=false;
	         
	         for(int i = 0; i < tempList.size(); i++){
	            map.put("codingno", tempList.get(i));
	            map.put("lectureno", lectureno);
	            codingno=Integer.parseInt(tempList.get(i));//20160501추가
	            System.out.println("lectureno:"+lectureno);
	            codingListCheck= dao.selectedAllLectureCoding(lectureno);  //20160501추가 - codingno;; for delete (왼쪽버튼 눌렀을때)
	            System.out.println("codingListCheck: "+codingListCheck);
	            int sa= dao.selectedAllLectureCodingCount(lectureno);//20160501추가 - count;; for delete (왼쪽버튼 눌렀을때)
	            System.out.println("selectAlllecturecodingCount: "+sa);
	            
	            deleteLectureCoding
	            if(sa > tempList.size()){
		            for(int j=0; j<codingListCheck.size();j++){
		            	if(codingno == codingListCheck.get(j)){
		            		delCk=true;
		            	}
		            }
		            if(!check){
		            	System.out.println("가져온 값과 db 값 비교했을때 다르다 ");
		            	mapfordele.put("codingno", codingno);
		            	mapfordele.put("lectureno", lectureno);
		            	dao.deleteLectureCodingForQuestionBox(mapfordele);
		            	System.out.println("mapfordele: "+mapfordele);
		            	System.out.println("delete완성");
		     		}
	            	
	            }
	            
	            
	            saveLectureCoding
	            int s= dao.selectLectureCoding(map);//20160501추가 - count ;;for count check (중복저장 피하기위해)
	            System.out.println("s: "+s);
	            if(s == 0){
	            	dao.insertLectureCoding(map);
	            	System.out.println(i+"번째값 등록 완료");
	            }
	            else{
	            	System.out.println("같은것 있음. 등록 불가 ");
	            }
	         }
	         codingFormlecturelist();
	         return SUCCESS;
	      }*/
		
		
	      public String insertSelectedCodingfromMain(){
		         
		         System.out.println("codingListForInsert: "+codingListForInsert);// codingListForInsert: [1,3]
		         System.out.println("size: "+codingListForInsert.size());
		         System.out.println("codingListForInsert.get(0): "+codingListForInsert.get(0));
		         courseDAO dao = sqlSession.getMapper(courseDAO.class);
		         
		         ArrayList<String> tempList = new ArrayList<>();
		         String temp = codingListForInsert.get(0);
		         StringTokenizer st = new StringTokenizer(temp, ",");
		         while(st.hasMoreTokens()){
		            tempList.add(st.nextToken());
		         }
		            
		         System.out.println("tempList.size(): "+tempList.size());
		         System.out.println("tempList: "+tempList);
		         
		         Map<String, Object> map = new HashMap<>();
		         Map<String, Object> mapfordele = new HashMap<>();
		         ArrayList<Integer> codingListCheck = new ArrayList<>();//20160501추가 - codingno;; for delete (왼쪽버튼 눌렀을때)
		         
		         boolean delCk=false;
		         
		        
		         
		         
		         
		         for(int i = 0; i < tempList.size(); i++){
		            map.put("codingno", tempList.get(i));
		            map.put("lectureno", lectureno);
		            codingno=Integer.parseInt(tempList.get(i));//20160501추가
		            System.out.println("lectureno:"+lectureno);
		            codingListCheck= dao.selectedAllLectureCoding(lectureno);  //20160501추가 - codingno;; for delete (왼쪽버튼 눌렀을때)
		            System.out.println("codingListCheck: "+codingListCheck);
		            int sa= dao.selectedAllLectureCodingCount(lectureno);//20160501추가 - count;; for delete (왼쪽버튼 눌렀을때) //db의 lecturecoding
		            System.out.println("selectAlllecturecodingCount: "+sa);
		            
		            
		            /*deleteLectureCoding*/
		            if(sa > tempList.size()){
			            for(int j=0; j<codingListCheck.size();j++){
			            	if(codingno == codingListCheck.get(j)){ //뷰에서 가져온거랑 db비교
			            		delCk=true;
			            	}
			            }
		            }
		            if(check){
		            	System.out.println("가져온 값과 db 값 비교했을때 다르다 ");
		            	mapfordele.put("codingno", codingno);
		            	mapfordele.put("lectureno", lectureno);
		            	dao.deleteLectureCodingForQuestionBox(mapfordele);
		            	System.out.println("mapfordele: "+mapfordele);
		            	System.out.println("delete완성");
		     		}
		          
		            else{
		            	 /*saveLectureCoding*/
			            int s= dao.selectLectureCoding(map);//20160501추가 - count ;;for count check (중복저장 피하기위해)
			            System.out.println("s: "+s);
			            if(s == 0){
			            	dao.insertLectureCoding(map);
			            	System.out.println(i+"번째값 등록 완료");
			            }
			            else{
			            	System.out.println("같은것 있음. 등록 불가 ");
			            }
		            }
		            
		           
		         }
		         codingFormlecturelist();
		         return SUCCESS;
		      }
		
		
		

		/*insertSelectedCodingfromMain- 인서트렉쳐 할때의 메인화면에서 등록 */
		public String insertSelectedCodingfromInsertLecture(){
			
			System.out.println("codingListForInsert: "+codingListForInsert);// codingListForInsert: [1,3]
			System.out.println("size: "+codingListForInsert.size());
			System.out.println("codingListForInsert.get(0): "+codingListForInsert.get(0));
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			ArrayList<String> tempList = new ArrayList<>();
			String temp = codingListForInsert.get(0);
			StringTokenizer st = new StringTokenizer(temp, ",");
			while(st.hasMoreTokens()){
				tempList.add(st.nextToken());
			}
				
			System.out.println("tempList.size(): "+tempList.size());
			System.out.println("tempList: "+tempList);
			id=(String) session.get("loginId");
			Map<String, Object> map = new HashMap<>();
			
			for(int i = 0; i < tempList.size(); i++){
				
				map.put("codingno", tempList.get(i));
				map.put("id", id);
				System.out.println("map: "+map);
				dao.insertCodingTemp(map);
				
				//dao.insertLectureCoding(map);
				System.out.println(i+"번 완료");
			}
			
			codingFormlecturelist();
			return SUCCESS;
		}
		
		public String showCodinglist(){
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			System.out.println("lectureno : "+lectureno);
			ArrayList<Integer> codingnoList= new ArrayList<>();
			
			codingnoList = dao.getCodingno(lectureno);
			
			System.out.println("codingnoList1 : "+codingnoList);
			System.out.println("codingnoList.size: "+codingnoList);
			codingList= dao.getCodinginlecture(codingnoList);
			/*for(int i=0; i<codingnoList.size();i++){
				codingno= codingnoList.get(i);
				codingList= dao.getCodinginlecture(codingno);
			}*/
			System.out.println("codingList2:"+codingList);
			
			return SUCCESS;
		}
		
		
		/**
		 * insertCoding - 문제 보관함에 문제 등록
		 */
		public String insertCodingfromMain(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			coding.setId(id);

			dao.insertCodingfromMain(coding);
			
			codingList =  dao.getAllCodingList(id);
			
			return SUCCESS;
		}
		
		/**
		 * updateCoding - 문제 보관함에 문제 수정 폼
		 */
		public String updateCodingfromMainView(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			codingList =  dao.getAllCodingList(id);
			
			return SUCCESS;
			
		}
		
		/**
		 * updateCodingForLecture - 문제 보관함에 문제 수정 폼
		 */
		public String updateCodingfromInsertLectureView(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			codingList =  dao.getAllCodingList(id);
			
			return SUCCESS;
			
		}
		
		/**
		 * updateCoding - 문제 보관함에 문제 수정
		 */
		public String updateCodingfromMain(){
			
			System.out.println("문제 보관함의 문제를 수정하겠다");
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			coding.setId(id);
			
			System.out.println("코딩 들어있니" +coding);
			
			dao.updateCodingfromMain(coding);
			
			return SUCCESS;
		}
		/**
		 * insertCoding - insertLecture 문제 보관함에 문제 업데이트
		 */
		public String updateCodingfromInsertLecture(){
			
			System.out.println("문제 보관함의 문제를 수정하겠다");
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			coding.setId(id);
			
			System.out.println("코딩 들어있니" +coding);
			
			dao.updateCodingfromMain(coding);
			
			return SUCCESS;
		}
		
		
		/**
		 * updateCoding - 문제 보관함에서 수정할 문제 클릭 되면 그 문제의 값 placeholder에 뿌리기 
		 */
		public String showcodingcontent(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
	
			coding = dao.getCodingContent(codingno);

			return SUCCESS;	
		}
		
		
		/**
		 * deleteCoding - 문제 보관함에 문제 삭제폼
		 */
		public String deleteCodingfromMainView(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			codingList =  dao.getAllCodingList(id);
			
			return SUCCESS;
		}
		
		/**
		 * deleteCoding - 문제 보관함에 문제 삭제
		 */
		public String deleteCodingfromMain(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
			dao.deleteCodingfromMain(codingno);
			
			id = (String)session.get("loginId");
			codingList =  dao.getAllCodingList(id);
			
			return SUCCESS;
		}
		
		
		/**
		 * QuestionBoxforStudy - 문제보관함 열때 문제리스트 뿌리기
		 */
		public String QuestionBoxforStudy(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			codingList = dao.getSelectedCoding(id);
			
			return SUCCESS;
			
		}
		
		/**
		 * QuestionBoxforStudy - 문제가 클릭되면 해당 문제의 값을 보여주기
		 */
		public String showcodinglistinstudy(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			mycode = dao.getCodefromStudy(codingno);			
			coding = dao.getCodingContent(codingno);
		
			return SUCCESS;
		}
		
		/**
		 * QuestionBoxforStudy - 해당 문제의 정답보기 버튼을 클릭하면 정답 보기
		 */
		public String showcodinganswer(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			coding = dao.getCodingContent(codingno);
			
			return SUCCESS;
		}
		
		/**
		 * QuestionBoxforStudy - 시청뷰에서 문제 저장하기 누르면 문제보관됨
		 */
		public String insertcodinginbox(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			id = (String)session.get("loginId");
			
			Map<String, Object> studycoding = new HashMap<>();
			
			studycoding.put("id", id);
			studycoding.put("codingno", codingno);
			studycoding.put("coding", mycode);
			
			dao.insertcodinginbox(studycoding);
			
			
			return SUCCESS;
		}
	

		/*문제보관함- lstbox1, 2 중복값 체크위함 */
		public String selectedCheck(){
			System.out.println("체크");
			System.out.println("lectureno: "+lectureno);
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			System.out.println("codingnoListforCheck: "+codingnoListforCheck);
			///coding= dao.selectedCheck(codingnoList);
			/*codingquestion = coding.getCodingquestion();*/
			/*Map<String, Object> map = new HashMap<>();
			for(int i = 0; i < codingnoList.size(); i++){
				map.put("codingno", codingnoList.get(i));
				System.out.println("map: "+map);
				coding= dao.selectedCheck(map);
				System.out.println("coding: "+coding);
			}*/
			
			ArrayList<String> tempList = new ArrayList<>();
			String temp = codingnoListforCheck.get(0).toString();
			StringTokenizer st = new StringTokenizer(temp, ",");
			while(st.hasMoreTokens()){
				tempList.add(st.nextToken());
			}
				
			System.out.println("tempList.size(): "+tempList.size());
			System.out.println("tempList: "+tempList);
			//id=(String) session.get("loginId");
			//Map<String, Object> map = new HashMap<>();
			//ArrayList<Coding> checkCoding= new ArrayList<>();
			
			for(int i = 0; i < tempList.size(); i++){
				System.out.println(tempList.get(i));
				codingno= Integer.parseInt(tempList.get(i)) ;
				//map.put("codingno", tempList.get(i));
				//map.put("id", id);
				//System.out.println("map: "+map);
				coding=dao.selectedCheck(codingno);
				//dao.insertLectureCoding(map);
				//System.out.println(i+"번 완료");
				System.out.println(coding);
				checkCoding.add(coding);
				System.out.println("checkCoding: "+checkCoding);
			}
			
			codingFormlecturelist();
			showCodinglist();
			return SUCCESS;
		}
		
		
		
		public String studyMainView2(){
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			//페이지 시작 값, 마지막 값, 현재 페이지 = 1
			start = 1;
			end = 2;
			currentPage = 1;
			int countPerPage = 2;		//페이지당 글목록 수
			
			Map<String, Object> kong = new HashMap<>();
			
			if(((String) session.get("loginId")) != null){
				kong.put("id", (String)session.get("loginId"));
			}
			
			kong.put("start", start);
			kong.put("end", end);
			int totalRecordsCount = dao.selectTotal(kong);
			
			if(totalRecordsCount != 0){
			
			ArrayList<String> tempList1 = new ArrayList<>();
			tempList1 =  dao.selectLatelyPurchasedLectureList1(kong);
			ArrayList<String> tempList2 = new ArrayList<>();
			tempList2 =  dao.selectLatelyPurchasedLectureList2(kong);
			
			latelyPurchasedLectureList = new ArrayList<>();
			
			for (int i = 0; i < tempList1.size(); i++) {
				Lecture l = new Lecture(tempList1.get(i), tempList2.get(i));
				latelyPurchasedLectureList.add(l);
			}
			
			ArrayList<String> tempList3 = new ArrayList<>();
			tempList3 =  dao.recentlyCompletedLectureList1(kong);
			ArrayList<String> tempList4 = new ArrayList<>();
			tempList4 =  dao.recentlyCompletedLectureList2(kong);
			
			recentlyCompletedLectureList = new ArrayList<>();
			
			for (int i = 0; i < tempList3.size(); i++) {
				Lecture l = new Lecture(tempList3.get(i), tempList4.get(i));
				recentlyCompletedLectureList.add(l);
			}
			 		
			courseList = dao.pagingStudyCourse(kong);
			
			for (int i = 0; i < courseList.size(); i++) {
				
				for (int j = 0; j < courseList.get(i).getCourseTypeList().size(); j++) {
					
					String key = courseList.get(i).getCourseTypeList().get(j);
					
					switch (key) {
					case "1":
						courseList.get(i).getCourseTypeList().set(j, "Purejava");
						break;
					case "2":
						courseList.get(i).getCourseTypeList().set(j, "Web");
						break;
					case "3":
						courseList.get(i).getCourseTypeList().set(j, "Mobile");
						break;
					case "4":
						courseList.get(i).getCourseTypeList().set(j, "IOT");
						break;
					case "5":
						courseList.get(i).getCourseTypeList().set(j, "Swing");
						break;
					case "6":
						courseList.get(i).getCourseTypeList().set(j, "JDBC");
						break;
					case "7":
						courseList.get(i).getCourseTypeList().set(j, "API");
						break;
					case "8":
						courseList.get(i).getCourseTypeList().set(j, "Spring");
						break;
					case "9":
						courseList.get(i).getCourseTypeList().set(j, "Struts");
						break;
					case "10":
						courseList.get(i).getCourseTypeList().set(j, "etcFramework");
						break;
					case "11":
						courseList.get(i).getCourseTypeList().set(j, "etc");
						break;
					default:
						break;
					}
					
				}
				
			}
			
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
			
			System.out.println("curpage>> " + (int)session.get("currentPage") +" / "+ "endpage>> " + (int)session.get("endPageGroup"));
			
			
			}else{
				session.put("currentPage", 0);
			}
			
			session.put("pend", end);
			session.put("pstart", start);
			session.put("operation", "studyMainView2");
			session.put("pcurrentPage", currentPage);
			session.put("pCountPerPage", countPerPage);
			session.put("pendPageGroup", endPageGroup);
			
			return SUCCESS;
			
		}
		
		
		//getter setter

	
		public Coding getCoding() {
			return coding;
		}
	
		public void setCoding(Coding coding) {
			this.coding = coding;
		}
	
		public Course getCourse() {
			return course;
		}
	
		public void setCourse(Course course) {
			this.course = course;
		}
	
		public Lecture getLecture() {
			return lecture;
		}
	
		public void setLecture(Lecture lecture) {
			this.lecture = lecture;
		}
	
		public ArrayList<Coding> getCodingList() {
			return codingList;
		}
	
		public void setCodingList(ArrayList<Coding> codingList) {
			this.codingList = codingList;
		}
	
		public ArrayList<Course> getCourseList() {
			return courseList;
		}
	
		public void setCourseList(ArrayList<Course> courseList) {
			this.courseList = courseList;
		}
	
		public ArrayList<Lecture> getLectureList() {
			return lectureList;
		}
	
		public void setLectureList(ArrayList<Lecture> lectureList) {
			this.lectureList = lectureList;
		}
	
		public Member_jt getMember_jt() {
			return member_jt;
		}
	
		public void setMember_jt(Member_jt member_jt) {
			this.member_jt = member_jt;
		}
	
		public Question getQuestion() {
			return question;
		}
	
		public void setQuestion(Question question) {
			this.question = question;
		}
	
		public Error getError() {
			return error;
		}
	
		public void setError(Error error) {
			this.error = error;
		}
	
		public String getId() {
			return id;
		}
	
		public void setId(String id) {
			this.id = id;
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
	
		public int getCodingno() {
			return codingno;
		}
	
		public void setCodingno(int codingno) {
			this.codingno = codingno;
		}
	
		public String getContent() {
			return content;
		}
	
		public void setContent(String content) {
			this.content = content;
		}
	
		public boolean getCheck() {
			return check;
		}
	
		public void setCheck(boolean check) {
			this.check = check;
		}
	
		public ArrayList<Course> getRecourseList() {
			return recourseList;
		}

		public void setRecourseList(ArrayList<Course> recourseList) {
			this.recourseList = recourseList;
		}

		public ArrayList<String> getInterestList() {
			return interestList;
		}

		public void setInterestList(ArrayList<String> interestList) {
			this.interestList = interestList;
		}

		public ArrayList<Course> getRecentRank() {
			return recentRank;
		}
		public void setRecentRank(ArrayList<Course> recentRank) {
			this.recentRank = recentRank;
		}
		public ArrayList<Course> getAllRank() {
			return allRank;
		}
		public void setAllRank(ArrayList<Course> allRank) {
			this.allRank = allRank;
		}
		public String getInterestString() {
			return interestString;
		}
		public void setInterestString(String interestString) {
			this.interestString = interestString;
		}
		
		public String getSearchText() {
			return searchText;
		}
	
		public void setSearchText(String searchText) {
			this.searchText = searchText;
		}
	
		
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getStr() {
			return str;
		}
		public void setStr(String str) {
			this.str = str;
		}
	
		public ArrayList<Course> getTeachCourseList() {
			return teachCourseList;
		}
	
		public void setTeachCourseList(ArrayList<Course> teachCourseList) {
			this.teachCourseList = teachCourseList;
		}
	
		public String getUsername() {
			return username;
		}
	
		public void setUsername(String username) {
			this.username = username;
		}
	
		public String getCoursename() {
			return coursename;
		}
	
		public void setCoursename(String coursename) {
			this.coursename = coursename;
		}
	
		public PageNavigator getNavi() {
			return navi;
		}
	
		public void setNavi(PageNavigator navi) {
			this.navi = navi;
		}
	
		public int getCurrentPage() {
			return currentPage;
		}
	
		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}
	
		public int getPage() {
			return page;
		}
	
		public void setPage(int page) {
			this.page = page;
		}
	
		public int getTotal() {
			return total;
		}
	
		public void setTotal(int total) {
			this.total = total;
		}
	
		public String getPurejava() {
			return purejava;
		}
	
		public void setPurejava(String purejava) {
			this.purejava = purejava;
		}
	
		public String getWeb() {
			return web;
		}
	
		public void setWeb(String web) {
			this.web = web;
		}
	
		public String getMobile() {
			return mobile;
		}
	
		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
	
		public String getIot() {
			return iot;
		}
	
		public void setIot(String iot) {
			this.iot = iot;
		}
	
		public String getSwing() {
			return swing;
		}
	
		public void setSwing(String swing) {
			this.swing = swing;
		}
	
		public String getJdbc() {
			return jdbc;
		}
	
		public void setJdbc(String jdbc) {
			this.jdbc = jdbc;
		}
	
		public String getApi() {
			return api;
		}
	
		public void setApi(String api) {
			this.api = api;
		}
	
		public String getSpring() {
			return spring;
		}
	
		public void setSpring(String spring) {
			this.spring = spring;
		}
	
		public String getStruts() {
			return struts;
		}
	
		public void setStruts(String struts) {
			this.struts = struts;
		}
	
		public String getEtcframework() {
			return etcframework;
		}
	
		public void setEtcframework(String etcframework) {
			this.etcframework = etcframework;
		}
	
		public String getEct() {
			return ect;
		}
	
		public void setEct(String ect) {
			this.ect = ect;
		}
	
		public ArrayList<String> getCourseTypeList() {
			return courseTypeList;
		}
	
		public void setCourseTypeList(ArrayList<String> courseTypeList) {
			this.courseTypeList = courseTypeList;
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

		public String getTeacherid() {
			return teacherid;
		}

		public void setTeacherid(String teacherid) {
			this.teacherid = teacherid;
		}
		public String getUploadedfilename() {
			return uploadedfilename;
		}

		public void setUploadedfilename(String uploadedfilename) {
			this.uploadedfilename = uploadedfilename;
		}

		public String getOriginalfilename() {
			return originalfilename;
		}

		public void setOriginalfilename(String originalfilename) {
			this.originalfilename = originalfilename;
		}

		public Subnote getSubnote() {
			return subnote;
		}

		public void setSubnote(Subnote subnote) {
			this.subnote = subnote;
		}

		public File getSaveFile() {
			return saveFile;
		}

		public void setSaveFile(File saveFile) {
			this.saveFile = saveFile;
		}

		public static String getUploadpath() {
			return UploadPath;
		}

		public List<String> getUploadFileName() {
			return uploadFileName;
		}

		public void setUploadFileName(List<String> uploadFileName) {
			this.uploadFileName = uploadFileName;
		}

		public List<String> getUploadContentType() {
			return uploadContentType;
		}

		public void setUploadContentType(List<String> uploadContentType) {
			this.uploadContentType = uploadContentType;
		}
		public ArrayList<Lecture> getRecentlyCompletedLectureList() {
			return recentlyCompletedLectureList;
		}

		public void setRecentlyCompletedLectureList(ArrayList<Lecture> recentlyCompletedLectureList) {
			this.recentlyCompletedLectureList = recentlyCompletedLectureList;
		}

		public ArrayList<Lecture> getLatelyPurchasedLectureList() {
			return latelyPurchasedLectureList;
		}

		public void setLatelyPurchasedLectureList(ArrayList<Lecture> latelyPurchasedLectureList) {
			this.latelyPurchasedLectureList = latelyPurchasedLectureList;
		}

		public int getStart() {
			return start;
		}

		public void setStart(int start) {
			this.start = start;
		}

		public int getEnd() {
			return end;
		}

		public void setEnd(int end) {
			this.end = end;
		}
		public int getEndPageGroup() {
			return endPageGroup;
		}

		public void setEndPageGroup(int endPageGroup) {
			this.endPageGroup = endPageGroup;
		}

		public String getIntrodution() {
			return introdution;
		}

		public void setIntrodution(String introdution) {
			this.introdution = introdution;
		}

		public List<File> getUpload() {
			return upload;
		}

		public void setUpload(List<File> upload) {
			this.upload = upload;
		}
		
		public String getOrder() {
			return order;
		}

		public void setOrder(String order) {
			this.order = order;
		}

		public String getMycode() {
			return mycode;
		}

		public void setMycode(String mycode) {
			this.mycode = mycode;
		}
		public ArrayList<String> getCodingListForInsert() {
			return codingListForInsert;
		}

		public void setCodingListForInsert(ArrayList<String> codingListForInsert) {
			this.codingListForInsert = codingListForInsert;
		}

		public String getCodingquestion() {
			return codingquestion;
		}

		public void setCodingquestion(String codingquestion) {
			this.codingquestion = codingquestion;
		}
		public String getContentType() {
			return contentType;
		}
		public void setContentType(String contentType) {
			this.contentType = contentType;
		}
		public String getContentDisposition() {
			return contentDisposition;
		}
		public void setContentDisposition(String contentDisposition) {
			this.contentDisposition = contentDisposition;
		}
		public InputStream getInputStream() {
			return inputStream;
		}
		public void setInputStream(InputStream inputStream) {
			this.inputStream = inputStream;
		}
		public long getContentLength() {
			return contentLength;
		}
		public void setContentLength(long contentLength) {
			this.contentLength = contentLength;
		}
		public ArrayList<String> getCodingnoListforCheck() {
			return codingnoListforCheck;
		}
		public void setCodingnoListforCheck(ArrayList<String> codingnoListforCheck) {
			this.codingnoListforCheck = codingnoListforCheck;
		}
		public ArrayList<Coding> getCheckCoding() {
			return checkCoding;
		}
		public void setCheckCoding(ArrayList<Coding> checkCoding) {
			this.checkCoding = checkCoding;
		}

		public File getDirectoryPath() {
			return directoryPath;
		}

		public void setDirectoryPath(File directoryPath) {
			this.directoryPath = directoryPath;
		}

		public static String getUploadpath2() {
			return UploadPath2;
		}

		public String getFilename() {
			return filename;
		}

		public void setFilename(String filename) {
			this.filename = filename;
		}
		
}
