<%@ page import="abstractprocessbenchmarkgrails.Process" %>



<div class="fieldcontain ${hasErrors(bean: processInstance, field: 'alias', 'error')} ">
	<label for="alias">
		<g:message code="process.alias.label" default="Alias" />
		
	</label>
	<g:textField name="alias" value="${processInstance?.alias}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: processInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="process.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${processInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: processInstance, field: 'domain', 'error')} required">
	<label for="domain">
		<g:message code="process.domain.label" default="Domain" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="domain" name="domain.id" from="${abstractprocessbenchmarkgrails.Domain.list()}" optionKey="id" required="" value="${processInstance?.domain?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: processInstance, field: 'sessions', 'error')} ">
	<label for="sessions">
		<g:message code="process.sessions.label" default="Sessions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${processInstance?.sessions?}" var="s">
    <li><g:link controller="session" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="session" action="create" params="['process.id': processInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'session.label', default: 'Session')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: processInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="process.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${processInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['process.id': processInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>

</div>

