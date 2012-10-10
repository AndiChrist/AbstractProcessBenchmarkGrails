
<%@ page import="abstractprocessbenchmarkgrails.Session" %>
<%@ page import="abstractprocessbenchmarkgrails.Result" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'session.label', default: 'Session')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-session" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/' + (session?.user.role.description == abstractprocessbenchmarkgrails.Role.ADMIN ? 'admin/index' : ''))}"><g:message code="default.home.label"/></a></li>
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
                                      <li><g:link class="clone" action="clone" id="${sessionInstance?.id}"><g:message code="default.clone.label" args="[entityName]" /></g:link></li>
                                    </g:if>
                                </g:if>
			</ul>
		</div>
		<div id="show-session" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list session">
			
				<g:if test="${sessionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="session.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${sessionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sessionInstance?.process}">
				<li class="fieldcontain">
					<span id="process-label" class="property-label"><g:message code="session.process.label" default="Process" /></span>
					
						<span class="property-value" aria-labelledby="process-label"><g:link controller="process" action="show" id="${sessionInstance?.process?.id}">${sessionInstance?.process?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sessionInstance?.sessionOwner}">
				<li class="fieldcontain">
					<span id="sessionOwner-label" class="property-label"><g:message code="session.sessionOwner.label" default="Session Owner" /></span>
					
						<span class="property-value" aria-labelledby="sessionOwner-label"><g:link controller="user" action="show" id="${sessionInstance?.sessionOwner?.id}">${sessionInstance?.sessionOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sessionInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="session.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${sessionInstance?.startDate}" /></span>
					
				</li>
				</g:if>
                          
                                <% 
                                  def durations = []
                                  sessionInstance?.results.each { 
                                    def d = it.endTime - it.startTime 
                                    if (d > 0)
                                      durations << d
                                  } 
                                %>
				<g:if test="${durations.sum() > 0}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="session.xxx.label" default="Gesamtdauer" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label">${durations.sum() / 1000} sec.</span>
					
				</li>
				</g:if>
                          
			</ol>
                        <!--
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
                                                       def duration = result ? result.endTime - result.startTime : 0 
                                                       def iconName = duration > 0 ? 'tick_green' : (duration == 0 ? 'cross_red' : 'traffic_cone')
                                                    %>
                                                    <td>
                                                      <img src="${resource(dir: 'images/skin', file: iconName + '.png')}"/>&nbsp;
                                                      <g:if test="${duration > 0}">
                                                        <span style="color:red">${duration/1000} sec.</span>
                                                      </g:if>
                                                    </td>                                                          
                                            </tr>
                                      </g:each>
                                      </tbody>
                              </table>
                          </div>
                        </g:if>
                        //-->
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
                                                                    def iconName = duration > 0 ? 'tick_green' : (duration == 0 ? 'cross_red' : 'traffic_cone')
                                                                  %>
                                                                  <td>
                                                                      <g:if test="${oldTask}">
                                                                        <g:if test="${prevResult.endTime > 0}">
                                                                              
                                                                          <g:if test="${!session?.user?.admin}">
                                                                            <g:if test="${duration == 0}">
                                                                              <g:link action="startTask" controller="result" params="[taskId: task.id, sessionId: sessionInstance.id]"><img src="${resource(dir: 'images/skin', file: 'icon_run.png')}"/></g:link>
                                                                            </g:if>
                                                                            <g:if test="${duration < 0}">
                                                                              <g:link action="stopTask" controller="result"  params="[taskId: task.id, sessionId: sessionInstance.id]"><img src="${resource(dir: 'images/skin', file: 'icon_stop.png')}"/></g:link>
                                                                            </g:if>
                                                                          </g:if>
                                                                          <g:else>
                                                                            <g:if test="${duration < 0}">
                                                                              <img src="${resource(dir: 'images/skin', file: iconName + '.png')}"/>
                                                                            </g:if>
                                                                          </g:else>
                                                                          
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
                                                                          <g:if test="${!session?.user?.admin}">
                                                                            <g:if test="${duration == 0}">
                                                                              <g:link action="startTask" controller="result" params="[taskId: task.id, sessionId: sessionInstance.id]"><img src="${resource(dir: 'images/skin', file: 'icon_run.png')}"/></g:link>
                                                                            </g:if>
                                                                            <g:if test="${duration < 0}">
                                                                              <g:link action="stopTask" controller="result"  params="[taskId: task.id, sessionId: sessionInstance.id]"><img src="${resource(dir: 'images/skin', file: 'icon_stop.png')}"/></g:link>
                                                                            </g:if>
                                                                          </g:if>  
                                                                          <g:else>
                                                                            <g:if test="${duration < 0}">
                                                                              <img src="${resource(dir: 'images/skin', file: iconName + '.png')}"/>
                                                                            </g:if>  
                                                                          </g:else>
                                                                          
                                                                          <g:if test="${duration > 0}">
                                                                            <span style="color:red">${duration/1000} sec.</span>
                                                                          </g:if> 
                                                                        </g:else>
                                                                      </g:else>
                                                                  </td>
                                                                  
                                                          </tr>
                                                          <% oldTask = task %>
                                                  </g:each>
                                                  </tbody>
                                          </table>
                                  </div>
				</g:if>

                        <g:if test="${session?.user?.admin}">
                            <g:form>
                                    <fieldset class="buttons">
                                            <g:hiddenField name="id" value="${sessionInstance?.id}" />
                                            <g:if test="${!sessionInstance?.hasAnyUntested()}">
                                            <g:link class="edit" action="edit" id="${sessionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                            </g:if>
                                            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                         
                                    </fieldset>
                            </g:form>
                        </g:if>  
		</div>
	</body>
</html>
