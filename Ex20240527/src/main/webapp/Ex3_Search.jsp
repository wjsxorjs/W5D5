<%@page import="am.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="am.service.FactoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.getParameter("");


	// FactoryService를 통해 SqlSession을 얻고
	// 이를 통해 사원 목록을 가져온다.
	SqlSession ss = FactoryService.getFactory().openSession();
	List<EmpVO> e_list = ss.selectList("emp.search",s_map);
	
	if(e_list.size()>0){
		int num = 1;
		for(EmpVO evo: e_list){
%>
			<tr>
				<td><%=num %></td>
				<td><%=evo.getEmpno() %></td>
				<td><%=evo.getEname() %></td>
				<td><%=evo.getJob() %></td>
				<td><%=evo.getHiredate() %></td>
				<td><%=evo.getDeptno() %></td>
			</tr>
<%
			num++;
		}
		
		ss.close();
	}

%>