package org.javatree.www.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoggingInterceptor extends AbstractInterceptor{
	/**
	 * 
	 */
	public LoggingInterceptor() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		ActionContext context = invocation.getInvocationContext();
		Map<String, Object> session = context.getContext().getSession();
		System.out.println("000loginInterceptor-customer!=null - invocation->execute // 로그인 아이디: " + ((String)session.get("loginId")));
		if((String)session.get("loginId") == null){
			System.out.println("loginInterceptor-loginId==null");
			return Action.LOGIN;
		}
		//session.put("loginId", ((String)session.get("loginId")));
		System.out.println("loginInterceptor-customer!=null - invocation->execute // 로그인 아이디: " + ((String)session.get("loginId")));
		return invocation.invoke();
	}
}
