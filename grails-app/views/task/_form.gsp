<%@ page import="abstractprocessbenchmarkgrails.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="task.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${taskInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'media', 'error')} required">
	<label for="media">
		<g:message code="task.media.label" default="Media" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="media" name="media.id" from="${abstractprocessbenchmarkgrails.Media.list()}" optionKey="id" required="" value="${taskInstance?.media?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'process', 'error')} required">
	<label for="process">
		<g:message code="task.process.label" default="Process" />
		<span class="required-indicator">*</span>
	</label>
        <g:hiddenField name="process.id" value="${taskInstance?.process?.id}" />${taskInstance?.process}
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'results', 'error')} ">
	<label for="results">
		<g:message code="task.results.label" default="Results" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${taskInstance?.results?}" var="r">
    <li><g:link controller="result" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="result" action="create" params="['task.id': taskInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'result.label', default: 'Result')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="task.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${abstractprocessbenchmarkgrails.Role.list()}" optionKey="id" required="" value="${taskInstance?.role?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'sequence', 'error')} required">
	<label for="sequence">
		<g:message code="task.sequence.label" default="Sequence" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sequence" type="number" value="${taskInstance.sequence}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'system', 'error')} required">
	<label for="system">
		<g:message code="task.system.label" default="System" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="system" name="system.id" from="${abstractprocessbenchmarkgrails.System.list()}" optionKey="id" required="" value="${taskInstance?.system?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'taskOwner', 'error')} required">
	<label for="taskOwner">
		<g:message code="task.taskOwner.label" default="Task Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="taskOwner" name="taskOwner.id" from="${abstractprocessbenchmarkgrails.User.list()}" optionKey="id" required="" value="${taskInstance?.taskOwner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'view', 'error')} required">
	<label for="view">
		<g:message code="task.view.label" default="View" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="view" name="view.id" from="${abstractprocessbenchmarkgrails.View.list()}" optionKey="id" required="" value="${taskInstance?.view?.id}" class="many-to-one"/>
</div>

