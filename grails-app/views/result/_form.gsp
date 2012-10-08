<%@ page import="abstractprocessbenchmarkgrails.Result" %>



<div class="fieldcontain ${hasErrors(bean: resultInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="result.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="endTime" type="number" value="${resultInstance.endTime}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: resultInstance, field: 'session', 'error')} required">
	<label for="session">
		<g:message code="result.session.label" default="Session" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="session" name="session.id" from="${abstractprocessbenchmarkgrails.Session.list()}" optionKey="id" required="" value="${resultInstance?.session?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resultInstance, field: 'startTime', 'error')} required">
	<label for="startTime">
		<g:message code="result.startTime.label" default="Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="startTime" type="number" value="${resultInstance.startTime}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: resultInstance, field: 'task', 'error')} required">
	<label for="task">
		<g:message code="result.task.label" default="Task" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="task" name="task.id" from="${abstractprocessbenchmarkgrails.Task.list()}" optionKey="id" required="" value="${resultInstance?.task?.id}" class="many-to-one"/>
</div>

