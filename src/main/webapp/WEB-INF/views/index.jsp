<%--
  Created by IntelliJ IDEA.
  User: MOON
  Date: 01-Jan-19
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<head>
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #customers tr:nth-child(even){background-color: #f2f2f2;}

        #customers tr:hover {background-color: #ddd;}

        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
    </style>
    <title>Title</title>
</head>
<body>

<h2>Project cost Mesurement System</h2>

<%--@elvariable id="project" type=""--%>
<form:form method = "POST" action = "/addProject" commandName="project" >
    <table id = 01>
        <tr>
            <td><form:label path = "p_Name">Project Name</form:label></td>
            <td><form:input path = "p_Name" /></td>
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
<br>

<h2>Submitted Project Information</h2>

<table id="customers">
    <tr>
        <th>Project Name</th>
        <th>Module Name</th>
        <th>COST</th>
        <th>Duration</th>
        <th>Edit Project</th>
        <th>Delete Project</th>
    </tr>
<c:forEach items="${mapList}" var="map">
<tr>
    <td>${map.value.getP_Name()}</td>
    <td>${map.value.getM_Name()}</td>
    <td>${map.value.getM_cost()}</td>
    <td>${map.value.getM_duration()}</td>
    <td><a href="editProject/${map.key}"> Edit</a></td>
    <td><a href="/${map.key}"> Delete</a></td>
</tr>
</c:forEach>
        </table>
<h4> Total cost : ${total_cost} </h4>
<h4> Total Duration : ${total_duration}h</h4>
</body>
</html>
