
<%@ page import="abstractprocessbenchmarkgrails.Process" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'process.label', default: 'Process')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-process" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                  <div class="nav" role="navigation">
                          <ul>
                                  <li><a class="home" href="${createLink(uri: '/' + (session?.user.role.description == abstractprocessbenchmarkgrails.Role.ADMIN ? 'admin/index' : ''))}"><g:message code="default.home.label"/></a></li>
                                  <li><a class="back" href="javascript:history.back();"><g:message code="default.back.label" default="Back" /></a></li>
                                  <g:if test="\${session?.user}">
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
		<div id="list-process" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="alias" title="${message(code: 'process.alias.label', default: 'Alias')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'process.description.label', default: 'Description')}" />
					
						<th><g:message code="process.domain.label" default="Domain" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${processInstanceList}" status="i" var="processInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${processInstance.id}">${fieldValue(bean: processInstance, field: "alias")}</g:link></td>
					
						<td>${fieldValue(bean: processInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: processInstance, field: "domain")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${processInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
