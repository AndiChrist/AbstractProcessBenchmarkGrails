
<%@ page import="abstractprocessbenchmarkgrails.Process" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'process.label', default: 'Process')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-process" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/' + (session?.user.role.description == abstractprocessbenchmarkgrails.Role.ADMIN ? 'admin/index' : ''))}"><g:message code="default.home.label"/></a></li>
                                <g:if test="\${session?.user}">
                                    <li><g:link class="logout" controller="user" action="logout"><g:message code="default.logout.label" args="[entityName]" /></g:link></li>
                                </g:if>
                                <g:else>
                                    <li><g:link class="login" controller="user" action="login"><g:message code="default.login.label" args="[entityName]" /></g:link></li>
                                </g:else>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                                <g:if test="${session?.user?.admin}">
                                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                    <g:if test="true">
                                      <li><g:link class="clone" action="clone" id="${processInstance?.id}"><g:message code="default.clone.label" args="[entityName]" /></g:link></li>
                                    </g:if>
                                </g:if>
			</ul>
		</div>
		<div id="show-process" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list process">
			
				<g:if test="${processInstance?.alias}">
				<li class="fieldcontain">
					<span id="alias-label" class="property-label"><g:message code="process.alias.label" default="Alias" /></span>
					
						<span class="property-value" aria-labelledby="alias-label"><g:fieldValue bean="${processInstance}" field="alias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${processInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="process.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${processInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${processInstance?.domain}">
				<li class="fieldcontain">
					<span id="domain-label" class="property-label"><g:message code="process.domain.label" default="Domain" /></span>
					
						<span class="property-value" aria-labelledby="domain-label"><g:link controller="domain" action="show" id="${processInstance?.domain?.id}">${processInstance?.domain?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${processInstance?.sessions}">
				<li class="fieldcontain">
					<span id="sessions-label" class="property-label"><g:message code="process.sessions.label" default="Sessions" /></span>
					
						<g:each in="${processInstance.sessions}" var="s">
						<span class="property-value" aria-labelledby="sessions-label"><g:link controller="session" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${processInstance?.tasks}">
				<li class="fieldcontain">
					<span id="tasks-label" class="property-label"><g:message code="process.tasks.label" default="Tasks" /></span>
					
						<g:each in="${processInstance.tasks}" var="t">
						<span class="property-value" aria-labelledby="tasks-label"><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
                        <g:if test="${session?.user?.admin}">
                            <g:form>
                                    <fieldset class="buttons">
                                            <g:hiddenField name="id" value="${processInstance?.id}" />
                                            <g:link class="edit" action="edit" id="${processInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                         
                                    </fieldset>
                            </g:form>
                        </g:if>  
		</div>
	</body>
</html>
