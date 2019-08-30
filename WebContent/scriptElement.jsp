<%@page import="java.util.Calendar"%>
<%@ page pageEncoding="utf-8"%>
<html>
	<body>
		<h1>Scripting Element</h1>
		<%!
			//declaration
			private int age;
			public void m() {
				
			}
		%>
		<%
		%>
		<select>
			<%
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			
			for(int i = 1950; i<=year; i++) {
			%>
			<option value='<%=i %>' <%if((year-20)==i){ %>selected="selected"<%} %> ><%=i %></option>
			<% 
			}
			%>
			
		</select>
		<%
			//scriptlet
			int tt;		  //로컬변수이므로 private불가능
			m();          //method 생성불가, 사용은 가능
		%>
	</body>
</html>