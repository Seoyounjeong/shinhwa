<%@page import="com.hk.utils.Util"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.hk.calboard.daos.CalDao"%>
<%@page import="com.hk.calboard.dtos.CalDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>달력 보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
 <style type="text/css">
 
table td {
position:relative;
   height: 85px; vertical-align:top;
}
table{
   border :1px solid gray;
   border-collapse: collapse;
}
a{text-decoration:none;}
img{width:30px; height:20px;}
.clist{background-color: orange;}
.countview{color:orange; font-weight:bold;}
.count{font-size:10px;}
.cPreview{
	position:absolute;
	left:10px;
	top:-30px;
	background-color:pink;
	width:40px;
	height:40px;
	border-radius: 40px 40px 40px 1px;
	text-align:center;
	line-height:40px;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".countview").hover(function(){
			var aCountView=$(this); //현재 마우스를 올린 a태그객체
//			var year=${"caption>span"}.eq(0).text();
			var year=$(".y").text().trim();	//trim()문자열의 앞뒤 공백을 제거
			var month=$(".m").text().trim();
			var date=aCountView.text().trim();
			var yyyyMMdd=year+isTwo(month)+isTwo(date);
			//alert(yyyyMMdd);
			$.ajax({
				method:"post",
				url:"CalCountAjax.do",
				data:{"yyyyMMdd":yyyyMMdd},
				success:function(obj){//obj 변수가 전달된 값을 받는다
					//alert(obj);
				//append(),prepend():자식요소로 추가
				//after(),before():형제레벨에서 다음이나 앞에 추가
					aCountView.after("<div class='cPreview'>"+obj+"</div>");
				},
				error:function(){
					alert("서버통신실패!!!");
				}
			});//{"key":"value","key":"value"},배열[value,value...]
		},function(){
			$(".cPreview").remove();//remove()엘리먼트를 삭제한다.
		});
	});
	//한자리 문자열을 두자리로 만들어주는 함수
	function isTwo(n){
		return n.length<2?"0"+n:n;
	}
</script>

</head>
<%
	//달력의 날짜를 바꾸기 위해서 전달된 year와 month값을 받는다
   String pYear=request.getParameter("year");
   String pMonth=request.getParameter("month");

   Calendar cal = Calendar.getInstance(); //calendar객체는 new를 사용하지 않는다
   int year = cal.get(Calendar.YEAR);//현재 년도를 구함
   int month = cal.get(Calendar.MONTH) + 1;//현재 월을 구함
   
   if(pYear!=null){
      year=Integer.parseInt(pYear);
   }
   if(pMonth!=null){
      month=Integer.parseInt(pMonth);
   }

   //달중에 12월을 넘어갔을경우 month는 1월로, 년도는 다음년도로갑을 바꿔준다.
   if(month>12){
	   month=1;
	   year++;
   }
   //달중에 1월을 뒤로 넘어갔을 경우month는 12월로, 년도는 전년도로 값을 바꿔준다.
   if(month<1){
	   month=12;
	   year--;
   }
   
   
   //현재 월의 1일에 대한 요일 구하기 --> 현재날짜에 대한 정보를 담고 있는 calendar 객체 생성
   //               --> 3월 1일로 셋팅을 해서 요일을 구함
   cal.set(year, month - 1, 1); //2019년 3월 1일로 바꿔준다
   int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); //1일에 대한 요일구함 :1(일)~7(토)

   //월의 마지막 날 구하기
   int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
   //한달에 대한 일정목록 가져오기
  //	CalDao dao = new CalDao();
	//String id = "ksg";
	//String yyyyMM = year + Util.isTwo(String.valueOf(month));//201903
	//List<CalDto> list = dao.getCalViewList(id, yyyyMM);
%>
<body>
   <h1>달력(일정)보기</h1>
  

   <table border="1">
      <caption>
      <a href="calendar.jsp?year=<%=year-1%>&month=<%=month%>">◁</a>
      <a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>
      <span class="y"><%=year%></span>년<span class="m"><%=month%></span>월
      <a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">▶</a>
      <a href="calendar.jsp?year=<%=year+1%>&month=<%=month%>">▷</a>
      </caption>
      <col width="80px">
      <col width="80px">
      <col width="80px">
      <col width="80px">
      <col width="80px">
      <col width="80px">
      <col width="80px">
      <tr>
         <th>일</th>
         <th>월</th>
         <th>화</th>
         <th>수</th>
         <th>목</th>
         <th>금</th>
         <th>토</th>
      </tr>
      <tr>
      <%
         //공배수 출력하기
         for (int i = 0; i < (dayOfWeek - 1); i++) {
            out.print("<td>&nbsp;</td>");
         }
         //일수 출력하기
         for (int i = 1; i <= lastDay; i++) {
      %>
      <td>
      
      <a class="countview" style="color:<%=Util.fontColor(dayOfWeek, i)%>;" href="CalController.do?command=callist&year=<%=year%>&month=<%=month%>&date=<%=i%>"><%=i%></a>
      
      <a href="CalController.do?command=insertform&year=<%=year%>&month=<%=month%>&date=<%=i%>&lastday=<%=lastDay%>">
      		<img src="img/pen.png" alt="일정추가" />
      </a>
<%--      		 <%=Util.getCalView(list, i)%> --%>
      </td>
     

      <%
         //dayofWeek-1은 공백수 : (공백수+날짜)%7==0 토요일
            if ((dayOfWeek - 1 + i) % 7 == 0) {
               out.print("</tr><tr>");//
            }
         }
         //달력의 나머지 공백수 출력(공백 ID)
         //7-((dayOfWeek-1+lastDay)%7)
         for(int i=0; i<(7-((dayOfWeek-1+lastDay)%7));i++){
        	 out.print("<td>&nbsp;</td>");
         }
         
      %>
      </tr>
   </table>
   
</body>
</html>