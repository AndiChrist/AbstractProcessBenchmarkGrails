
<%@ page import="abstractprocessbenchmarkgrails.Result" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-result" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                  <div class="nav" role="navigation">
                          <ul>
                                  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                  <g:if test="${session?.user}">
                                      <li><g:link class="logout" controller="user" action="logout"><g:message code="default.logout.label" args="[entityName]" /></g:link></li>
                                  </g:if>
                                  <g:else>
                                      <li><g:link class="login" controller="user" action="login"><g:message code="default.login.label" args="[entityName]" /></g:link></li>
                                  </g:else>
                                  <g:if test="${session?.user?.admin}">
                                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                  </g:if>
                          </ul>
                  </div>
		<div id="list-result" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="ID" title="${message(code: 'result.Id.label', default: 'ID')}" />
					
						<th><g:message code="result.session.label" default="Session" /></th>
					
						<g:sortableColumn property="startTime" title="${message(code: 'result.startTime.label', default: 'Start Time')}" />
						<g:sortableColumn property="endTime" title="${message(code: 'result.endTime.label', default: 'End Time')}" />
					
						<th><g:message code="result.task.label" default="Task" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${resultInstanceList}" status="i" var="resultInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${resultInstance.id}">${resultInstance.id}</g:link></td>
					
						<td>${fieldValue(bean: resultInstance, field: "session")}</td>
                                                <% 
                                                    Date startDate = new Date(resultInstance.startTime) 
                                                    Date endDate = new Date(resultInstance.endTime) 
                                                    
                                                    def startDateFormatted = DateFormat.getDateInstance(DateFormat.SHORT, request.locale).format(startDate)
                                                    def startTimeFormatted = new SimpleDateFormat('kk:mm:ss').format(startDate)
                                                    def endDateFormatted = DateFormat.getDateInstance(DateFormat.SHORT, request.locale).format(endDate)
                                                    def endTimeFormatted = new SimpleDateFormat('kk:mm:ss').format(endDate)
                                                    //def tftf = DateFormat.getDateInstance(DateFormat.SHORT, request.locale).format(_startTime)
                                                    
                                                    //def koko = startDate.time 
                                                    // {new Date(_endTime).format('yyyy-MM-dd')}
                                                %>
						<td>${startDateFormatted} @ ${startTimeFormatted}</td>
                                                <td>${endDateFormatted} @ ${endTimeFormatted}</td>
					
						<td>${fieldValue(bean: resultInstance, field: "task")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${resultInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
