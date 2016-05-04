package org.javatree.www.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.javatree.www.VO.Course;
import org.javatree.www.VO.Member_jt;
import org.javatree.www.VO.Notification;
import org.javatree.www.VO.Question;
import org.javatree.www.VO.Reply;
import org.javatree.www.VO.Rereply;

public interface QnaDAO {

	public void insertQuestion(Question question);
	public void insertReply(Reply reply);
	public Question selectOneQuestion(int questionno);
	public List<Reply> selectAllReply(int questionno);
	public List<Rereply> selectAllRereply(int replyno);
	public int getTotal();
	public List<Question> selectAllQuestion(Map map);
	public List<Question> gunggumAllQuestionList();
	public List<Question> gunggumRecentQuestionList();
	public List<Reply> bestAllQuestionList();
	public List<Reply> bestRecentQuestionList();
	public void insertRereply(Rereply rereply);
	public Member_jt selectOneMember(String string);
	public List<Question> selectAllQuestionRelatedInCoding(Map map);
	public void clickNotification(Map map);
	public String selectTypeName(int typenoTemp);
	public void addCurious(Map map);
	public void insertNotification(Notification notification);
	public void addRecommend(Map map);
	public int selectFieldTotal(Map<String, Object> kong);
	public List<Question> selectListbyField(Map<String, Object> kong);
	public void addGunggumNotification(Map map);
	public ArrayList<String> selectGunggumNotification(int questionno);
	public void deleteGunggumNotification(int questionno);
	public void insertNotificationForCoding(Notification notification);
	public String selectIdForCoding(int codingnoTemp);
	public int selectQuestionno();
}
