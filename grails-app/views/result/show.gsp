
<%@ page import="abstractprocessbenchmarkgrails.Result" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-result" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/' + (session?.user.role.description == abstractprocessbenchmarkgrails.Role.ADMIN ? 'admin/index' : ''))}"><g:message code="default.home.label"/></a></li>
                                <li><a class="back" href="javascript:history.back();"><g:message code="default.back.label" default="Back" /></a></li>
                                <g:if test="${session?.user}">
                                    <li><g:link class="logout" controller="user" action="logout"><g:message code="default.logout.label" args="[entityName]" /></g:link></li>
                                </g:if>
                                <g:else>
                                    <li><g:link class="login" controller="user" action="login"><g:message code="default.login.label" args="[entityName]" /></g:link></li>
                                </g:else>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                                <g:if test="${session?.user?.admin}">
                                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                    <g:if test="false">
                                      <li><g:link class="clone" action="clone" id="${resultInstance?.id}"><g:message code="default.clone.label" args="[entityName]" /></g:link></li>
                                    </g:if>
                                </g:if>
			</ul>
		</div>
		<div id="show-result" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list result">
			
				<g:if test="${resultInstance?.endTime}">
				<li class="fieldcontain">
					<span id="endTime-label" class="property-label"><g:message code="result.endTime.label" default="End Time" /></span>
					
						<span class="property-value" aria-labelledby="endTime-label"><g:fieldValue bean="${resultInstance}" field="endTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resultInstance?.session}">
				<li class="fieldcontain">
					<span id="session-label" class="property-label"><g:message code="result.session.label" default="Session" /></span>
					
						<span class="property-value" aria-labelledby="session-label"><g:link controller="session" action="show" id="${resultInstance?.session?.id}">${resultInstance?.session?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${resultInstance?.startTime}">
				<li class="fieldcontain">
					<span id="startTime-label" class="property-label"><g:message code="result.startTime.label" default="Start Time" /></span>
					
						<span class="property-value" aria-labelledby="startTime-label"><g:fieldValue bean="${resultInstance}" field="startTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resultInstance?.task}">
				<li class="fieldcontain">
					<span id="task-label" class="property-label"><g:message code="result.task.label" default="Task" /></span>
					
						<span class="property-value" aria-labelledby="task-label"><g:link controller="task" action="show" id="${resultInstance?.task?.id}">${resultInstance?.task?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
                        <g:if test="${session?.user?.admin}">
                            <g:form>
                                    <fieldset class="buttons">
                                            <g:hiddenField name="id" value="${resultInstance?.id}" />
                                            <g:link class="edit" action="edit" id="${resultInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                         
                                    </fieldset>
                            </g:form>
                        </g:if>  
		</div>
	</body>
</html>
