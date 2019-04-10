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
	//텍스트로 되어있는 파라미터는 request.getParameter("seq")
	//Object obj=request.getAttribute("dto");//객체를 받을때
	//CalDto dto=(CalDto)obj;
	//CalDto dto=(CalDto)request.getAttribute("dto");
%>
<jsp:useBean id="util" class="com.hk.utils.Util"/>
<body>
	<h1>일정상세보기</h1>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>${dto.id}</td>
		</tr>
		<tr>
			<td>일정</td>
			<td><jsp:setProperty property="toDates" name="util" value="${dto.mdate}"/>
				<jsp:getProperty property="toDates" name="util"/>
			</td>
		
		</tr>
		<tr>
			<td>제목</td>
			<td>${dto.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.content}</textarea></td>
		</tr>
		<tr>
			
			<td colspan="2">
				<input type="button" value="수정" onclick="updateForm(${dto.seq})"/>
				<input type="button" value="삭제" onclick="delBoard(${dto.seq})"/>
				<input type="button" value="달력" onclick="calendar()"/>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		function updateForm(seq){
			location.href="CalController.do?command=calupdateform&seq="+seq;
				
		}
		function delBoard(seq){
			location.href="CalController.do?command=muldel&chk="+seq;
		}
		function calendar(){
			location.href="CalController.do?command=calendar";
		}
	</script>
</body>
</html>