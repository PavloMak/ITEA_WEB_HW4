<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

                <%
	
	
	String login = request.getParameter("login");
	String password = request.getParameter("password");
	String rePassword = request.getParameter("rePassword");
	String fullName = request.getParameter("fullName");
	String region = request.getParameter("region");
	String gender = request.getParameter("gender");
	String comment = request.getParameter("comment");
	String agreement = request.getParameter("agreement");
	
	//out.write(login + " " + password + " " + rePassword + " " + fullName + " " + region + " " + gender + " " +  comment + " " + agreement);
	
	boolean isError = false;
	
	
	String errorText = "<ul>";
	if(login == null || login.isEmpty()) {
		isError = true;
		errorText += "<li>login is empty</li>";
	}else if(!login.matches(".*@.*\\.com")){
		isError = true;
		errorText += "<li>incorect login</li>";
	}	
	
	if(password == null || password.isEmpty()){
		isError = true;
		errorText += "<li>password is empty</li>";
	}else{
		if(password.length()<8){
			isError = true;
			errorText += "<li>password is too short</li>";
		}		
		if(!password.matches(".*[0-9].*")){
			isError = true;
			errorText += "<li>password has to contain at least one digit</li>";
		}
		if(!password.matches(".*[A-Z].*")){
			isError = true;
			errorText += "<li>password has to contain at least capital letter</li>";
		}
	}
	
	if(rePassword == null || rePassword.isEmpty())
	{
		isError = true;
		errorText += "<li>rePassword is empty</li>";
	}
	else if (password != null && !password.isEmpty())
	{
		if(!rePassword.equals(password))
		{
		isError = true;
		errorText += "<li>rePassword and password are different</li>";
		}	
	}
	
	if(fullName == null || fullName.isEmpty()){
		isError = true;
		errorText += "<li>fullName is empty</li>";
	}
	if(gender == null || gender.isEmpty()){
		isError = true;
		errorText += "<li>gender is not chosen</li>";
	}
	if(agreement == null || agreement.isEmpty()){
		isError = true;
		errorText += "<li>agreement is not checked</li>";
	}
	
	errorText += "</ul>";
%>

	<div style="width: 100%;">
<%	
	if(isError){
%>
        <div style="width: 50%; height: 100px; float: left;"> 
            <form action="">
			   <table border="0">
				  <tr>
					 <td width="100">Login</td>
					 <td ><input type="email" name="login" value="<%=login!=null ? login:""%>"/></td>
				  </tr>
				  <tr>
					 <td>Password</td>
					 <td><input type="password" name="password" /></td>
				  </tr>
				  <tr>
					 <td>Re-Password</td>
					 <td><input type="password" name="rePassword" /></td>
				  </tr>
				  <tr>
					 <td>Full name</td>
					 <td><input type="text" name="fullName" value="<%=fullName!=null ? fullName:""%>"/></td>
				  </tr>
				  <tr>
					 <td>Region</td>
					 <td>
						 <select name = "region">
						 <option value = "Lviv" <%="Lviv".equals(region) ? "selected":""%>>Lviv region</option>
						 <option value = "Kyiv" <%="Kyiv".equals(region) ? "selected":""%>>Kyiv region</option>
						 <option value = "Kharkiv" <%="Kharkiv".equals(region) ? "selected":""%>>Kharkiv region</option>
						 </select>
					 </td>
				  </tr>
				  <tr>
					 <td>Gender</td>
						<td>
							F <input type="radio" value = "F" name="gender" <%="F".equals(gender) ? "checked":""%>/>
							M <input type="radio" value = "M" name="gender" <%="M".equals(gender) ? "checked":""%>/>
						</td>
				  </tr>
				  <tr>
					 <td>Comment</td>
						<td>
							<textarea cols = "10" rows = "5" name = "comment"><%=comment!=null ? comment:""%></textarea>
						</td>
				  </tr>
				  <tr>
					 <td>I gree for personal</td>
						<td>
							<input type="checkbox" name="agreement"/>
						</td>
				  </tr>
				  <tr>
					 <td align="center" colspan="2"><input type="submit" value="Send" /></td>
				  </tr>
			   </table>
		   </form>
        </div>

        
	
	
<%	
	}
%>
		<div style="margin-left: 50%; height: 100px;"> 
<%	
		if(region!=null){
			if(isError){
			out.write(errorText);
			}else{
			out.write("Registration successful");
			}
		}
%>
        </div>
    </div>
			   <%@ include file="footer.jsp" %>
			   