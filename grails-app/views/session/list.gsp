
<%@ page import="abstractprocessbenchmarkgrails.Session" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'session.label', default: 'Session')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-session" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                  <div class="nav" role="navigation">
                          <ul>
                                  <li><a class="home" href="${createLink(uri: '/' + (session?.user.role.description == abstractprocessbenchmarkgrails.Role.ADMIN ? 'admin/index' : ''))}"><g:message code="default.home.label"/></a></li>
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
		<div id="list-session" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'session.description.label', default: 'Description')}" />
					
						<th><g:message code="session.process.label" default="Process" /></th>
					
						<th><g:message code="session.sessionOwner.label" default="Session Owner" /></th>
					
						<g:sortableColumn property="startDate" title="${message(code: 'session.startDate.label', default: 'Start Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sessionInstanceList}" status="i" var="sessionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sessionInstance.id}">${fieldValue(bean: sessionInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: sessionInstance, field: "process")}</td>
					
						<td>${fieldValue(bean: sessionInstance, field: "sessionOwner")}</td>
					
						<td><g:formatDate date="${sessionInstance.startDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sessionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
