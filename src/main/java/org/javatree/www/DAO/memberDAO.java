package org.javatree.www.DAO;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.javatree.www.VO.Ability;
import org.javatree.www.VO.Interest;
import org.javatree.www.VO.Member_jt;
import org.javatree.www.VO.Notification;

public interface memberDAO {
	
	public void insertMember(Member_jt member_jt);
	public void insertInterest(List<Interest> interestList);
	public void insertAbility(List<Ability> abilityList);
	
	public Member_jt selectMember(String id);
	public int updateMember(Member_jt member_jt);
	public Member_jt searchMember(Member_jt member_jt);
	public void insertMember(HashMap<String, Object> map);
	public List<Notification> checkNotification(String id);
	
}
