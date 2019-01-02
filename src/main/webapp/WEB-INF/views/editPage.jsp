<%--
  Created by IntelliJ IDEA.
  User: MOON
  Date: 01-Jan-19
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Edit Project Information</h2>
<form:form method = "POST" action = "/updateModule/${id}" commandName="project" >
    <table >
        <tr>
            <td><form:label path = "p_Name"></form:label></td>
            <td><form:hidden path = "p_Name" /></td>
        </tr>
        <tr>
            <td><form:label path = "m_Name">Module Name</form:label></td>
            <td><form:input path = "m_Name" /></td>
        </tr>
        <tr>
            <td><form:label path = "m_cost">Module Cost</form:label></td>
            <td><form:input path = "m_cost" /></td>
        </tr>
        <tr>
            <td><form:label path = "m_duration">Module Duration</form:label></td>
            <td><form:input path = "m_duration" /></td>
        </tr>
        <tr>
            <td colspan = "2">
                <input type = "submit" value = "Submit"     />
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
