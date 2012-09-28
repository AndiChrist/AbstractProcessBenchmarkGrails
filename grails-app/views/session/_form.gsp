<%@ page import="abstractprocessbenchmarkgrails.Session" %>



<div class="fieldcontain ${hasErrors(bean: sessionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="session.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${sessionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sessionInstance, field: 'process', 'error')} required">
	<label for="process">
		<g:message code="session.process.label" default="Process" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="process" name="process.id" from="${abstractprocessbenchmarkgrails.Process.list()}" optionKey="id" required="" value="${sessionInstance?.process?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sessionInstance, field: 'sessionOwner', 'error')} required">
	<label for="sessionOwner">
		<g:message code="session.sessionOwner.label" default="Session Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sessionOwner" name="sessionOwner.id" from="${abstractprocessbenchmarkgrails.User.list()}" optionKey="id" required="" value="${sessionInstance?.sessionOwner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sessionInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="session.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${sessionInstance?.startDate}"  />
</div>

