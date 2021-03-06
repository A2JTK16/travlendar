<%-- 
    Document   : event
    Created on : Oct 17, 2017, 10:16:20 AM
    Author     : AGS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1>List Agenda</h1>
    <table>
        <tr>
            <th>No</th>
            <th>Location ID</th>
            <th>Event ID</th>
            <th>Traveller ID</th>
            <th>Event Name</th>
            <th>Start Event</th>
            <th>End Event</th>
            <th>Note</th>
            <th>Place</th>
            <th></th>
        </tr>
        
        <c:set var="count" value="0" scope="page" />
        <c:forEach items="${eventList}" var="event">
        <tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
            <td><c:out value="${count}"/></td>
            <td><c:out value="${event.getLocation_id()}"/></td>
            <td><c:out value="${event.getEvent_id()}"/></td>
            <td><c:out value="${event.getTraveller_id()}"/></td>
            <td><c:out value="${event.getEvent_name()}"/></td>
            <td><c:out value="${event.getStart_event()}"/></td>
            <td><c:out value="${event.getEnd_event()}"/></td>
            <td><c:out value="${event.getNote()}"/></td>
            <td><c:out value="${event.getPlace()}"/></td>
            <td><a href="http://localhost:8080/Travlendar/event?action=edit&code=<c:out value="${event.getEvent_id()}"/>">Edit</a></td>
        </tr>
        </c:forEach>
    </table>    
