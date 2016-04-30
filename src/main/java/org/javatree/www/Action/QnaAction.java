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

	private ArrayList<Course> courseList;

	public String insertQuestionByModal() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		String loginId = (String) session.get("loginId");
		String loginName = (String) session.get("loginName");
		int typenoTemp = Integer.parseInt(typeno);
		question.setId(loginId);
		question.setUsername(loginName);
		question.setTypeno(typenoTemp);
		typeName = dao.selectTypeName(typenoTemp);
		dao.insertQuestion(question);
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
		makeQnaDefaultMain(loginId);
		return SUCCESS;
	}

	public String insertReply() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		String loginId = (String) session.get("loginId");
		String loginName = (String) session.get("loginName");
		reply.setId(loginId);
		reply.setUsername(loginName);
		dao.insertReply(reply);
		notification.setSenderid(loginId);
		notification.setMessage(loginId + " 님이 답변을 다셨습니다.");
		dao.insertNotification(notification);
		question = dao.selectOneQuestion(reply.getQuestionno());
		replyList = dao.selectAllReply(reply.getQuestionno());
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
		Map map = new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		map.put("typenoList", typenoList);
		questionList = dao.selectAllQuestion(map);
		gunggumAllQuestionList = dao.gunggumAllQuestionList();
		gunggumRecentQuestionList = dao.gunggumRecentQuestionList();
		bestAllQuestionList = dao.bestAllQuestionList();
		bestRecentQuestionList = dao.bestRecentQuestionList();
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
		if (loginId == null) {
			return ERROR;
		}
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
		return SUCCESS;
	}

	public String addRecommend() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		Map map = new HashMap();
		recommend = reply.getRecommend() + 1;
		map.put("replyno", reply.getReplyno());
		map.put("recommend", recommend);
		dao.addRecommend(map);
		return SUCCESS;
	}
	
	/**
	 * qnaDefaultMain - 분야별 검색
	 * **/
	
	public String selectListbyField(){
		
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
		
		//궁금도 랭킹
		/*allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();*/
		
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

	public ArrayList<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(ArrayList<Course> courseList) {
		this.courseList = courseList;
	}
	
	
}
