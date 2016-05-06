package org.javatree.www.Action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.struts2.interceptor.SessionAware;
import org.javatree.www.DAO.QnaDAO;
import org.javatree.www.DAO.courseDAO;
import org.javatree.www.Util.PageNavigator;
import org.javatree.www.VO.Ability;
import org.javatree.www.VO.Course;
import org.javatree.www.VO.Interest;
import org.javatree.www.VO.Member_jt;
import org.javatree.www.VO.Notification;
import org.javatree.www.VO.Question;
import org.javatree.www.VO.Reply;
import org.javatree.www.VO.Rereply;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class QnaAction extends ActionSupport implements SessionAware {
	@Autowired
	private SqlSession sqlsession;

	private Question question;
	private int questionno;
	private Reply reply;
	private int replyno;
	private Rereply rereply;
	private List<Question> questionList;
	private List<Reply> bestRecentQuestionList;
	private List<Reply> bestAllQuestionList;
	private List<Question> gunggumAllQuestionList;
	private List<Question> gunggumRecentQuestionList;
	private List<Rereply> rereplyList;
	private List<Integer> typenoList;
	private String typeName;
	private String stringForTokenizer;
	private List<Reply> replyList;
	private int codingno;
	private String codingtemplet;
	private String typeno;
	private int start;
	private int end;
	private int curious;
	private int recommend;
	private Map<String, Object> session;
	private boolean notificationCheck;
	private Notification notification;
	private int notificationno;
	private String id;
	private String interestString;
	private int currentPage;

	private int endPageGroup;

	private String order;
	private ArrayList<String> interestList;
	private String searchText;

	public String insertQuestionByModal() {
		try{
			
			QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
			String loginId = (String) session.get("loginId");
			String loginName = (String) session.get("loginName");
			int typenoTemp = question.getTypeno();
			question.setId(loginId);
			question.setUsername(loginName);
			question.setTypeno(typenoTemp);
			String stringTemp = question.getContent();
			stringTemp = stringTemp.substring(5, stringTemp.length()-7);
			question.setContent(stringTemp);
			typeName = dao.selectTypeName(typenoTemp);
			dao.insertQuestion(question);
			
			int codingnoTemp = question.getCodingno();
			String receiverId = dao.selectIdForCoding(codingnoTemp);
			notification = new Notification();
			notification.setReceiverid(receiverId);
			notification.setSenderid(loginId);
			notification.setMessage(loginId + " 님이 질문을 하셨습니다.");
			dao.insertNotificationForCoding(notification);
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String insertQuestion() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		String loginId = (String) session.get("loginId");
		String loginName = (String) session.get("loginName");
		int typenoTemp = Integer.parseInt(typeno);
		if (loginId == null) {
			return ERROR;
		}
		question.setId(loginId);
		question.setUsername(loginName);
		question.setTypeno(typenoTemp);
		typeName = dao.selectTypeName(typenoTemp);
		dao.insertQuestion(question);
		/*if(검색어가 있으면){
			return "question"
		}else if(){
			
		}*/
		makeQnaDefaultMain(loginId);
		return SUCCESS;
	}

	public String insertReply() {
		try{
			QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
			String loginId = (String) session.get("loginId");
			String loginName = (String) session.get("loginName");
			reply.setId(loginId);
			reply.setUsername(loginName);
			dao.insertReply(reply);
			notification.setSenderid(loginId);
			notification.setMessage(loginId + " 님이 답변을 다셨습니다.");
			dao.insertNotification(notification);
			ArrayList<String> gunggumIdList = dao.selectGunggumNotification(notification.getQuestionno());
			dao.deleteGunggumNotification(notification.getQuestionno());
			if(gunggumIdList.size() != 0){
				for(int i= 0; i < gunggumIdList.size(); i++){
					notification.setReceiverid(gunggumIdList.get(i));
					notification.setMessage(loginId + " 님이 회원님이 궁금한 질문에 답변을 다셨습니다.");
					dao.insertNotification(notification);
				}
			}
			question = dao.selectOneQuestion(reply.getQuestionno());
			replyList = dao.selectAllReply(reply.getQuestionno());
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String insertRereply() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		String loginId = (String) session.get("loginId");
		String loginName = (String) session.get("loginName");
		rereply.setId(loginId);
		rereply.setUsername(loginName);
		dao.insertRereply(rereply);
		notification.setSenderid(loginId);
		notification.setMessage(loginId + " 님이 " + notification.getReceiverid() + "님의 답변에 댓글을 다셨습니다.");
		dao.insertNotification(notification);
		rereplyList = dao.selectAllRereply(replyno);
		return SUCCESS;
	}

	public void makeQnaDefaultMain(String loginId) {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		if(loginId != null){
			Member_jt member = dao.selectOneMember(loginId);
			typenoList = new ArrayList<>();
			int questionnum = member.getCountquestion();
			int responsenum = member.getCountresponse();
			int recommendnum = member.getCountrecommend();
			ArrayList<Interest> interestList = member.getInterestList();
			ArrayList<Ability> abilityList = member.getAbilityList();
			for (int i = 0; i < abilityList.size(); i++) {
				if (abilityList.get(i).getValue() == 3) {
					if (!(typenoList.contains(abilityList.get(i).getTypeno()))) {
						typenoList.add(abilityList.get(i).getTypeno());
					}
				}
			}
			for (int i = 0; i < interestList.size(); i++) {
				if (interestList.get(i).getValue() == 3) {
					if (!(typenoList.contains(interestList.get(i).getTypeno()))) {
						typenoList.add(interestList.get(i).getTypeno());
					}
				}
			}
			if (questionnum >= responsenum) {
				for (int i = 0; i < abilityList.size(); i++) {
					if (abilityList.get(i).getValue() == 2) {
						if (!(typenoList.contains(abilityList.get(i).getTypeno()))) {
							typenoList.add(abilityList.get(i).getTypeno());
						}
					}
				}
			} else if (questionnum < responsenum) {
				for (int i = 0; i < interestList.size(); i++) {
					if (interestList.get(i).getValue() == 2) {
						if (!(typenoList.contains(interestList.get(i).getTypeno()))) {
							typenoList.add(interestList.get(i).getTypeno());
						}
					}
				}
			}
		}
		Map map = new HashMap();
		map.put("typenoList", typenoList);
		
		int total = 0;
		questionList = dao.selectAllQuestion(map);
		total = questionList.size();
		System.out.println("totalsize>> " + total);
		
		gunggumAllQuestionList = dao.gunggumAllQuestionList();
		gunggumRecentQuestionList = dao.gunggumRecentQuestionList();
		bestAllQuestionList = dao.bestAllQuestionList();
		bestRecentQuestionList = dao.bestRecentQuestionList();
		
		//int total = dao.selectAllQuestionTotal(map);
		 
		int countPerPage = 8;
		currentPage = 1;
		
		map.put("start", 1);
		map.put("end", 8);
		
		questionList = dao.selectAllQuestion(map);
		
		if(total == 0){
			Map<String, Object> gong = new HashMap<>();
			questionList = dao.selectAllQuestion(gong);
			total = questionList.size();
			System.out.println("totalsize>> " + total);
					
			gong.put("start", 1);
			gong.put("end", 8);
			//total = dao.selectAllQuestionTotal(gong);
			questionList = dao.selectAllQuestion(gong);
			}
		
		//페이지당 글목록 수
				if(total % countPerPage == 0 ){
					endPageGroup = (int)(total/countPerPage);		//총 (페이지)그룹 수
				}else{
					endPageGroup = (int)(total/countPerPage)+1;		//총 (페이지)그룹 수
				}
		System.out.println("start>> " + start + " / end>> " + end + " / type>> " + typenoList);		
		
		System.out.println("curpage>> " + currentPage);
		
		session.put("currentPage", currentPage);
		session.put("endPageGroup", endPageGroup);
		
		//backAction을 위한 세션값
		session.put("pend", end);
		session.put("pstart", start);
		session.put("operation", "makeQnaDefaultMain");
		session.put("pcurrentPage", currentPage);
		session.put("pCountPerPage", countPerPage);
		session.put("pendPageGroup", endPageGroup);
	}
	
	public void plusQnaDefaultMain(String loginId) {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		if(loginId != null){
			Member_jt member = dao.selectOneMember(loginId);
			typenoList = new ArrayList<>();
			int questionnum = member.getCountquestion();
			int responsenum = member.getCountresponse();
			int recommendnum = member.getCountrecommend();
			ArrayList<Interest> interestList = member.getInterestList();
			ArrayList<Ability> abilityList = member.getAbilityList();
			for (int i = 0; i < abilityList.size(); i++) {
				if (abilityList.get(i).getValue() == 3) {
					if (!(typenoList.contains(abilityList.get(i).getTypeno()))) {
						typenoList.add(abilityList.get(i).getTypeno());
					}
				}
			}
			for (int i = 0; i < interestList.size(); i++) {
				if (interestList.get(i).getValue() == 3) {
					if (!(typenoList.contains(interestList.get(i).getTypeno()))) {
						typenoList.add(interestList.get(i).getTypeno());
					}
				}
			}
			if (questionnum >= responsenum) {
				for (int i = 0; i < abilityList.size(); i++) {
					if (abilityList.get(i).getValue() == 2) {
						if (!(typenoList.contains(abilityList.get(i).getTypeno()))) {
							typenoList.add(abilityList.get(i).getTypeno());
						}
					}
				}
			} else if (questionnum < responsenum) {
				for (int i = 0; i < interestList.size(); i++) {
					if (interestList.get(i).getValue() == 2) {
						if (!(typenoList.contains(interestList.get(i).getTypeno()))) {
							typenoList.add(interestList.get(i).getTypeno());
						}
					}
				}
			}
		}
		Map map = new HashMap();
		
		int countPerPage = 5;		//페이지당 글목록 수
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		
		map.put("start", start);
		map.put("end", end);
		map.put("typenoList", typenoList);
		
		questionList = dao.selectAllQuestion(map);
		gunggumAllQuestionList = dao.gunggumAllQuestionList();
		gunggumRecentQuestionList = dao.gunggumRecentQuestionList();
		bestAllQuestionList = dao.bestAllQuestionList();
		bestRecentQuestionList = dao.bestRecentQuestionList();
		
		int total = questionList.size();
		
		//페이지당 글목록 수
		if(total % countPerPage == 0 ){
			endPageGroup = (int)(total/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(total/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		if(total == 0){
			currentPage = 0;
			endPageGroup = 1;
		}
		System.out.println("totalsize>> " + total);
		System.out.println("curpage>> " + currentPage);
		session.put("currentPage", currentPage);
		session.put("endPageGroup", endPageGroup);
		
	}
	
public String plusQnaMain() {
		
		System.out.println("currentpage>> " + currentPage);
		String loginId = (String)session.get("loginId");
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		if(loginId != null){
			Member_jt member = dao.selectOneMember(loginId);
			typenoList = new ArrayList<>();
			int questionnum = member.getCountquestion();
			int responsenum = member.getCountresponse();
			int recommendnum = member.getCountrecommend();
			ArrayList<Interest> interestList = member.getInterestList();
			ArrayList<Ability> abilityList = member.getAbilityList();
			for (int i = 0; i < abilityList.size(); i++) {
				if (abilityList.get(i).getValue() == 3) {
					if (!(typenoList.contains(abilityList.get(i).getTypeno()))) {
						typenoList.add(abilityList.get(i).getTypeno());
					}
				}
			}
			for (int i = 0; i < interestList.size(); i++) {
				if (interestList.get(i).getValue() == 3) {
					if (!(typenoList.contains(interestList.get(i).getTypeno()))) {
						typenoList.add(interestList.get(i).getTypeno());
					}
				}
			}
			if (questionnum >= responsenum) {
				for (int i = 0; i < abilityList.size(); i++) {
					if (abilityList.get(i).getValue() == 2) {
						if (!(typenoList.contains(abilityList.get(i).getTypeno()))) {
							typenoList.add(abilityList.get(i).getTypeno());
						}
					}
				}
			} else if (questionnum < responsenum) {
				for (int i = 0; i < interestList.size(); i++) {
					if (interestList.get(i).getValue() == 2) {
						if (!(typenoList.contains(interestList.get(i).getTypeno()))) {
							typenoList.add(interestList.get(i).getTypeno());
						}
					}
				}
			}
		}
		Map map = new HashMap();
		map.put("typenoList", typenoList);
		
		int total = 0;
		questionList = dao.selectAllQuestion(map);
		total = questionList.size();
		System.out.println("totalsize>> " + total);
		
		gunggumAllQuestionList = dao.gunggumAllQuestionList();
		gunggumRecentQuestionList = dao.gunggumRecentQuestionList();
		bestAllQuestionList = dao.bestAllQuestionList();
		bestRecentQuestionList = dao.bestRecentQuestionList();
		
		//int total = dao.selectAllQuestionTotal(map);
		 
		int countPerPage = 8;
		
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		
		map.put("start", start);
		map.put("end", end);
		
		questionList = dao.selectAllQuestion(map);
		
		if(total == 0){
			Map<String, Object> gong = new HashMap<>();
			questionList = dao.selectAllQuestion(gong);
			total = questionList.size();
			System.out.println("totalsize>> " + total);
					
			gong.put("start", start);
			gong.put("end", end);
			//total = dao.selectAllQuestionTotal(gong);
			questionList = dao.selectAllQuestion(gong);
			}
		
		System.out.println("questionList>>  " + questionList);
		//페이지당 글목록 수
				if(total % countPerPage == 0 ){
					endPageGroup = (int)(total/countPerPage);		//총 (페이지)그룹 수
				}else{
					endPageGroup = (int)(total/countPerPage)+1;		//총 (페이지)그룹 수
				}
		System.out.println("start>> " + start + " / end>> " + end + " / type>> " + typenoList);		
		System.out.println("totalsize>> " + total);
		System.out.println("curpage>> " + currentPage);
		session.put("currentPage", currentPage);
		session.put("endPageGroup", endPageGroup);
		
		//backAction을 위한 세션값
		session.put("pend", end);
		session.put("pstart", start);
		session.put("operation", "plusQnaMain");
		session.put("pcurrentPage", currentPage);
		session.put("pCountPerPage", countPerPage);
		session.put("pendPageGroup", endPageGroup);
		
		return SUCCESS;
	}
	
	public String watchRelatedQuestion() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		Map map = new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		map.put("codingno", codingno);
		questionList = dao.selectAllQuestionRelatedInCoding(map);
		gunggumAllQuestionList = dao.gunggumAllQuestionList();
		gunggumRecentQuestionList = dao.gunggumRecentQuestionList();
		bestAllQuestionList = dao.bestAllQuestionList();
		bestRecentQuestionList = dao.bestRecentQuestionList();
		return SUCCESS;
	}

	public String qnaDefaultMain() throws Exception {
		String loginId = (String) session.get("loginId");
		makeQnaDefaultMain(loginId);
		return SUCCESS;
	}

	public String searchListByInterest() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		StringTokenizer st = new StringTokenizer(stringForTokenizer, ",");
		typenoList = new ArrayList<>();
		while (st.hasMoreTokens()) {
			String temp = st.nextToken();
			typenoList.add(Integer.parseInt(temp));
		}
		Map map = new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		map.put("typenoList", typenoList);
		questionList = dao.selectAllQuestion(map);
		return SUCCESS;
	}

	public String plusQnaDefaultMain() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		Map map = new HashMap();
		if (stringForTokenizer.length() >= 2) {
			StringTokenizer st = new StringTokenizer(stringForTokenizer, ",");
			typenoList = new ArrayList<>();
			while (st.hasMoreTokens()) {
				String temp = st.nextToken();
				typenoList.add(Integer.parseInt(temp));
			}
			map.put("typenoList", typenoList);
		}
		map.put("start", start);
		map.put("end", end);
		questionList = dao.selectAllQuestion(map);
		return SUCCESS;
	}

	public String qnaDetail() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		question = dao.selectOneQuestion(questionno);
		question.setContent("<pre>"+ question.getContent()+"</pre>");
		replyList = dao.selectAllReply(questionno);
		typeName = dao.selectTypeName(question.getTypeno());
		if (notificationCheck) {
			Map map = new HashMap();
			id = (String) session.get("loginId");
			map.put("id", id);
			map.put("notificationno", notificationno);
			dao.clickNotification(map);
		}
		return SUCCESS;
	}

	public String addCurious() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		Map map = new HashMap();
		curious = question.getCurious() + 1;
		map.put("questionno", question.getQuestionno());
		map.put("curious", curious);
		dao.addCurious(map);
		id = (String) session.get("loginId");
		map.put("id", id);
		dao.addGunggumNotification(map);
		return SUCCESS;
	}

	public String addRecommend() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		Map map = new HashMap();
		recommend = reply.getRecommend() + 1;
		map.put("replyno", reply.getReplyno());
		map.put("recommend", recommend);
		dao.addRecommend(map);
		replyList = dao.selectAllReply(questionno);
		return SUCCESS;
	}
	
	/**
	 * qnaDefaultMain - 분야별 검색
	 * **/
	
	public String selectListbyField(){
		
QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		
		ArrayList<String> interestList = new ArrayList<>();
		
		StringTokenizer st = new StringTokenizer(interestString, ",");
		System.out.println("intereststring>> " + interestString);
		while (st.hasMoreTokens()) {
			interestList.add(st.nextToken());
		}
		
		Map<String, Object> kong = new HashMap<>();
		
		for (int i = 0; i < interestList.size(); i++) {
			kong.put("interest"+i, interestList.get(i));
		}
		session.put("order", order);
		kong.put("order", order);
		start = 1;
		end = 8;
		currentPage = 1;
		
		kong.put("start", start);
		kong.put("end", end);
		
		int countPerPage = 8;		//페이지당 글목록 수
		endPageGroup = 1;
		int totalRecordsCount = 0;
		if(interestString == null ||interestString.trim().equals("") || interestString.isEmpty()){
		System.out.println("interest 빔");
				Map<String, Object> gong = new HashMap<>();
				questionList= dao.selectAllQuestion(gong);
				totalRecordsCount = questionList.size();
				gong.put("start", start);
				gong.put("end", end);
				gong.put("order", order);
				System.out.println("gong>> " + gong);
				//totalRecordsCount = dao.selectFieldTotal(gong);
				questionList= dao.selectAllQuestion(gong);
		}else {
			totalRecordsCount = dao.selectFieldTotal(kong);
			System.out.println("total> " + totalRecordsCount);
			
			questionList= dao.selectListbyField(kong);		
		}
		
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		System.out.println("questionList>> " + questionList);
		
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
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
	
	public String plusSelectListbyField(){
QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		
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
		
		System.out.println("start>> " + start);
		System.out.println("end>> " + end);
		
		kong.put("start", start);
		kong.put("end", end);
		kong.put("order", (String)session.get("order"));
		
		int totalRecordsCount = 0;
		if(interestString == null ||interestString.trim().equals("") || interestString.isEmpty()){
			System.out.println("interest 빔");
					Map<String, Object> gong = new HashMap<>();
					questionList= dao.selectAllQuestion(gong);
					totalRecordsCount = questionList.size();
					gong.put("start", start);
					gong.put("end", end);
					gong.put("order", order);
					System.out.println("gong>> " + gong);
					//totalRecordsCount = dao.selectFieldTotal(gong);
					questionList= dao.selectAllQuestion(gong);
			}else {
			totalRecordsCount = dao.selectFieldTotal(kong);
			System.out.println("total> " + totalRecordsCount);
			
			questionList= dao.selectListbyField(kong);		
		}
		
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
		System.out.println("ques>> " + questionList);
		
		session.put("pend", end);
		session.put("pstart", start);
		session.put("operation", "plusSelectListbyField");
		session.put("pcurrentPage", currentPage);
		session.put("pCountPerPage", countPerPage);
		session.put("pendPageGroup", endPageGroup);
		
		return SUCCESS;
	}
	
	// 검색어 search 시작 
	
		public String searchCourse() {
			QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
			int countPerPage = 8;
			//login시 활동들(임시)
			 // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
				
			System.out.println("searchText>> " + searchText);
			
				Map<String, Object> map = new HashMap<>();
				start = 1;
				end = 8;
				currentPage = 1;
				int total = 0;
				
				if(searchText.trim().length() > 0){
					searchText = "%"+searchText+"%";
					map.put("searchText", searchText);
					session.put("searchText", searchText);
					
					questionList = dao.searchCourse(map);
					total = questionList.size();
					System.out.println("totalsize>> " + total);
					
					map.put("start", 1);
					map.put("end", 8);
					
					questionList = dao.searchCourse(map);
					
				}else{
					questionList = dao.selectAllQuestion(map);
					total = questionList.size();
					System.out.println("totalsize>> " + total);
					
					map.put("start", 1);
					map.put("end", 8);
					
					questionList = dao.selectAllQuestion(map);
				}
				
				System.out.println("question list>> " + questionList);
				
				//페이지당 글목록 수
						if(total % countPerPage == 0 ){
							endPageGroup = (int)(total/countPerPage);		//총 (페이지)그룹 수
						}else{
							endPageGroup = (int)(total/countPerPage)+1;		//총 (페이지)그룹 수
						}
				System.out.println("start>> " + start + " / end>> " + end);		
				
				System.out.println("curpage>> " + currentPage);
				
				session.put("currentPage", currentPage);
				session.put("endPageGroup", endPageGroup);
				session.put("CountPerPage", countPerPage);
				
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
		
		
		public String plusSearchCourse() {
			
			System.out.println("plusqna 들어옴");
			
			QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
			int countPerPage = 8;
			//login시 활동들(임시)
			 // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
			int total = 0;	
			System.out.println("PlussearchText>> " + (String)session.get("psearchText"));
			searchText = (String)session.get("psearchText");
			start = countPerPage*currentPage-(countPerPage-1);
			end = countPerPage*currentPage; 
			
			Map<String, Object> map = new HashMap<>();
				
				if(searchText.trim().length() > 0){
					searchText = "%"+searchText+"%";
					map.put("searchText", (String)session.get("psearchText"));
					session.put("searchText", searchText);
					questionList = dao.searchCourse(map);
					total = questionList.size();
					map.put("start", start);
					map.put("end", end);
					questionList = dao.searchCourse(map);
					
				}else{
					
					System.out.println("빈");
					questionList = dao.selectAllQuestion(map);
					total = questionList.size();
					System.out.println("totalsize>> " + total);
					
					map.put("start", start);
					map.put("end", end);
					
					questionList = dao.selectAllQuestion(map);
				}
				
				System.out.println("totalsize>> " + total);
				System.out.println("question list plus>> " + questionList);
				
				//페이지당 글목록 수
						if(total % countPerPage == 0 ){
							endPageGroup = (int)(total/countPerPage);		//총 (페이지)그룹 수
						}else{
							endPageGroup = (int)(total/countPerPage)+1;		//총 (페이지)그룹 수
						}
				System.out.println("start>> " + start + " / end>> " + end);		
				
				System.out.println("curpage>> " + currentPage);
				
				session.put("currentPage", currentPage);
				session.put("endPageGroup", endPageGroup);
				session.put("CountPerPage", countPerPage);
				
			//backAction을 위한 세션값
					session.put("pend", end);
					session.put("pstart", start);
					session.put("operation", "plusSearchCourse");
					session.put("pcurrentPage", currentPage);
					session.put("pCountPerPage", countPerPage);
					session.put("pendPageGroup", endPageGroup);
			
			return SUCCESS;
		}
		
		// 검색어 search 마침
		
		// 와타시노 back action 시작
		
		public String backAction() {
			QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
			if(((String)session.get("operation")).equals("searchCourse") || 
					((String)session.get("operation")).equals("plusSearchCourse")){
				
				int countPerPage = 8;
				//login시 활동들(임시)
				 // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
					
				System.out.println("searchText>> " + (String)session.get("psearchText"));
				searchText = (String)session.get("psearchText");
					Map<String, Object> map = new HashMap<>();
					int total = 0;
					
					currentPage = (int)session.get("pcurrentPage");
					
					if(searchText.trim().length() > 0){
						searchText = "%"+searchText+"%";
						map.put("searchText", (String)session.get("psearchText"));
						session.put("searchText", (String)session.get("psearchText"));
						
						questionList = dao.searchCourse(map);
						total = questionList.size();
						System.out.println("totalsize>> " + total);
						
						map.put("start", (int)session.get("pstart"));
						map.put("end", (int)session.get("pend"));
						
						questionList = dao.searchCourse(map);
					}else{
						questionList = dao.selectAllQuestion(map);
						total = questionList.size();
						
						map.put("start", (int)session.get("pstart"));
						map.put("end", (int)session.get("pend"));
						
						questionList = dao.selectAllQuestion(map);
					}
					
					System.out.println("back) question list>> " + questionList);
					
					//페이지당 글목록 수
							if(total % countPerPage == 0 ){
								endPageGroup = (int)(total/countPerPage);		//총 (페이지)그룹 수
							}else{
								endPageGroup = (int)(total/countPerPage)+1;		//총 (페이지)그룹 수
							}
					System.out.println("start>> " + start + " / end>> " + end);		
					
					System.out.println("curpage>> " + currentPage);
					
					session.put("currentPage", currentPage);
					session.put("endPageGroup", endPageGroup);
					session.put("CountPerPage", countPerPage);
					
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
				System.out.println("pcurrentpage>> " + currentPage);
				kong.put("start", (int)session.get("pstart"));
				kong.put("end", (int)session.get("pend"));
				
				int totalRecordsCount = 0;

				int countPerPage = 8;		//페이지당 글목록 수
				
				if(session.get("interest").toString() == null ||session.get("interest").toString().trim().equals("") 
						|| session.get("interest").toString().isEmpty()){
					System.out.println("interest 빔");
							Map<String, Object> gong = new HashMap<>();
							gong.put("start", start);
							gong.put("end", end);
							gong.put("order", order);
							totalRecordsCount = dao.selectFieldTotal(gong);
							System.out.println("00");
							questionList= dao.selectListbyField(gong);
					}else {
						totalRecordsCount = dao.selectFieldTotal(kong);
						System.out.println("total> " + totalRecordsCount);
						
						questionList= dao.selectListbyField(kong);		
					}
				
				if(totalRecordsCount % countPerPage == 0 ){
					endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
				}else{
					endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
				}
						
				session.put("currentPage", currentPage);
				session.put("CountPerPage", countPerPage);
				session.put("endPageGroup", endPageGroup);
				
				questionList = dao.selectListbyField(kong);
				
			}else if (((String)session.get("operation")).equals("plusQnaMain")
					|| ((String)session.get("operation")).equals("makeQnaDefaultMain")) {
			
				
				Map <String,Object> gong = new HashMap();
				String loginId = (String)session.get("loginId");
				if(loginId != null){
					gong.put("id", loginId);
				}
				
				if(loginId != null){
							Member_jt member = dao.selectOneMember(loginId);
							typenoList = new ArrayList<>();
							int questionnum = member.getCountquestion();
							int responsenum = member.getCountresponse();
							int recommendnum = member.getCountrecommend();
							ArrayList<Interest> interestList = member.getInterestList();
							ArrayList<Ability> abilityList = member.getAbilityList();
							for (int i = 0; i < abilityList.size(); i++) {
								if (abilityList.get(i).getValue() == 3) {
									if (!(typenoList.contains(abilityList.get(i).getTypeno()))) {
										typenoList.add(abilityList.get(i).getTypeno());
									}
								}
							}
							for (int i = 0; i < interestList.size(); i++) {
								if (interestList.get(i).getValue() == 3) {
									if (!(typenoList.contains(interestList.get(i).getTypeno()))) {
										typenoList.add(interestList.get(i).getTypeno());
									}
								}
							}
							if (questionnum >= responsenum) {
								for (int i = 0; i < abilityList.size(); i++) {
									if (abilityList.get(i).getValue() == 2) {
										if (!(typenoList.contains(abilityList.get(i).getTypeno()))) {
											typenoList.add(abilityList.get(i).getTypeno());
										}
									}
								}
							} else if (questionnum < responsenum) {
								for (int i = 0; i < interestList.size(); i++) {
									if (interestList.get(i).getValue() == 2) {
										if (!(typenoList.contains(interestList.get(i).getTypeno()))) {
											typenoList.add(interestList.get(i).getTypeno());
										}
									}
								}
							}
						}

						gong.put("typenoList", typenoList);
						
						int total = 0;
						questionList = dao.selectAllQuestion(gong);
						total = questionList.size();
						System.out.println("totalsize>> " + total);
						
						System.out.println("currentPage>> " + currentPage);
						currentPage = (int)session.get("pcurrentPage");
						int countPerPage = (int) session.get("pCountPerPage");		//페이지당 글목록 수
						start = countPerPage*currentPage-(countPerPage-1);
						end = countPerPage*currentPage;
						gong.put("start", start);
						gong.put("end", end);
						
						gunggumAllQuestionList = dao.gunggumAllQuestionList();
						gunggumRecentQuestionList = dao.gunggumRecentQuestionList();
						bestAllQuestionList = dao.bestAllQuestionList();
						bestRecentQuestionList = dao.bestRecentQuestionList();
						
						if(total == 0){
							Map<String, Object> map = new HashMap<>();
							questionList = dao.selectAllQuestion(map);
							total = questionList.size();
							System.out.println("totalsize>> " + total);
									
							map.put("start", start);
							map.put("end", end);
							questionList = dao.selectAllQuestion(map);
							}else{
								questionList = dao.selectAllQuestion(gong);
							}
						
						System.out.println("questionList>>  " + questionList);
						//페이지당 글목록 수
								if(total % countPerPage == 0 ){
									endPageGroup = (int)(total/countPerPage);		//총 (페이지)그룹 수
								}else{
									endPageGroup = (int)(total/countPerPage)+1;		//총 (페이지)그룹 수
								}

						System.out.println("start>> " + start + " / end>> " + end + " / type>> " + typenoList);		
						System.out.println("totalsize>> " + total);
						System.out.println("curpage>> " + currentPage);
						session.put("currentPage", currentPage);
						session.put("endPageGroup", endPageGroup);
					
				session.put("currentPage", currentPage);
				session.put("CountPerPage", countPerPage);
				session.put("endPageGroup", session.get("pendPageGroup"));
				
			}
			return SUCCESS;
		}
		
		
		// 와타시노 back action 마무리
	
	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public Rereply getRereply() {
		return rereply;
	}

	public void setRereply(Rereply rereply) {
		this.rereply = rereply;
	}

	public List<Question> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public int getQuestionno() {
		return questionno;
	}

	public void setQuestionno(int questionno) {
		this.questionno = questionno;
	}

	public int getReplyno() {
		return replyno;
	}

	public void setReplyno(int replyno) {
		this.replyno = replyno;
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

	public List<Question> getGunggumAllQuestionList() {
		return gunggumAllQuestionList;
	}

	public void setGunggumAllQuestionList(List<Question> gunggumAllQuestionList) {
		this.gunggumAllQuestionList = gunggumAllQuestionList;
	}

	public List<Question> getGunggumRecentQuestionList() {
		return gunggumRecentQuestionList;
	}

	public void setGunggumRecentQuestionList(List<Question> gunggumRecentQuestionList) {
		this.gunggumRecentQuestionList = gunggumRecentQuestionList;
	}

	public List<Integer> getTypenoList() {
		return typenoList;
	}

	public void setTypenoList(List<Integer> typenoList) {
		this.typenoList = typenoList;
	}

	public String getStringForTokenizer() {
		return stringForTokenizer;
	}

	public void setStringForTokenizer(String stringForTokenizer) {
		this.stringForTokenizer = stringForTokenizer;
	}

	public String getTypeno() {
		return typeno;
	}

	public void setTypeno(String typeno) {
		this.typeno = typeno;
	}

	public List<Reply> getBestRecentQuestionList() {
		return bestRecentQuestionList;
	}

	public void setBestRecentQuestionList(List<Reply> bestRecentQuestionList) {
		this.bestRecentQuestionList = bestRecentQuestionList;
	}

	public List<Reply> getBestAllQuestionList() {
		return bestAllQuestionList;
	}

	public void setBestAllQuestionList(List<Reply> bestAllQuestionList) {
		this.bestAllQuestionList = bestAllQuestionList;
	}

	public List<Rereply> getRereplyList() {
		return rereplyList;
	}

	public void setRereplyList(List<Rereply> rereplyList) {
		this.rereplyList = rereplyList;
	}

	public int getCodingno() {
		return codingno;
	}

	public void setCodingno(int codingno) {
		this.codingno = codingno;
	}

	public String getCodingtemplet() {
		return codingtemplet;
	}

	public void setCodingtemplet(String codingtemplet) {
		this.codingtemplet = codingtemplet;
	}

	public boolean getNotificationCheck() {
		return notificationCheck;
	}

	public void setNotificationCheck(boolean notificationCheck) {
		this.notificationCheck = notificationCheck;
	}

	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCurious() {
		return curious;
	}

	public void setCurious(int curious) {
		this.curious = curious;
	}

	public int getNotificationno() {
		return notificationno;
	}

	public void setNotificationno(int notificationno) {
		this.notificationno = notificationno;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getInterestString() {
		return interestString;
	}

	public void setInterestString(String interestString) {
		this.interestString = interestString;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getEndPageGroup() {
		return endPageGroup;
	}

	public void setEndPageGroup(int endPageGroup) {
		this.endPageGroup = endPageGroup;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public ArrayList<String> getInterestList() {
		return interestList;
	}

	public void setInterestList(ArrayList<String> interestList) {
		this.interestList = interestList;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	
}
