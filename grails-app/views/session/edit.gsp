<%@ page import="abstractprocessbenchmarkgrails.Session" %>
<%@ page import="abstractprocessbenchmarkgrails.Result" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'session.label', default: 'Session')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-session" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <g:if test="${session?.user}">
                                    <li><g:link class="logout" controller="user" action="logout"><g:message code="default.logout.label" args="[entityName]" /></g:link></li>
                                </g:if>
                                <g:else>
                                    <li><g:link class="login" controller="user" action="login"><g:message code="default.login.label" args="[entityName]" /></g:link></li>
                                </g:else>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-session" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${sessionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${sessionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${sessionInstance?.id}" />
				<g:hiddenField name="version" value="${sessionInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<g:if test="${sessionInstance?.process?.tasks}">
                                  <div id="list-session" class="content scaffold-list" role="main">
                                          <h1><g:message code="default.list.label" args="['Task']" /></h1>
                                          <table>
                                                  <thead>
                                                          <tr>
                                                                  <g:sortableColumn property="description" title="${message(code: 'session.process.tasks.description.label', default: 'Description')}" />
                                                                  <th><g:message code="session.process.tasks.sequence.label" default="Sequence" /></th>
                                                                  <th><g:message code="session.process.tasks.taskOwner.label" default="Task Owner" /></th>
                                                                  <th><g:message code="session.process.tasks.role.label" default="Role" /></th>
                                                                  <th><g:message code="session.process.tasks.system.label" default="System" /></th>
                                                                  <th><g:message code="session.process.tasks.media.label" default="Media" /></th>
                                                                  <th><g:message code="session.process.tasks.view.label" default="View" /></th>
                                                                  <th><g:message code="session.result" default="Result" /></th>
                                                          </tr>
                                                  </thead>
                                                  <tbody>
                                                   <% def oldTask %>
                                                   <g:each in="${sessionInstance?.process?.tasks}" status="i" var="task">
                                                          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                                                  <td><g:link action="show" controller="task" id="${task.id}">${fieldValue(bean: task, field: "description")}</g:link></td>
                                                                  <td>${fieldValue(bean: task, field: "sequence")}</td>
                                                                  <td>${fieldValue(bean: task, field: "taskOwner")}</td>
                                                                  <td>${fieldValue(bean: task, field: "role")}</td>
                                                                  <td>${fieldValue(bean: task, field: "system")}</td>
                                                                  <td>${fieldValue(bean: task, field: "media")}</td>
                                                                  <td>${fieldValue(bean: task, field: "view")}</td>
                                                                  <% 
                                                                    def result = Result.findByTaskAndSession(task, sessionInstance)
                                                                    def prevResult = oldTask ? Result.findByTaskAndSession(oldTask, sessionInstance) : null
                                                                    def duration = result ? result.endTime - result.startTime : 0                                                                    
                                                                  %>
                                                                  <td>
                                                                      <g:if test="${oldTask}">
                                                                        <g:if test="${prevResult.endTime > 0}">
                                                                          <g:if test="${duration == 0}">
                                                                            <g:link action="startTask" controller="result" params="[taskId: task.id, sessionId: sessionInstance.id]"><img src="${resource(dir: 'images/skin', file: 'icon_run.png')}"/></g:link>
                                                                          </g:if>
                                                                          <g:if test="${duration < 0}">
                                                                            <g:link action="stopTask" controller="result"  params="[taskId: task.id, sessionId: sessionInstance.id]"><img src="${resource(dir: 'images/skin', file: 'icon_stop.png')}"/></g:link>
                                                                          </g:if>
                                                                          <g:if test="${duration > 0}">
                                                                            <span style="color:red">${duration/1000} sec.</span>
                                                                          </g:if>
                                                                        </g:if>
                                                                      </g:if>
                                                                      <g:else>
                                                                        <g:if test="${result.endTime}">
                                                                          <span style="color:red">${duration/1000} sec.</span>
                                                                        </g:if>
                                                                        <g:else>
                                                                          <g:if test="${duration == 0}">
                                                                            <g:link action="startTask" controller="result" params="[taskId: task.id, sessionId: sessionInstance.id]"><img src="${resource(dir: 'images/skin', file: 'icon_run.png')}"/></g:link>
                                                                          </g:if>
                                                                          <g:if test="${duration < 0}">
                                                                            <g:link action="stopTask" controller="result"  params="[taskId: task.id, sessionId: sessionInstance.id]"><img src="${resource(dir: 'images/skin', file: 'icon_stop.png')}"/></g:link>
                                                                          </g:if>
                                                                          <g:if test="${duration > 0}">
                                                                            <span style="color:red">${duration/1000} sec.</span>
                                                                          </g:if>                                                                        </g:else>
                                                                      </g:else>
                                                                  </td>
                                                                  
                                                          </tr>
                                                          <% oldTask = task %>
                                                  </g:each>
                                                  </tbody>
                                          </table>
                                  </div>
				</g:if>

				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>                        
		</div>
	</body>
</html>
