<%@ page import="fr.isima.webdev.Vote" %>



<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="vote.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${fr.isima.webdev.User.list()}" optionKey="id" required="" value="${voteInstance?.author?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="vote.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${voteInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="vote.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="message" name="message.id" from="${fr.isima.webdev.Message.list()}" optionKey="id" required="" value="${voteInstance?.message?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="vote.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${fr.isima.webdev.Vote$Type?.values()}" keys="${fr.isima.webdev.Vote$Type.values()*.name()}" required="" value="${voteInstance?.type?.name()}" />

</div>

