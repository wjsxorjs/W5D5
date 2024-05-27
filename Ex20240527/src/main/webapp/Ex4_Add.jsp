<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="am.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	String m_phone = request.getParameter("m_phone");

	SqlSession ss = FactoryService.getFactory().openSession();
	
	Map<String, String> m_map = new HashMap<>();
	
	m_map.put("m_id",m_id);
	m_map.put("m_pw",m_pw);
	m_map.put("m_name",m_name);
	m_map.put("m_email",m_email);
	m_map.put("m_phone",m_phone);
	
	
	int chk = ss.insert("member.add",m_map);
	
	if(chk==1){
		ss.commit();
	} else{
		ss.rollback();
	}

	ss.close();
%>