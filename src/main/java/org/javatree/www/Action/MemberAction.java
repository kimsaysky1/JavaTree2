package org.javatree.www.Action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.apache.struts2.interceptor.SessionAware;
import org.javatree.www.DAO.memberDAO;
import org.javatree.www.VO.Ability;
import org.javatree.www.VO.Interest;
import org.javatree.www.VO.Member_jt;
import org.javatree.www.VO.Notification;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class MemberAction extends ActionSupport implements SessionAware {

	/**
	 * Value Stack 에서 사용할 멤버를 선언, setter getter 주고받는것들. 꼭만들어줘야한다.
	 **/

	private Member_jt member_jt;

	private Interest interest;
	private Ability ability;

	private Interest interest_purejava;
	private Interest interest_web;
	private Interest interest_mobile;
	private Interest interest_iot;
	private Interest interest_swing;
	private Interest interest_jdbc;
	private Interest interest_api;
	private Interest interest_spring;
	private Interest interest_struts;
	private Interest interest_etcframework;
	private Interest interest_etc;

	private List<Interest> interestList = new ArrayList<>();

	private Ability ability_purejava;
	private Ability ability_web;
	private Ability ability_mobile;
	private Ability ability_iot;
	private Ability ability_swing;
	private Ability ability_jdbc;
	private Ability ability_api;
	private Ability ability_spring;
	private Ability ability_struts;
	private Ability ability_etcframework;
	private Ability ability_etc;

	private List<Ability> abilityList = new ArrayList<>();

	private String id;
	private String password;
	private String username;
	private String email;
	private int questionno;
	
	private List<Notification> notificationList;

	private Map<String, Object> session;
	private boolean duplicated;
	
	private String message;
	
	@Autowired
	SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(MemberAction.class);

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String insertMember() {
		System.out.println("join 들어옴");
		memberDAO dao = sqlSession.getMapper(memberDAO.class);

		Member_jt member_jt = new Member_jt();

		member_jt.setId(id);
		member_jt.setPassword(password);
		member_jt.setEmail(email);
		member_jt.setUsername(username);

		dao.insertMember(member_jt);
		System.out.println("join 들어옴2");
		interestList.add(interest_purejava);
		interestList.add(interest_web);
		interestList.add(interest_mobile);
		interestList.add(interest_iot);
		interestList.add(interest_swing);
		interestList.add(interest_jdbc);
		interestList.add(interest_api);
		interestList.add(interest_spring);
		interestList.add(interest_struts);
		interestList.add(interest_etcframework);
		interestList.add(interest_etc);

		for (int i = 0; i < interestList.size(); i++) {
			interestList.get(i).setId(id);
			interestList.get(i).setTypeno(i + 1);
		}

		dao.insertInterest(interestList);
		System.out.println("join 들어옴3");
		abilityList.add(ability_purejava);
		abilityList.add(ability_web);
		abilityList.add(ability_mobile);
		abilityList.add(ability_iot);
		abilityList.add(ability_swing);
		abilityList.add(ability_jdbc);
		abilityList.add(ability_api);
		abilityList.add(ability_spring);
		abilityList.add(ability_struts);
		abilityList.add(ability_etcframework);
		abilityList.add(ability_etc);

		for (int i = 0; i < abilityList.size(); i++) {
			abilityList.get(i).setTypeno(i + 1);
			abilityList.get(i).setId(id);
		}
		System.out.println("join 들어옴4");
		dao.insertAbility(abilityList);
		System.out.println("join 들어옴5");
		message = "가입 성공!";
		return SUCCESS;
	}

	public String login() {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		member_jt = dao.selectMember(id);
		
		if (member_jt != null) {
			if (member_jt.getPassword().equals(password)) {
				session.put("loginId", id);
				session.put("loginName", member_jt.getUsername());
				notificationList = dao.checkNotification(id);
			}else{
				message = "ID 또는 비밀번호를 다시 입력해주세요.";
				return INPUT;
			}
		}
		return SUCCESS;
	}

	public String idCheck() {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		member_jt = dao.selectMember(id);
		if (member_jt == null)
			duplicated = true;
		else
			duplicated = false;

		return SUCCESS;
	}

	public String logout() {
		session.remove("loginId");
		return SUCCESS;
	}

	public String selectMember() {

		id = (String) session.get("loginId");
		memberDAO dao = sqlSession.getMapper(memberDAO.class);

		return SUCCESS;
	}

	public String updateMember() {

		if (member_jt.getPassword().equals(""))
			member_jt.setPassword(null);
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		dao.updateMember(member_jt);

		return SUCCESS;
	}

	public String checkNotification() {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		id = (String) session.get("loginId");
		notificationList = dao.checkNotification(id);
		return SUCCESS;
	}
	
	
	public Member_jt getMember_jt() {
		return member_jt;
	}

	public void setMember_jt(Member_jt member_jt) {
		this.member_jt = member_jt;
	}

	public Interest getInterest() {
		return interest;
	}

	public void setInterest(Interest interest) {
		this.interest = interest;
	}

	public Ability getAbility() {
		return ability;
	}

	public void setAbility(Ability ability) {
		this.ability = ability;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isDuplicated() {
		return duplicated;
	}

	public void setDuplicated(boolean duplicated) {
		this.duplicated = duplicated;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Interest getInterest_purejava() {
		return interest_purejava;
	}

	public void setInterest_purejava(Interest interest_purejava) {
		this.interest_purejava = interest_purejava;
	}

	public Interest getInterest_web() {
		return interest_web;
	}

	public void setInterest_web(Interest interest_web) {
		this.interest_web = interest_web;
	}

	public Interest getInterest_mobile() {
		return interest_mobile;
	}

	public void setInterest_mobile(Interest interest_mobile) {
		this.interest_mobile = interest_mobile;
	}

	public Interest getInterest_iot() {
		return interest_iot;
	}

	public void setInterest_iot(Interest interest_iot) {
		this.interest_iot = interest_iot;
	}

	public Interest getInterest_swing() {
		return interest_swing;
	}

	public void setInterest_swing(Interest interest_swing) {
		this.interest_swing = interest_swing;
	}

	public Interest getInterest_jdbc() {
		return interest_jdbc;
	}

	public void setInterest_jdbc(Interest interest_jdbc) {
		this.interest_jdbc = interest_jdbc;
	}

	public Interest getInterest_api() {
		return interest_api;
	}

	public void setInterest_api(Interest interest_api) {
		this.interest_api = interest_api;
	}

	public Interest getInterest_spring() {
		return interest_spring;
	}

	public void setInterest_spring(Interest interest_spring) {
		this.interest_spring = interest_spring;
	}

	public Interest getInterest_struts() {
		return interest_struts;
	}

	public void setInterest_struts(Interest interest_struts) {
		this.interest_struts = interest_struts;
	}

	public Interest getInterest_etcframework() {
		return interest_etcframework;
	}

	public void setInterest_etcframework(Interest interest_etcframework) {
		this.interest_etcframework = interest_etcframework;
	}

	public Interest getInterest_etc() {
		return interest_etc;
	}

	public void setInterest_etc(Interest interest_etc) {
		this.interest_etc = interest_etc;
	}

	public List<Interest> getInterestList() {
		return interestList;
	}

	public void setInterestList(List<Interest> interestList) {
		this.interestList = interestList;
	}

	public Ability getAbility_purejava() {
		return ability_purejava;
	}

	public void setAbility_purejava(Ability ability_purejava) {
		this.ability_purejava = ability_purejava;
	}

	public Ability getAbility_web() {
		return ability_web;
	}

	public void setAbility_web(Ability ability_web) {
		this.ability_web = ability_web;
	}

	public Ability getAbility_mobile() {
		return ability_mobile;
	}

	public void setAbility_mobile(Ability ability_mobile) {
		this.ability_mobile = ability_mobile;
	}

	public Ability getAbility_iot() {
		return ability_iot;
	}

	public void setAbility_iot(Ability ability_iot) {
		this.ability_iot = ability_iot;
	}

	public Ability getAbility_swing() {
		return ability_swing;
	}

	public void setAbility_swing(Ability ability_swing) {
		this.ability_swing = ability_swing;
	}

	public Ability getAbility_jdbc() {
		return ability_jdbc;
	}

	public void setAbility_jdbc(Ability ability_jdbc) {
		this.ability_jdbc = ability_jdbc;
	}

	public Ability getAbility_api() {
		return ability_api;
	}

	public void setAbility_api(Ability ability_api) {
		this.ability_api = ability_api;
	}

	public Ability getAbility_spring() {
		return ability_spring;
	}

	public void setAbility_spring(Ability ability_spring) {
		this.ability_spring = ability_spring;
	}

	public Ability getAbility_struts() {
		return ability_struts;
	}

	public void setAbility_struts(Ability ability_struts) {
		this.ability_struts = ability_struts;
	}

	public Ability getAbility_etcframework() {
		return ability_etcframework;
	}

	public void setAbility_etcframework(Ability ability_etcframework) {
		this.ability_etcframework = ability_etcframework;
	}

	public Ability getAbility_etc() {
		return ability_etc;
	}

	public void setAbility_etc(Ability ability_etc) {
		this.ability_etc = ability_etc;
	}

	public List<Ability> getAbilityList() {
		return abilityList;
	}

	public void setAbilityList(List<Ability> abilityList) {
		this.abilityList = abilityList;
	}

	public List<Notification> getNotificationList() {
		return notificationList;
	}

	public void setNotificationList(List<Notification> notificationList) {
		this.notificationList = notificationList;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
