<%@ page import="fr.isima.webdev.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="tag.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="25" required="" value="${tagInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="tag.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${tagInstance?.description}"/>

</div>

