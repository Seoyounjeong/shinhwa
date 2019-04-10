<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int date = Integer.parseInt(request.getParameter("date"));
	int lastDay = Integer.parseInt(request.getParameter("lastday"));

	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
%>
<body>
	<h1>일정추가하기</h1>
	<form action="CalController.do" method="post">
		<input type="hidden" name="command" value="insertcal" />
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="ksg" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>일정</td>
				<td>
					<select name="year">
					<%
						for(int i=year-5;i<=year+5;i++){
							%>
							<option value="<%=i%>"<%=year==i?"selected":""%>><%=i%></option>
							<% 
						}
					%>
					</select>년
					<select name="month">
						<%
						for(int i=1;i<=12;i++){
							%>
							<option value="<%=i%>"<%=month==i?"selected":""%>><%=i%></option>
							<% 
						}
					%>
					</select>월
					<select name="date">
						<%
						for(int i=1;i<=lastDay;i++){
							%>
							<option value="<%=i%>"<%=date==i?"selected":""%>><%=i%></option>
							<% 
						}
					%>
					</select>일
					<select name="hour">
						<%
						for(int i=0;i<24;i++){
							%>
							<option value="<%=i%>"<%=hour==i?"selected":""%>><%=i%></option>
							<% 
						}
					%>
					</select>시
					<select name="min">
						<%
						for(int i=0;i<60;i++){
							%>
							<option value="<%=i%>"<%=min==i?"selected":""%>><%=i%></option>
							<% 
						}
					%>
					</select>분
					
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>
			<tr>
				<td>
				<input type="submit" value="일정추가"/>
				<input type="button" value="달력" onclick="location.href='CalControler.do?command=calendar'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>